/**
 * Created by Tonndiyee on 2016/10/18.
 */
function delete_my(item) {
    var userNameNode = item.previousSibling.previousSibling;
    var userName = ((userNameNode.childNodes).item(1)).childNodes.item(0).lastChild.nodeValue;
    $.confirm({
        animationBounce: 1.5,
        animationSpeed: 1000,
        title: '删除好友',
        content: '确认删除好友'+'"'+userName+'"'+"吗？",
        confirm: function(){
             $.alert('好友已删除！');
        },
        cancel: function(){
        }
    });
}