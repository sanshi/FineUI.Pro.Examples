<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="column_autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.layout.column_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server"
            AutoScroll="true" ShowBorder="true" EnableCollapse="false"
            BodyPadding="10px" Layout="Column" ShowHeader="true" Title="面板">
            <Items>
                <f:Panel ID="Panel24" ColumnWidth="33%" runat="server"
                    ShowBorder="false" ShowHeader="false" Margin="0 5px 0 0">
                    <Items>
                        <f:Panel ID="Panel25" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel26" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel27" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel28" ColumnWidth="33%" runat="server"
                    ShowBorder="false" ShowHeader="false" Margin="0 5px 0 0">
                    <Items>
                        <f:Panel ID="Panel29" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel30" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel31" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel32" ColumnWidth="34%" runat="server"
                    ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Panel ID="Panel33" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel34" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel35" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
