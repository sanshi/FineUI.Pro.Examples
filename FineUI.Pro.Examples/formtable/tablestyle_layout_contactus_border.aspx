<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_layout_contactus_border.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.tablestyle_layout_contactus_border" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/tablestyle_noborder.css" />
    <link href="../res/css/tablestyle_noborder.css" rel="stylesheet" />
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Title="联系我们" IsModal="false" EnableClose="false" EnableResize="true"
            Width="550px" BodyPadding="0" AutoScroll="true">
            <Items>
                <f:Form ID="Form1" ShowBorder="false" ShowHeader="false" runat="server"
                    EnableTableStyle="true" MessageTarget="Qtip">
                    <Items>
                        <f:Panel ID="Panel2" Layout="Column" ShowHeader="false" ShowBorder="false" runat="server">
                            <Items>
                                <f:TextBox ID="TextBox2" Label="姓" Margin="0 5 0 0" Required="true" ShowRedStar="true" ColumnWidth="50%" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox4" Label="名" Required="true" ShowRedStar="true" ColumnWidth="50%" runat="server">
                                </f:TextBox>
                            </Items>
                        </f:Panel>
                        <f:TextBox ID="TextBox1" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="TextBox3" Required="true" ShowRedStar="true" Label="主题" runat="server">
                        </f:TextBox>
                        <f:TextArea ID="TextArea1" Height="120px" Required="true" ShowRedStar="true" Label="消息正文" runat="server">
                        </f:TextArea>
                    </Items>
                </f:Form>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button1" Text="发送" IconFont="_Send" ValidateForms="Form1" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
</body>
</html>
