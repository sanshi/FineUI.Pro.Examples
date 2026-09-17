<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iframe_closeall_window2.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.iframe_closeall_window2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="formPanel" runat="server" />
        <f:Panel ID="formPanel" ShowBorder="false" ShowHeader="false" CssClass="f-widget-content" Layout="Fit" runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="btnClosePostBack" Text="全部关闭" runat="server" ClickHandler="onClosePostBackClick">
                        </f:Button>
                        <f:Button ID="btnPostBackClosePostBack" Text="全部关闭（后台注册脚本）" OnClick="btnPostBackClosePostBack_Click"
                            runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm ID="SimpleForm1" ShowBorder="false"
                    ShowHeader="false" AutoScroll="true" BodyPadding="10px" runat="server" EnableCollapse="false">
                    <Items>
                        <f:Label ID="Label2" Label="文本" Text="三生石上" CssClass="highlight" runat="server" />
                        <f:NumberBox ID="NumberBox1" Label="数字输入框" Required="true" ShowRedStar="true" runat="server" />
                        <f:CheckBox ID="CheckBox1" runat="server" Label="复选框">
                        </f:CheckBox>
                        <f:TextBox ID="TextBox1" Label="文本输入框" runat="server" ShowRedStar="true" Required="true">
                        </f:TextBox>
                        <f:DatePicker ID="DatePicker1" runat="server" SelectedDate="2008-05-09" Label="日期选择器"
                            Text="2008-05-09">
                        </f:DatePicker>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>
    </form>
    <script>

        function onClosePostBackClick(event) {
            F.activeWindow.hidePostBack();
        }

    </script>
</body>
</html>
