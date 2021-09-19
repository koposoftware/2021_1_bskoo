function foldDaumPostcode() {
	element_wrap.style.display = 'none';
}

function execDaumPostcode() {
	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = ''; 
			var extraAddr = '';

			if (data.userSelectedType === 'R') { 
				addr = data.roadAddress;
			} else { 
				addr = data.jibunAddress;
			}

			if (data.userSelectedType === 'R') {
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}

			} 

			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			document.getElementById("detailAddress").focus();

			element_wrap.style.display = 'none';

			document.body.scrollTop = currentScroll;
		},
		onresize: function(size) {
			element_wrap.style.height = size.height + 'px';
		},
		width: '100%',
		height: '100%'
	}).embed(element_wrap);

	element_wrap.style.display = 'block';
}