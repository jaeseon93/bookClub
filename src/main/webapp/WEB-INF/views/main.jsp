<%--
  Created by IntelliJ IDEA.
  User: seon2
  Date: 2021-10-19
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <title>북클럽</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/resources/static/js/bookSearch.js"></script>
</head>
<style>
    #bookTb {
        margin-top: 50px;
        border-spacing: 30px;
    }
    #bookTb > td { text-align: center; }
    .center { text-align: center; }
    #searchVal {
        height: 35px;
        vertical-align: 30px;
    }
    #searchBtn { vertical-align: 30px; }
</style>

<body>
<div>

    <div class="center">
        <img src="/resources/static/img/bookClub.jpg" width="20%"/>
    </div>
    <div class="center">
        <h2>BookClub :: 북 클럽</h2>
    </div>
    <div class="center">
        <img src="/resources/static/img/search.jpg" width="5%"/>
        <input type="text" size="30" id="searchVal" placeholder="검색할 책 이름을 입력 해주세요.">
        <button type="button" id="searchBtn" onclick="bookSearch(oldVal)">검색</button>
    </div>
</div>

    <table id="bookTb">
        <tr id="firstTr"></tr>
        <tr id="firstTrTitle"></tr>
        <tr id="secTr"></tr>
        <tr id="secTrTitle"></tr>
    </table>
</body>
<script>
    let oldVal = "";
    function successFunction(data) {
        console.log('promise function',data);
        // 이전 검색 값이 있으면 저장
        oldVal = $("#searchVal").val();

        if(data.meta.pageable_count == 0) {
            alert('요청하신 검색 결과가 없습니다.');
        } else {

            $.each(data.documents, function (i, val) {
                var html = "";
                var title = "";
                var thumbnail = "";

                if(val.thumbnail != "") {
                    thumbnail = '<img src="'+val.thumbnail+'"/>';
                } else { thumbnail = '<img src="/resources/static/img/noImage.jpg" width="50%"/>'; }

                console.log('val:', val);
                let index = i+1;
                console.log('index:', index);

                if(index >= 6) {
                    html += '<td><p>' + index + '</p><a href="#" onclick="bookDetail(\'' + val.title + '\', \'' + index + '\')">'+thumbnail+'</a></td>';
                    $("#secTr").append(html);
                    title += '<td><p>'+ val.title +'</p></td>';
                    $("#secTrTitle").append(title);
                } else {
                    html += '<td><p>'+ index +'</p><a href="#" onclick="bookDetail(\'' + val.title + '\', \'' + index + '\')">'+thumbnail+'</a></td>';
                    $("#firstTr").append(html);
                    title += '<td><p>'+ val.title +'</p></td>';
                    $("#firstTrTitle").append(title);
                }
            });
         }

    }

    function bookDetail(title, index) {
        location.href = "/book/detail/" + index + "/" + title;
    }

</script>
</html>
