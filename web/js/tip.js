//提示语句
function toastMsg(msg) {
    if ($("div").is("#toastMessage")) {  // 判断页面是否存在  存在的话删除
        $("#toastMessage").remove();
    }
    var msgDiv = '<div id="toastMessage" class="toast-message">' +
        '<span>' + msg + '</span>' +
        '</div>';
    $("body").append(msgDiv); //再添加上去替代
    var screenHeight = window.innerHeight;  //获取窗口的高
    var toastMessage = $("#toastMessage");
    var toastHeight = toastMessage.height();
    var top = (screenHeight / 2) - (toastHeight / 2) + "px";
    toastMessage.css("top", top);    //垂直居中显示
    setTimeout(function () {    // 设置消失时间
        $("#toastMessage").remove();
    }, 1500);
}