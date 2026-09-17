<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_dynamic_columns.aspx.cs" EnableEventValidation="false"
    Inherits="FineUI.Pro.Examples.data.grid_excel_dynamic_columns" %>

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
        <f:Button ID="Button1" runat="server" Text="导出Excel文件" OnClick="ExportExcel" EnableAjax="false" DisableControlBeforePostBack="false">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
