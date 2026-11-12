<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jscontrolpage.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.jscontrolpage" %>

<%@ Register Src="JSControl.ascx" TagName="JSControl" TagPrefix="uc1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/usercontrol/JSControl.ascx;~/usercontrol/jscontrol.js" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <f:Panel runat="server" ID="Panel4" IsFluid="true" EnableCollapse="false" Height="400px" Layout="VBox" BoxConfigAlign="Stretch"
            BoxConfigPosition="Start" BodyPadding="10px" BoxConfigSpace="5" Title="面板一">
            <Items>
                <f:UserControlConnector ID="UserControlConnector4" runat="server">
                    <uc1:JSControl ID="UserInfoControl4" UserName="陈萍萍" UserAge="20" UserCountry="合肥" runat="server" />
                    <uc1:JSControl ID="UserInfoControl5" UserName="胡斐" UserAge="22" UserCountry="驻马店" Margin="0" BoxFlex="1" runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>从用户控件自己的客户端脚本操作其内部控件，避免把命名容器中的 ID 写死。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>使用用户控件内的脚本入口</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel4").ClientID %>' title="面板一">面板一</strong>中分别点击两份用户控件的<strong>当前用户控件信息</strong>按钮。<br />结果：通知分别显示陈萍萍今年20岁、住在合肥，以及胡斐今年22岁、住在驻马店；共用脚本仍读取各自的标签。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ClientID</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel4").ClientID %>' title="面板一">面板一</strong>）：客户端通过服务器输出的实际标识查找控件，不假定用户控件的命名容器前缀。</li>
    </ul>
</section>
</template>
</body>
</html>
