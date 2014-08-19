<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<title>GOALS - Generator Of Adaptive Learning Scenarios</title>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/welcome.css" />
<link rel="stylesheet" type="text/css" href="css/screen.css" />
<script src="script/jquery-2.1.0.js"></script>
<script src="script/jquery.validate.js"></script>
<script src="script/additional-methods.js"></script>
<script type="text/javascript">
$().ready(function() {

$("#user").validate({
		rules: {
			login: {
				required: true,
				minlength: 6
			},
			password: {
				required: true,
				minlength: 5
			}
		},
		messages: {
			login: {
				required: "Please enter a username",
				minlength: "Your username must consist of at least 6 characters"
			},
			password: {
				required: "Please provide a password",
				minlength: "Your password must be at least 5 characters long"
			}
		}
	});


});

</script>
</head>
<body>
	<header>
		<!-- header -->
		<a href="/"><img src="images/logo.png"></a>
	</header>
	<div>

		<section class="main">
			<s:form action="user" theme="simple" cssClass="form-1">

				<p class="field">
					<s:textfield name="login" placeholder="Username" >
						
					</s:textfield>
					<i class="fa fa-user fa-lg"></i>
				</p>
				<p class="field">
					<input type="password" name="password" placeholder="Password">
					<i class="fa fa-lock fa-lg"></i>
				</p>
				<p class="submit">

					<button type="submit" onclick="" >
						<i class="fa fa-arrow-right fa-lg"></i>
					</button>
				</p>
				
				<s:hidden name="action" value="login"></s:hidden>

			</s:form>
		</section>

	</div>
</body>

<script type="text/javascript">

	function submit()
	{
	alert(user.action);
		user.action = 'login';
	 	user.submit();
	}
</script>
</html>