<!DOCTYPE html>
<%@ page import="java.util.*,user.*" %>
<% IUserRepository user = (UserRepository) session.getAttribute("user"); %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Welcome, <%= user.getUsername() %>!</title>

    <!-- Bootstrap core CSS -->
    <link href="../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/userhomepage.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">QuizIt</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/user/userHomePage.jsp">Home</a></li>
                <li><a href="/quiz/quizhomepage.jsp">Quiz</a></li>
                <li><a href="#feed">Feed</a></li>
                <% if(user.isAdmin()) {
                    out.println("<li><a href='/user/dashboard.jsp'>Admin</a></li>");
                }
                %>
                <li><a href="/user/messages.jsp">&#128172;</a></li>
            </ul>
            <form class="navbar-form navbar-right" action="/SignOutServlet" method="post">
                <button type="submit" class="btn btn-primary">Sign Out</button>
            </form>
            <form class="navbar-form navbar-right" action="../UserSearchServlet" method="post">
                <div class="form-group">
                    <input type="text" placeholder="&#128269;" class="form-control" name="username">
                </div>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
        <h1>Welcome back, <%= user.getUsername() %>!</h1>
        <p>Check out what's new.</p>
        <p><a class="btn btn-primary btn-lg" href="/quiz/quizhomepage.jsp" role="button">Take a Quiz &raquo;</a>
            <a class="btn btn-primary btn-lg" href="/quiz/createquiz.jsp" role="button">Create a Quiz &raquo;</a>
        </p>
    </div>
</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4">
            <h2>Announcements</h2>
            <ul class="list-group">
                <%
                    List<Announcement> announcementList = DatabaseTasks.GetAnnouncments();
                    for(int i=announcementList.size()-1; i >= 0; i--) {
                        out.println("<li class='list-group-item'>" + announcementList.get(i).date + ": " + announcementList.get(i).text + "</li>");
                    }
                %>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Quiz History</h2>
            <p>See the latest quizzes you took. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>Popular Quizzes</h2>
            <p>Try your luck with the latest and greatest.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>Achievements</h2>
            <p>See your Hall of Fame.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
    </div>

    <hr>

    <footer>
        <p>CS 108 Final Project</p>
    </footer>
</div> <!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="../dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>