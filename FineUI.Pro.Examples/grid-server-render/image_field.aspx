<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="image_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.image_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>图片列：路径与尺寸</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="图片列：路径与尺寸"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:ImageField ColumnID="Group" HeaderText="分组图片" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" ImageWidth="32px"
                    ImageHeight="32px" />
            </Columns>
        </f:Grid>
        <p>ImageField 在服务端按字段拼出图片地址并设置尺寸；新项目优先使用 RenderField 的渲染函数。</p>
        <f:Label ID="labResult" runat="server" />
    </form>
</body>
</html>
