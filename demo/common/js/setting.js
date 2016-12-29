function confirmLogout() {
    $.confirm({
        animationBounce: 1.5,
        animationSpeed: 1000,
        title: '退出',
        content: '确认退出当前账号吗？',
        confirm: function(){
        },
        cancel: function(){
        }
    });
}