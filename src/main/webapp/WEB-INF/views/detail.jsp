<%--
  Created by IntelliJ IDEA.
  User: seon2
  Date: 2021-10-19
  Time: 오후 5:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>북 상세정보</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<style>
    th { width : 100px; }
    #totalSearchResult {
        color: darkslateblue;
        font-weight: bold;
    }
    .bookTb {
        margin-top: 60px;
    }
</style>
<body>
    <a href=/main>이전</a>
    <input type="hidden" id="searchVal" value="${title}" />

    <div style="text-align: center">
        <h3>상세 정보</h3>
        <p id="totalSearchResult"></p>
    </div>
    <div id="thumbnail" style="float: left"></div>
    <div>
        <table class="bookTb"></table>
    </div>

</body>
<script src="/resources/static/js/bookSearch.js"></script>
<script src="/resources/static/js/bookDetail.js"></script>
</html>
