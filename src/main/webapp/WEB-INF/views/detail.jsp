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
    <script src="/resources/static/js/bookSearch.js"></script>
</head>
<style>
    th { width : 100px; }
</style>
<body>
    <a href=/main>이전</a>
    <input type="hidden" id="searchVal" value="${title}" />
    <p id="totalSearchResult"></p>
    <div style="text-align: center">
        <h3>상세 정보</h3>
    </div>
    <div id="thumbnail" style="float: left"></div>
    <div>
        <table class="bookTb"></table>
    </div>

</body>
<script>
    // 호출
    bookSearch();
    function successFunction(data) {
        console.log('promise function',data);
        $("#totalSearchResult").append(data.documents.length + '건의 같은 이름의 도서가 있습니다.')

        $.each(data.documents, function (i, val) {
            console.log('val:', val);
            let index = i+1;
            var date = val.datetime;
            date = date.substr(0,10);

            var thumbnail = "";
            if(val.thumbnail != "") {
                thumbnail = '<img src="'+val.thumbnail+'"/>';
            } else { thumbnail = '<img src="/resources/static/img/noImage.jpg" width="100%"/>'; }

            $('.bookTb').append('<tr><th colspan="2" rowspan="7"><p>' + index + '</p> ' + thumbnail + ' </th></tr>')
                        .append('<tr><th colspan="2">'+val.title+' / '+val.authors+'</th></tr>')
                        .append('<tr><th>내용</th><td>'+val.contents+'</td></tr>')
                        .append('<tr><th>출간일</th><td>'+date+'</td></tr>')
                        .append('<tr><th>출판사</th><td>'+val.publisher+'</td></tr>')
                        .append('<tr><th>정가</th><td>'+val.price+'</td></tr>')
                        .append('<tr><th>상세정보</th><td><button type="button" onclick="window.open(\''+ val.url + '\')">보러가기</button></td></tr>')
        });
    }

</script>
</html>
