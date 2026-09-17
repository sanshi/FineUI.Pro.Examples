<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nolayout.aspx.cs" Inherits="FineUI.Pro.Examples.layout.nolayout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel3" runat="server" />
        <f:Panel ID="Panel3" Margin="24px" Title="面板（未定义布局时，内容过长也不会出现水平滚动条）" runat="server" Height="300px" EnableCollapse="true"
            BodyPadding="10px" ShowBorder="true" ShowHeader="true" AutoScroll="true">
            <Items>
                <f:Panel ID="Panel1" runat="server" ShowBorder="true" Margin="0 0 5 0"
                    BodyPadding="10px" ShowHeader="false" Title="面板" Height="150px">
                    <Items>
                        <f:Label ID="Label5" Text="Margin=0 0 5 0" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" runat="server" ShowBorder="true" Margin="0 0 5 0"
                    BodyPadding="10px" ShowHeader="false" Title="面板" Height="150px">
                    <Items>
                        <f:Label ID="Label1" Text="Margin=0 0 5 0" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" runat="server" ShowBorder="true" Margin="0 0 5 0"
                    BodyPadding="10px" ShowHeader="false" Title="面板" Height="150px">
                    <Items>
                        <f:Label ID="Label3" Text="Margin=0 0 5 0" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Form ID="Form3" runat="server" ShowBorder="true"
                    BodyPadding="10px" ShowHeader="false" Title="表单">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:Label ID="Label2" Label="文本" Text="文本内容" runat="server">
                                </f:Label>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox2" Label="输入框" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button2" Text="按钮" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
        </f:Panel>
        <br />
        <br />
    </form>
</body>
</html>
