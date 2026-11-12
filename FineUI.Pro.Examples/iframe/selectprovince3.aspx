<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectprovince3.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.selectprovince3" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/selectprovince3_child.aspx" />
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" IsFluid="true" Title="表单"  BodyPadding="10px"
        runat="server" EnableCollapse="false">
        <Items>
            <f:DropDownList ID="ddlSheng" Label="请选择省份" runat="server">
            </f:DropDownList>
            <f:Button ID="Button1" runat="server" Text="从弹出窗体中选择" ClickHandler="onOpenWindow1Click">
            </f:Button>
        </Items>
    </f:SimpleForm>
    <f:Window ID="Window1" Title="选择省份" Hidden="true" EnableIFrame="true" runat="server"
        EnableMaximize="true" EnableResize="true" Target="Parent" IsModal="true" 
		Width="562px" Height="470px"
        OnClose="Window1_Close" >
    </f:Window>
    <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
    </f:Label>
    <br />
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/selectprovince3_child.aspx") %>');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示子页面选择省份后，关闭选择窗体并回发父页面处理选择结果。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>选择并回填省份</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="从弹出窗体中选择">从弹出窗体中选择</strong>。<br />结果：打开本页省份地图子页面。</li>
        <li>在子页面点击北京地图热点。<br />结果：子页后台先取得省份，再隐藏窗体并触发父页关闭回发，父页按参数更新省份与结果标签。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="选择省份">选择省份</strong>）：初始为<code>true</code>，窗体内容使用独立省份选择页。</li>
        <li><code>GetHidePostBackReference()</code>（<strong>省份选择子页</strong>）：由子页后台生成关闭及父页通知动作，传入本次所选省份。</li>
    </ul>
</section>
</template>
</body>
</html>
