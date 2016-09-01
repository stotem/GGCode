$(function(){
    $("a[data-target=#delWarnModal]").click(function(){
        var action = $(this).attr("data-action");
        var id = $(this).attr("data-id");
        $("#delWarnModalForm").prop("action", action).find("input[name=id]").val(id);
    });
    $(".search-control-btn").click(function(){
        var formItem = $(".search-item-container");
        $(this).html(formItem.is(":visible") ? "显示搜索":"隐藏搜索").blur();
        formItem.toggle(200);
        $(".search-btn").toggle(200);
    });
});

function goPage(pageNum) {
    var form = document.getElementById("queryForm");
    if(!form) {
        alert("Did not find #queryForm");
        return;
    }
    var pageNumField = document.getElementById("pageNumField");
    if(!pageNumField) {
        alert("Did not find #pageNumField");
        return;
    }
    pageNumField.value = pageNum;
    form.submit();
}