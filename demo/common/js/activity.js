/**
 * Created by Tonndiyee on 2016/10/17.
 */
$(function () {
    //时间格式设置
    $(".form_datetime").datetimepicker({format: "YYYY-MM-DD hh:mm"});
    //初始化文件控制器
    initFileInput("activity_pic","/projects/demo1/common/img/activity_pic");
});

function confirmEdit(item) {
    var activityNameNade = item.previousElementSibling
    $.confirm({
        animationBounce: 1.5,
        animationSpeed: 1000,
        title: '确认编辑',
        content: '确认编辑活动'+'"'+userName+'"'+"吗？",
        confirm: function(){
            $.alert('更改已保存');
        },
        cancel: function(){
        }
    });
}

function isAgree(){
    var is = document.getElementById("isAgree");
    var bt = document.getElementById("addActivity");
    if(!is.checked){
        bt.disabled=true;
    }else{
        bt.disabled=false;
    }
}
function showMineTab() {
    $('#myTab').find('a[href="#mine"]').tab('show')
}
function showAddTab() {
    $('#myTab').find('a[href="#add"]').tab('show')
}
function showJoinTab() {
    $('#myTab').find('a[href="#join"]').tab('show')
}
function initFileInput(ctrlName, uploadUrl) {
    var control = $('#' + ctrlName);
    control.fileinput({
        language: 'zh', //设置语言
        uploadUrl: uploadUrl, //上传的地址
        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
    });
}