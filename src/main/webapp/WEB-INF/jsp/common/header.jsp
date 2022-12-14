<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${pageTitle}"/></title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="<c:url value="/css/site.css"/>" rel="stylesheet" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
            integrity="sha256-0rguYS0qgS6L4qVzANq4kjxPLtvnp5nn2nB5G1lWRv4=" crossorigin="anonymous"></script>



    <style>

        body {
            font-family: 'Roboto Slab', serif;;
            font-size: 17px;
            color: #344E41;
            background-color: #DAD7CD;
        }

        label {
            display: block;
        }

        .form-control {
            display: inline-block;
        }
    </style>

    <c:url var="bootstrapCss" value="/css/bootstrap.min.css"/>
    <c:url var="siteCss" value="/css/site.css"/>

    <c:url var="jQueryJs" value="/js/jquery.min.js"/>
    <c:url var="jqValidateJs" value="/js/jquery.validate.min.js"/>
    <c:url var="jqvAddMethJs" value="/js/additional-methods.min.js"/>
    <c:url var="jqTimeagoJs" value="/js/jquery.timeago.js"/>
    <c:url var="popperJs" value="/js/popper.min.js"/>
    <c:url var="bootstrapJs" value="/js/bootstrap.min.js"/>

    <link rel="stylesheet" type="text/css" href="${bootstrapCss}">
    <link rel="stylesheet" type="text/css" href="${siteCss}">

    <script src="${jQueryJs}"></script>
    <script src="${jqValidateJs}"></script>
    <script src="${jqvAddMethJs}"></script>
    <script src="${jqTimeagoJs}"></script>
    <script src="${popperJs}"></script>
    <script src="${bootstrapJs}"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("time.timeago").timeago();

            $("#logoutLink").click(function (event) {
                $("#logoutForm").submit();
            });

            var pathname = window.location.pathname;
            $("nav a[href='" + pathname + "']").parent().addClass("active");

        });
    </script>

</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a href="${homePageHref}"><img src="${imgSrc}" class="img-fluid" style="height: 50px;"/></a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav">
                <c:choose>
                    <c:when test="${not empty currentUser}">
                        <li><a href="<c:url value="/users/${currentUser.getUserName()}"/>" class="navbar-brand">Brewery Finder</a></li>

                        <c:url var="dashboardHref" value="/breweryList"/>
                        <li><a class="nav-link" href="${dashboardHref}">Brewery List</a></li>

                        <c:url var="masterListHref" value="/beerDirectory"/>
                        <li class="nav-item"><a class="nav-link" href="${masterListHref}">Beer Directory</a></li>

                        <c:if test="${currentUser.getRole().equals('admin')}">
                            <c:url var="userListHref" value="/userDirectory"/>
                            <li class="nav-item"><a class="nav-link" href="${userListHref}">User Directory</a></li>
                        </c:if>

                        <c:url var="editProfileHref" value="/users/${currentUser.getUserName()}/update"/>
                        <li class="nav-item"><a class="nav-link" href="${editProfileHref}">Edit Profile</a></li>

                    <%--
                        <c:url var="newMessageHref"
                               value="/users/${currentUser.getUserName()}/messages/new"/>
                        <li class="nav-item"><a class="nav-link" href="${newMessageHref}">New Message</a></li>
                        <c:url var="sentMessagesHref"
                               value="/users/${currentUser.getUserName()}/messages"/>
                        <li class="nav-item"><a class="nav-link" href="${sentMessagesHref}">Sent Messages</a></li>
                        <c:url var="changePasswordHref"
                               value="/users/${currentUser.getUserName()}/changePassword"/>
                        <li class="nav-item"><a class="nav-link" href="${changePasswordHref}">Change Password</a></li>
                        --%>

                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="/"/>" class="navbar-brand">Brewery Finder</a>
                    </c:otherwise>
                </c:choose>
            </ul>
            <ul class="nav navbar-nav">
                <c:choose>
                    <c:when test="${empty currentUser}">
                        <c:url var="newUserHref" value="/users/new"/>
                        <li class="nav-item"><a class="nav-link" href="${newUserHref}">Sign Up</a></li>
                        <c:url var="loginHref" value="/login"/>
                        <li class="nav-item"><a class="nav-link" href="${loginHref}">Log In</a></li>
                        <c:url var="logoutAction" value="/logout"/>
                    </c:when>
                    <c:otherwise>
                        <c:url var="logoutAction" value="/logout"/>
                        <form id="logoutForm" action="${logoutAction}" method="POST">
                            <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                        </form>
                        <li class="nav-item"><a id="logoutLink" href="#">Log Out</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>

<div class="container">