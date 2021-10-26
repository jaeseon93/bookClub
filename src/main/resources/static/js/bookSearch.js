function bookSearch (oldVal) {
    let curVal = $("#searchVal").val();

    if(oldVal != "") {
        if(oldVal != curVal || oldVal == curVal)
        $("#firstTr").empty();
        $("#firstTrTitle").empty();
        $("#secTr").empty();
        $("#secTrTitle").empty();
    }

    if($("#searchVal").val() == null || $("#searchVal").val() == "") {
        alert('검색할 책 이름을 입력해주세요.')
        return false;
    }

    var promise =
        $.ajax({
            url:"https://dapi.kakao.com/v3/search/book?target=title",
            data: { query : curVal },
            headers: {
                Authorization: "KakaoAK 39bd412498b6c1e518746c4f4d96760f"
            }
        });

    promise.done(successFunction);

}