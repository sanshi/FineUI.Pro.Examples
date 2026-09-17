
function initControlInfo(infoClientID, options) {
    F(infoClientID).setValue(options.userName + '今年' + options.userAge + '岁，住在' + options.userCountry + '。');
}

function showControlInfo(infoClientID) {
    F.notify({
        message: '当前控件信息：' + F(infoClientID).getValue(),
        messageIcon: 'information',
        target: '_top',
        header: false,
        displayMilliseconds: 2000,
        positionX: 'center',
        positionY: 'center'
    });
}

// 「当前控件信息」按钮的 click 事件处理函数（用户控件在代码里写 ClickHandler="onClientScriptClick"）。
// 一个页面可以放多份这个用户控件，它们共用这一个函数，
// 各自要显示哪个标签由按钮自己的 data-tag 带着（值是那份实例里 labUserInfo 的客户端 id）。
function onClientScriptClick(event) {
    showControlInfo(this.getAttr('data-tag'));
}
