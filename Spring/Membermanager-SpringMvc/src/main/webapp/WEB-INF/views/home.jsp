<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Russo+One&display=swap" rel="stylesheet">
<title>Home</title>
<style>
#main{
width: 2100px;
height:1200px;
background-size: cover;
background-repeat: no-repeat;
}
#button{
margin-left:1800px;
margin-top:-320px;
padding:30px;
font-family: 'Russo One', sans-serif;
display: inline-block;
border-radius:60px;
opacity: 0.3;
}
</style>
</head>
<body>
<%-- <h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P> --%>

<img id="main" src="<c:url value="/images/main1.png"/>">
<button type ="submit" class="btn btn-light" id="button"><a style="font-size: 30px;text-decoration:none;color:black" href="<c:url value="main"/>">HOME -></a></button>
</body>
</html>