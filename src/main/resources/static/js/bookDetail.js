// 호출
bookSearch();
function successFunction(data) {
    console.log('promise function',data);
    $("#totalSearchResult").append(data.documents.length + '건의 같은 이름의 도서가 있습니다.');

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