<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" type="text/css" href="../css/sidebar.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
  $( function() {
    $( "#accordion" ).accordion({
      collapsible: true
      
    });
  } );
 </script>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/>
	<aside class="recipe_sidebar">
	
        <div class="recipe_side0">
            <h3 id="recipe"><p>레시피</p></h3>
        </div>
		
		<div id="accordion">
            <h3><a href="#">양식</a></h3>
            <ul>
                <li><a href="#">파스타</a></li>
                <li><a href="#">리조또</a></li>
                <li><a href="#">스테이크</a></li>
                <li><a href="#">피자</a></li>
                <li><a href="#">오믈렛</a></li>
            </ul>
        
            <h3><a href="#">한식</a></h3>
            <ul>
                <li><a href="#">김치볶음밥</a></li>
                <li><a href="#">된장찌개</a></li>
                <li><a href="#">김치찌개</a></li>
                <li><a href="#">고등어조림</a></li>
                <li><a href="#">고추장삼겹살</a></li>
            </ul>
        
            <h3><a href="#">중식</a></h3>
            <ul>
                <li><a href="#">마라탕</a></li>
                <li><a href="#">탕후루</a></li>
                <li><a href="#">짬뽕</a></li>
                <li><a href="#">잡채밥</a></li>
                <li><a href="#">유린기</a></li>
            </ul>
        
            <h3><a href="#">일식</a></h3>
            <ul>
                <li><a href="#">초밥</a></li>
                <li><a href="#">호토마키</a></li>
                <li><a href="#">우동</a></li>
                <li><a href="#">가라아게</a></li>
                <li><a href="#">덴뿌라</a></li>
            </ul>
        </div>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/>
    </aside>
</body>
</html>