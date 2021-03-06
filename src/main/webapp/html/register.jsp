<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../style/register/register.css" rel="stylesheet" type="text/css">
<link rel="icon" href="/images/dgut.jpg">
	<link rel="stylesheet" type="text/css" href="/style/normal.css">
	<link rel="stylesheet" type="text/css" href="/style/index/index.css">
	<script type="text/javascript" src="/js/normal.js"></script>	
</head>
<body>

<div id="top">
    <jsp:include page="/html/top.jsp"/>
</div>

	<div class="outlineDiv">
		<form>
			<div class="titleDiv">用户注册</div>
		    <div class="partDiv">
				<div class="partLeft">账号:</div>
				<div class="partRight">
				  <input class="input" type="text" name="accountNumber" id="accountNumber"  placeholder=" ">
				  <br><span id="accountSpan"></span>
				</div>
			</div>
		  <div class="partDiv">
				<div class="partLeft">密码:</div>
				<div class="partRight">
					<input class="input" onBlur="passwordCheck()" type="password" name="password" id="password" placeholder=" 密码只能输入6-20个字母、数字、下划线">
					<span id="passwordSpan"></span>
				</div>
		    </div>
			<div class="partDiv">
				<div class="partLeft">确认密码:</div>
				<div class="partRight">
					<input class="input" onBlur="passwordSameCheck()" type="password" name="password2" id="password2" placeholder=" 再次输入密码">
					<span id="password2Span"></span>
				</div>
		    </div>
		    <div class="partDiv">
				<div class="partLeft">类型:</div>
				<div class="partRight">
					<select  class="select" name="roleType">
						<option value="teacher">教师</option>
						<option value="secondAdministrator">二级管理员</option>
						<option value="superAdministrator">超级管理员</option>
					</select>
					<span ></span>
				</div>
			</div>
		  <div class="partDiv">
				<div class="partLeft">电子邮箱:</div>
				<div class="partRight">
					<input class="input" onBlur="emailCheck()" type="email" name="email" id="email" placeholder=" 请输入有@的电子邮箱"/>
					<span id="emailSpan"></span>
				</div>
		  </div>
		  <div class="partDiv">
				<div class="partLeft">手机号:</div>
				<div class="partRight">
					<input class="input" onBlur="TelCheck()" type="text" name="telNumber" id="telNumber" placeholder=" 请输入11位手机号"/>
					<span id="telNumberSpan"></span>
				</div>
		  </div>
		  <div ><input class="login" type="submit" value="提交注册信息"/></div>
		</form>		
	</div>



<div id="bottom">
    <jsp:include page="/html/bottom.jsp"/>
</div>

<div id="copyrights">
    <jsp:include page="/html/copyright.jsp"/>
</div>

<script type="text/javascript">
		function emailCheck(){
			var pattern = new RegExp("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$","i");//创建模式对象
			var str1=document.getElementById("email").value;//获取文本框的内容
			
			if(str1.length>=8 && pattern.test(str1)){//pattern.test() 模式如果匹配，会返回true，不匹配返回false
				document.getElementById("emailSpan").innerHTML=("");
				return true;
			}else{
				document.getElementById("emailSpan").innerHTML=("*电子邮箱格式错误!");
				return false;
			}
		}
		function TelCheck(){
			var str=document.getElementById("telNumber").value;//获取文本框的内容
			if(!(/^1[34578]\d{9}$/.test(str))){ 
        		document.getElementById("telNumberSpan").innerHTML=("*手机号码有误，请重填");  
        		return false; 
    		} 
			else{
				document.getElementById("telNumberSpan").innerHTML=("");
				return true;
			}
		}
	    function passwordCheck(){
			var str = document.getElementById("password").value;
			var pattern=/^(\w){6,20}$/;

			if(document.getElementById("password").value==null || document.getElementById("password").value==""){
				document.getElementById("passwordSpan").innerHTML="*不能为空";
				return false;
			}else if(str.match(pattern)==null){
				document.getElementById("passwordSpan").innerHTML="*密码只能输入6-20个字母、数字、下划线";
				return false;
			}else{
				document.getElementById("passwordSpan").innerHTML="";
				return true;
			}
		}
		function passwordSameCheck(){
			var str = document.getElementById("password").value;
			if(document.getElementById("password2").value==null || document.getElementById("password2").value==""){
				document.getElementById("password2Span").innerHTML="*不能为空";
				return false;
			}else if(document.getElementById("password").value==document.getElementById("password2").value){			
				document.getElementById("password2Span").innerHTML="";
				return true ;
			}else{
				document.getElementById("password2Span").innerHTML="*两次密码不一样";
				return false;
			}	
		}
	</script>


</body>
</html>