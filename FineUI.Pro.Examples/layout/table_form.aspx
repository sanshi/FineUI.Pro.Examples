<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="table_form.aspx.cs" Inherits="FineUI.Pro.Examples.layout.table_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .mytable td.f-layout-table-cell {
            padding: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form2" IsFluid="true" CssClass="mytable" runat="server" Height="500px" ShowBorder="true"
            Layout="Table" TableConfigColumns="3" ShowHeader="true" Title="表单（Height=450px Width=750px Layout=Table）"
            LabelAlign="Right" LabelWidth="120px">
            <Items>
                <f:Panel ID="Panel1" Title="Panel1" Width="300px" Height="210px"
                    TableRowspan="2" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" Label="标签（靠右）" runat="server" Text="Width=300px Height=210px TableRowspan=2">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="Panel2" Width="430px" Height="100px"
                    TableColspan="2" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" Label="标签（靠左）" LabelAlign="Left" runat="server" Text="Width=430px Height=100px TableColspan=2">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" Title="Panel3" Width="200px" Height="100px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel5" Title="Panel4" Width="220px" Height="100px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="Width=220px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Form>
    </form>
</body>
</html>
