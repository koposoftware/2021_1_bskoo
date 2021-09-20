package kr.ac.kopo.admincard.service;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.admincard.DAO.AdminCardDAO;
import kr.ac.kopo.admincard.vo.AdminCardVO;

@Service
public class AdminCardServiceImpl implements AdminCardService {

	@Autowired
	private AdminCardDAO adminCardDAO;

	public List<AdminCardVO> selectReccomendationCard(int no) {
		List<AdminCardVO> recommendationCard = adminCardDAO.selectReccomendationCard(no);
		return recommendationCard;
	}

	public List<AdminCardVO> selectCardList() {
		List<AdminCardVO> cardList = adminCardDAO.selectCardList();
		return cardList;
	}

	public List<AdminCardVO> selectCardInfo(int no) {
		List<AdminCardVO> cardInfo = adminCardDAO.selectCardInfo(no);
		return cardInfo;
	}

	public int selectMemberCount(Map<String, Object> param) {
		int memberCount = adminCardDAO.selectMemberCount(param);
		return memberCount;
	}

	public List<AdminCardVO> selectEmailAddress(AdminCardVO vo) {

		List<AdminCardVO> emailList = adminCardDAO.selectEmailAddress(vo);
		return emailList;
	}

	public void sendingMail(AdminCardVO vo) {
		List<AdminCardVO> emailList = selectEmailAddress(vo);

		String mail_id = "99bonseong@gmail.com";
		String mail_pw = "6dnjf2dlf!@#";

		System.out.println(emailList);

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mail_id, mail_pw);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mail_id));

			/*
			 * for(AdminCardVO email : emailList) {
			 * message.addRecipient(javax.mail.Message.RecipientType.TO, new
			 * InternetAddress(email.getEmailAddress())); message.setSubject("[다이나믹하나] " +
			 * email.getName() +"님 소비내역 기반 추천카드입니다."); message.setText(vo.getMailContent());
			 * }
			 */
			
			// 수신자 메일 주소
			String email="9bonseong@naver.com";
			message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));

			// Subject
			message.setSubject("[다이나믹하나] 구본성님 소비내역 기반 추천카드입니다."); // 메일 제목을 입력

			// Text
			message.setText(vo.getMailContent()); // 메일 내용을 입력

			// send the message
			Transport.send(message); //// 전송

			System.out.println("성공적으로 전송했습니다.");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

}
