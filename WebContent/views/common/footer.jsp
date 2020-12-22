<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>REVIEW:0127</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        #footer{
        	width:100%;
            background-color:  #2A303D;
            height: 100px;
            text-align: center;
        }
        #footer-wrap {
 		 	width: 1200px;
    		height: 100%;
    		padding-top:20px;
    		margin: 0 auto;
		}
        #footer-wrap span{
            color: white;
            line-height:30px;
            text-align:center;
        }
        #goToAdmin{
        	border-radius : 20px;
        	background-color: rgb(255,255,255,0.5);
        	display:inline-block;
        	width:70px;
        	position:relative;
        	top:-30px;
        	left: 500px;
        	color:#2A303D;
        }
        #goToAdmin:link{
        	text-decoration : none;
        }
        @media (max-width:1200px){
 		   #footer{ width: 1200px;}
		}
    </style>
</head>
<body>
	<div id="footer">
	<div id="footer-wrap">
        <span>Copyright © 2020 REVIEW:0127 All rights reserved.</span><br>
        <span>관리자 문의 : rvw0127@gmail.com</span><br>
        <a id="goToAdmin" href="/admin/login.jsp">관리자</a>
    </div>
    </div>
</body>
</html>