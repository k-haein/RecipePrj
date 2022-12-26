/* 회원가입 중 유효성 검사를 위한 JS
 */
 
 $(function(){
	// 사용자의 자료 입력여부를 검사하는 함수
	$('#confirm').click(function(){
    	if( $.trim($("#MEM_ID").val()) == '' ){
            alert("아이디를 입력해 주세요.");
            $("#MEM_ID").focus();
            return;
        }
    	
    	if($.trim($('#MEM_PWD').val())==''){
    		alert("비번입력해주세요.");
    		$('#MEM_PWD').focus();
    		return;
    	}
    	
    	/*if($.trim($('#MEM_PWD').val()) != $.trim($('#MEM_PWD2').val())){
    		alert("비밀번호가 일치하지 않습니다..");
    		$('#MEM_PWD2').focus();
    		return;
    	} //비밀번호 확인
    	*/
    	
    	
    	if($.trim($('#MEM_NAME').val())==''){
    		alert("이름입력해주세요.");
    		$('#MEM_NAME').focus();
    		return;
    	}
       
        // 자료를 전송합니다.
        document.userinput.submit();
	});
	
	//아이디 중복체크
	$('#idcheck').click(function(){
		
        $.ajax({
        	type:'post',
        	url : 'idcheck.do',
        	data :  "MEM_ID="+ $('#MEM_ID').val(),
        	contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
        	success : function(resultData){
        		$('#idCheckResult').html(resultData);
        	},
        	error : function(err){
        		alert('error');
        	}
        	
        }); // ajax 닫는곳
        
	}) // 아이디 click 닫는곳
})