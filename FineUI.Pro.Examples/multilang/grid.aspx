<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid.aspx.cs" Inherits="FineUI.Pro.Examples.multilang.grid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="<%$ Resources:GridTitle %>" runat="server" EnableCollapse="false"
            DataIDField="Id" DataTextField="Name" DataKeyNames="Id,Name,Major">
            <Columns>
                <f:RowNumberField />
                <f:RenderField Width="150px" ColumnID="Name" DataField="Name" HeaderText="<%$ Resources:Field_Name %>" />
                <f:RenderField Width="150px" ColumnID="Gender" HeaderText="<%$ Resources:Field_Gender %>" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="150px" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="<%$ Resources:Field_EntranceYear %>" />
                <f:RenderCheckField ColumnID="AtSchool" Width="150px" RenderAsStaticField="true" DataField="AtSchool"
                    HeaderText="<%$ Resources:Field_AtSchool %>" />
                <f:RenderField ColumnID="Major" HeaderText="<%$ Resources:Field_Major %>" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                    RendererFunction="renderMajor" />
                <f:RenderField Width="150px" DataField="LogTime" HeaderText="<%$ Resources:Field_LogTime %>" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button CssClass="marginr" ID="Button1" runat="server" Text="<%$ Resources:ShowSelectedRows %>" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="<%$ Resources:ShowSelectedRowsClient %>" ClickHandler="onButton2Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>

    <script type="text/javascript">
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onButton2Click(event) {
            notifySelectedRows(grid1ClientID);
        }

    </script>

    <!-- 输出多语言资源 -->
    <script type="text/javascript">
        <%= FineUI.Pro.PageContext.GetJavaScriptResourcesReference<Resources.SharedJavaScriptResources>() %>

    </script>

<template id="example-description">
<section aria-label="页面描述">
    <p>从本地化资源生成界面文字，对照同一页面的中文和英文。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换界面语言</h3>
    <ul>
        <li>使用页面提供的中文、英文语言链接分别进入本页。<br />结果：<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>的标题、字段标签或列头、按钮文字按所选语言重新生成；此操作重新加载页面。</li>
        <li>对照中英文界面中的相同记录或节点。<br />结果：业务标识与数据含义保持，显示文字按当前语言翻译。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>_R()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：读取当前语言的资源文字，分别用于标题、字段、按钮或节点。</li>
        <li><code>语言参数</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：语言链接重新请求当前页面，由本端语言设置选择资源，不是仅替换一段可见文本。</li>
    </ul>
</section>
</template>
</body>
</html>
