<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo_dynamic.aspx.cs"
    Inherits="FineUI.Pro.Examples.usercontrol.userinfo_dynamic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/usercontrol/UserInfoControl.ascx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <f:ContentPanel runat="server" ID="Panel1" IsFluid="true" EnableCollapse="false" BodyPadding="10px"
            Height="200px" Title="面板一（ContentPanel->UserInfoControl）">
        </f:ContentPanel>
        <br />
        <f:Panel runat="server" ID="Panel2" IsFluid="true" EnableCollapse="false" BodyPadding="10px"
            Height="200px" Title="面板二（Panel->UserControlConnector->UserInfoControl）">
        </f:Panel>
        <br />
        <f:Panel runat="server" ID="Panel3" IsFluid="true" EnableCollapse="false" BodyPadding="10px"
            Height="200px" Layout="Fit" Title="面板三（Layout=Fit, Panel->UserControlConnector->UserInfoControl）">
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>在后台动态加载同一用户控件到不同面板，每个实例显示自己的用户资料。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照容器中的用户资料</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="用户控件">用户控件</strong>和其它面板中的用户资料。<br />结果：各面板分别显示对应用户信息；填充布局使用容器可用空间，实例之间不共享输入或标识。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel3").ClientID %>' title="面板三（Layout=Fit, Panel-&gt;UserControlConnector-&gt;UserInfoControl）">面板三（Layout=Fit, Panel-&gt;UserControlConnector-&gt;UserInfoControl）</strong>）：初始为 <code>Fit</code>，规定容器内子控件的排列和空间分配方式。</li>
        <li><code>LoadControl()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="用户控件">用户控件</strong>）：后台加载用户控件后加入目标容器，动态实例使用稳定且不同的 ID。</li>
    </ul>
</section>
</template>
</body>
</html>
