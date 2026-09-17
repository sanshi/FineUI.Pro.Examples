<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="column.aspx.cs" Inherits="FineUI.Pro.Examples.layout.column" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .columnpanel {
            margin-right: 5px;
        }

        .rowpanel {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="250px" ShowBorder="true" EnableCollapse="false"
            BodyPadding="10px" Layout="Column" ShowHeader="true" Title="面板（Height=250px Layout=Column）">
            <Items>
                <f:Panel ID="Panel1" Width="200px" Height="150px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label runat="server" Text="Width=200px Height=150px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" ColumnWidth="60%" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false" Layout="Fit">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="ColumnWidth=60%<br />长长的文本1<br />长长的文本2<br />长长的文本3<br />长长的文本4"
                            EncodeText="false">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" ColumnWidth="40%" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="ColumnWidth=40%">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" Height="250px" ShowBorder="true" EnableCollapse="false"
            BodyPadding="10px" Layout="Column" ShowHeader="true" Title="面板（Height=250px Layout=Column）">
            <Items>
                <f:Panel ID="Panel6" Width="200px" Height="150px" CssClass="columnpanel"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="Width=200px Height=150px CssClass=columnpanel">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel7" ColumnWidth="60%" CssClass="columnpanel"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false" Layout="Fit">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="ColumnWidth=60% CssClass=columnpanel<br />长长的文本1<br />长长的文本2<br />长长的文本3<br />长长的文本4"
                            EncodeText="false">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel8" ColumnWidth="40%" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="ColumnWidth=40%">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel9" IsFluid="true" Height="350px" Layout="Column" BodyPadding="10px" EnableCollapse="false"
            ShowBorder="true" ShowHeader="true" runat="server"
            Title="面板（Height=350px Layout=Column BodyPadding=5）">
            <Items>
                <f:Panel ID="Panel13" ColumnWidth="50%" MarginRight="5px" Title="ColumnWidth=50% MarginRight=5" ShowBorder="true" ShowHeader="true" runat="server">
                    <Items>
                        <f:Panel ID="Panel14" Height="150px" MarginBottom="5px" runat="server" BodyPadding="10px"
                            ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label8" runat="server" Text="Height=100px MarginBottom=5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel15" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true"
                            ShowHeader="false">
                            <Items>
                                <f:Label ID="Label9" runat="server" Text="Height=100px">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel16" ColumnWidth="50%" Title="ColumnWidth=50%" ShowBorder="true" ShowHeader="true" runat="server">
                    <Items>
                        <f:Panel ID="Panel17" Height="100px" MarginBottom="5px" runat="server" BodyPadding="10px"
                            ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label10" runat="server" Text="Height=100px MarginBottom=5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel18" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true"
                            ShowHeader="false">
                            <Items>
                                <f:Label ID="Label11" runat="server" Text="Height=100px">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <br />
        <strong>【推荐】</strong>使用HBox布局实现与上例相同的界面：
        <br />
        <hr />
        <br />
        <f:Panel ID="Panel10" IsFluid="true" Height="350px" Layout="HBox" EnableCollapse="false"
            BodyPadding="10px" BoxConfigChildMargin="0 5 0 0"
            ShowBorder="true" ShowHeader="true" runat="server"
            Title="面板（Height=350px Layout=HBox BodyPadding=5 BoxConfigChildMargin=0 5 0 0）">
            <Items>
                <f:Panel ID="Panel11" BoxFlex="1" Title="BoxFlex=1" ShowBorder="true" ShowHeader="true" runat="server">
                    <Items>
                        <f:Panel ID="Panel12" Height="150px" MarginBottom="5px" runat="server" BodyPadding="10px"
                            ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label6" runat="server" Text="Height=100px MarginBottom=5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel19" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true"
                            ShowHeader="false">
                            <Items>
                                <f:Label ID="Label7" runat="server" Text="Height=100px">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel20" BoxFlex="1" Margin="0" Title="BoxFlex=1 Margin=0" ShowBorder="true" ShowHeader="true" runat="server">
                    <Items>
                        <f:Panel ID="Panel21" Height="100px" MarginBottom="5px" runat="server" BodyPadding="10px"
                            ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label12" runat="server" Text="Height=100px MarginBottom=5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel22" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true"
                            ShowHeader="false">
                            <Items>
                                <f:Label ID="Label13" runat="server" Text="Height=100px">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
    </form>
</body>
</html>
