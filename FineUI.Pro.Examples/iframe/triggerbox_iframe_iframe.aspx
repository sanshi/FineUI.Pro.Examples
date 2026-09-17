<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="triggerbox_iframe_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.triggerbox_iframe_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server"></f:PageManager>
        <f:SimpleForm ID="SimpleForm1" ShowBorder="false" ShowHeader="false" CssClass="f-widget-content" Title="SimpleForm"
            BodyPadding="10px" runat="server" AutoScroll="true">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnClose" Text="关闭" runat="server" Icon="SystemClose" ClickHandler="onCloseClick">
                        </f:Button>
                        <f:Button ID="btnClosePostBack" OnClick="btnClosePostBack_Click" runat="server"
                            Text="关闭-回发父页面" Icon="SystemSave">
                        </f:Button>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnSelect" OnClick="btnSelect_Click" runat="server" Text="选择文本输入框的值"
                            Icon="SystemSave">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:TextBox ID="TextBox1" Label="文本输入框" runat="server" Required="true">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
    </form>
    <script>

        function onCloseClick(event) {
            F.activeWindow.hide();
        }

    </script>
</body>
</html>
