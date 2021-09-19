# install.packages("rJava")
# install.packages("DBI")
# install.packages("RJDBC")
# install.packages('Rserve','http://www.rforge.net/') #자바 연동

#************오라클 연동 lib************
library(rJava)
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_281')
# library(DBI)
library(RJDBC)

#************자바 연동 lib************
library(Rserve)
Rserve(FALSE, port=6311, args = '--RS-encoding utf8 --no-svae --slave
       --encoding utf8 --internet2')
Rserve(args = "--RS- encoding utf8")


#************오라클에서 데이터 가져오기************
# 1. Driver Loading
drv<-JDBC(driverClass = "oracle.jdbc.driver.OracleDriver", classPath = "C:/Users/HP/Desktop/ojdbc8.jar")

# 2. Connection
conn <-dbConnect(drv, "jdbc:oracle:thin:@192.168.217.202/KOPODA", "DA2103", "da03")

query <- "SELECT MEMBER_NO, CATEGORY, SUB_TOTAL FROM(
SELECT MEMBER_NO, CATEGORY, SUM(AMOUNT) AS SUB_TOTAL , COUNT(AMOUNT) AS CNT FROM(
SELECT MC.MEMBER_NO, H.CARD_NO, H.CATEGORY, H.AMOUNT FROM MEMBER_CARD MC, TRANSACTION_HISTORY H WHERE MC.CARD_NO = H.CARD_NO AND  H.HISTORY_DATE BETWEEN TO_CHAR('2018-04-01') AND TO_CHAR('2018-04-30'))
GROUP BY MEMBER_NO, CATEGORY)
WHERE CNT > 5 ORDER BY MEMBER_NO"

dbGetQuery(conn, query)
main_data <- data.frame(dbGetQuery(conn, query))




#데이터 및 패키지 로드
library(dplyr)
library(reshape2)
library(caret)
library(tibble)
library(lubridate)

#main_data<-read.csv('d:/rtest/main.csv') ## 추후 DB 쿼리로 로드
pivot_data <- dcast(main_data, MEMBER_NO ~ CATEGORY, value.var = "SUB_TOTAL" ,sum)


member_no <- pivot_data[,1]
pivot_data<- pivot_data[,-1]

## min-max 스케일링
model_minmax<-preProcess(pivot_data, method="range")
scaling_data<-predict(model_minmax, pivot_data)

card_prcomp <- prcomp(scaling_data)

# 주성분 추출
k=0
R=0

pca <- function(dataset){
  pc <<- prcomp(dataset)
  k <<- 0
  R <<- 0
  
  while(R < 0.8) {
    k <<- k + 1
    R <<- sum(pc[[1]][1:k]^2)/sum(pc[[1]]^2)
    
    cat("주성분 갯수 : ", k,", 누적분산 : ", R, "\n", "\n", sep="")
  }
  SelectedDataSet = pc[[5]][,1:k]
  return(SelectedDataSet)
}


pca_card<-card_prcomp$rotation


result<-pca(scaling_data)

# 주성분 축약
temp_mat<-pca_card[,1:k]


max_index <- as.numeric(apply(apply(temp_mat, 2, abs),2,which.max))

for (i in 1:dim(temp_mat)[2]){
  for (j in 1:dim(temp_mat)[1]){
    if (temp_mat[max_index[i],i]>0){
      if(!temp_mat[j,i]>0.2){
        temp_mat[j,i]<-0
      }
    }else if (temp_mat[max_index[i],i]<0){
      if(!temp_mat[j,i]<(-0.2)){
        temp_mat[j,i]<-0
      }
    }
    
  }
}

#결과 데이터프레임
result_df<-data.frame(GROUP=character(), CATEGORY=character())

for (i in 1:dim(temp_mat)[2]){
  for (j in 1:dim(temp_mat)[1]){
    if(temp_mat[j,i]!=0){
      result_df<-rbind(result_df, c(i, rownames(temp_mat)[j]))
      
    }
  }
}

names(result_df)<-c("GROUP", "CATEGORY")





result<-as.data.frame(result)
result[,"group"]<-0

#cutoff<-0.05

#결과 추출
for(i in (dim(result)[2]-1):1){
  for(j in 1:dim(result)[1]){
    if (temp_mat[max_index[i],i]>0){
      if(result[j,i]>as.numeric(apply(result,2,mean))[i]+0.5*as.numeric(apply(result,2,sd))[i]){
        result[j,k+1]<-i
        }
    }else if(temp_mat[max_index[i],i]<0){
      if(result[j,i]<(as.numeric(apply(result,2,mean))[i]-0.5*as.numeric(apply(result,2,sd))[i])){
        result[j,k+1]<-i
      }
    }
    
  }
}


member_grouping<-cbind(member_no, result['group'])
names(member_grouping)<- c('MEMBER_NO', 'CLUSTER_NO')


names(result_df)<-c("CLUSTER_NO", "CATEGORY")

result
member_grouping
result_df

result%>%group_by(group)%>%
  summarise(n=n())


## final result
member_grouping
result_df

query<-"INSERT INTO PCA_MEMBER(MEMBER_NO, CLUSTER_NO) VALUES(?,?)"
dbSendUpdate(conn, query, member_grouping$MEMBER_NO, member_grouping$CLUSTER_NO)

query<-"INSERT INTO PCA_COMPONENT(CLUSTER, CLUSTER_NO) VALUES(?,?)"
