<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.other.autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mmlist {
            list-style-type: none;
            margin: 10px;
            padding: 0;
        }

            .mmlist li {
                margin-bottom: 10px;
            }

            .mmlist img {
                width: 500px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" ID="Panel1" IsFluid="true" Title="面板（固定高度）" Height="400px"
            EnableCollapse="false" ShowBorder="true" AutoScroll="true">
            <Items>
                <f:Label ID="Label1" EncodeText="false" runat="server"></f:Label>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel runat="server" ID="Panel2" Title="面板（自动高度）" Width="650px"
            EnableCollapse="false" ShowBorder="true"
            LayoutAfterImagesLoad="true">
            <Items>
                <f:Label ID="Label2" EncodeText="false" runat="server"></f:Label>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
