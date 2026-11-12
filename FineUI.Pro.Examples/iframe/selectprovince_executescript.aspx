<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectprovince_executescript.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.selectprovince_executescript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/selectprovince_executescript_child.aspx" />
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" IsFluid="true" Title="表单"  BodyPadding="10px"
        runat="server" EnableCollapse="false">
        <Items>
            <f:DropDownList ID="ddlSheng" Label="请选择省份" runat="server">
            </f:DropDownList>
            <f:Button ID="Button1" runat="server" Text="从列表中选择" ClickHandler="onOpenWindow1Click">
            </f:Button>
        </Items>
    </f:SimpleForm>
    <f:Window ID="Window1" Title="编辑" Hidden="true" EnableIFrame="true" runat="server"
        EnableMaximize="true" EnableResize="true" Target="Parent" IsModal="true"
		Width="562px" Height="470px">
    </f:Window>
    <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
    </f:Label>
    <br />
    </form>
    <script>
        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/selectprovince_executescript_child.aspx") %>');
        }

        var shengClientID = '<%= ddlSheng.ClientID %>';

        function selectProvince(name) {
            F(shengClientID).setValue(name);
        }
    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示子页面选择省份后，关闭选择窗体并执行父页面脚本回填结果。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>选择并回填省份</h3>
    <ol>
        <li>在子页面点击北京地图热点。<br />结果：子页后台先取得省份，再隐藏窗体并执行父页 <code>selectProvince</code> 脚本，父页字段随之更新。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="编辑">编辑</strong>）：设为<code>true</code>，窗体内容使用独立省份选择页。</li>
        <li><code>GetHideExecuteScriptReference()</code>（<strong>省份选择子页</strong>）：由子页后台生成关闭及父页通知动作，传入本次所选省份。</li>
    </ul>
</section>
</template>
</body>
</html>
