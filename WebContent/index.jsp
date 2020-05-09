<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>TỪ ĐIỂN ANH - VIỆT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
	<script>
		$(function () {
			var words = ${words};
		    $("#txtInput").blur(function(){
		         var keyEvent = $.Event("keydown");
		         keyEvent.keyCode = $.ui.keyCode.ENTER;
		         $(this).trigger(keyEvent);
		         return false; 
		     }).autocomplete({
		        source: function(request, response){
		        	var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex(request.term), "i" );
		            var results = $.ui.autocomplete.filter(words, request.term);
		        	response(results.slice(0, 10));
		        },
		        messages:{
		        	noResults:'',
		        	results: function(){}
		        },
		        autoFocus: true
		    });
		    
		});
	</script>
	
</head>
<body>
	<div>
		<div class="jumbotron">
			<h1>TỪ ĐIỂN ANH - VIỆT</h1>
			<p>Tra cứu từ điển Anh - Việt trực tuyến miễn phí</p>
		</div>
		
		<div style="text-align:center">
			<form action="dictionary-look-up" method="post" style="display: inline-block;">
				<table>
					<tr>
						<td colspan="2">
							<h2>TỪ ĐIỂN ANH - VIỆT</h2>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left">
							<label for="txtInput">Nhập từ cần tra</label>
						</td>
					</tr>
					<tr>
						<td class="ui-widget">
							<input type="text" id="txtInput" name="txtInput">
							<button type="submit" class="ui-state-default ui-corner-all">Tra từ</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<p style="display: block; margin-left: 10%;">
		<%@page import="java.util.*"%>
		<%
 			if(request.getAttribute("word")!=null){
 				String word = request.getAttribute("word").toString();
  				@SuppressWarnings("unchecked")
  				Hashtable<String, String> dictionary = (Hashtable<String, String>) request.getAttribute("dictionary");
  				if(dictionary.containsKey(word)){
  					out.println("<b>" + word + "</b><br>" + dictionary.get(word));
  				}else{
  	 				out.println("Không thể tìm thấy từ bạn đang tìm kiếm");
  				}
  				request.setAttribute("word", null);
 			}
		%>
	</p>
</body>
</html>

