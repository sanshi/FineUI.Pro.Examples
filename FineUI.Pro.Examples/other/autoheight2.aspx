<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="autoheight2.aspx.cs" Inherits="FineUI.Pro.Examples.other.autoheight2" %>

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
            <Content>
                <ul class="mmlist">
                    <li>
                        <img src="../res/images/mm/1.jpg" />
                    </li>
                    <li>
                        <img src="../res/images/mm/2.jpg" />
                    </li>
                    <li>
                        <img src="../res/images/mm/3.jpg" />
                    </li>
                    <li>
                        <img src="../res/images/mm/4.jpg" />
                    </li>
                </ul>
            </Content>
        </f:Panel>
        <br />
        <br />
        <f:Panel runat="server" ID="Panel2" Title="面板（自动高度）" Width="650px"
            EnableCollapse="false" ShowBorder="true"
            LayoutAfterImagesLoad="true">
            <Content>
                <ul class="mmlist">
                    <li>
                        <img src="../res/images/mm/1.jpg" />
                    </li>
                    <li>
                        <img src="../res/images/mm/2.jpg" />
                    </li>
                    <li>
                        <img src="../res/images/mm/3.jpg" />
                    </li>
                    <li>
                        <img src="../res/images/mm/4.jpg" />
                    </li>
                </ul>
            </Content>
        </f:Panel>
    </form>
</body>
</html>
