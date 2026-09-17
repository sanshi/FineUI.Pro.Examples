<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_dynamic_columns2.aspx.cs"
    Inherits="FineUI.Pro.Examples.data.grid_dynamic_columns2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/ITemplate.cs" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" runat="server" EnableCheckBoxSelect="true"
            Title="表格（动态创建的列）">
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>所有动态创建控件的代码都要放到 Page_Init 中，详情：<a href="http://www.cnblogs.com/sanshi/archive/2012/11/19/2776672.html">三石的博客</a>。</li>
            <li>FineUI.Pro支持在页面第一次初始化时动态创建控件，但是不支持在回发时动态创建控件。</li>
        </ul>
    </form>
</body>
</html>
