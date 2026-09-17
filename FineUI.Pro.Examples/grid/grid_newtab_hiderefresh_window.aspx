<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="grid_newtab_hiderefresh_window.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_newtab_hiderefresh_window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server" />
        <f:Form ID="SimpleForm1" ShowBorder="true" Margin="24px" ShowHeader="false" 
            AutoScroll="true" BodyPadding="10px" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnClose" Text="关闭当前选项卡" runat="server" ClickHandler="onCloseClick">
                        </f:Button>
                        <f:Button ID="btnCloseRefresh" Text="关闭当前标签页并刷新父选项卡" runat="server" ClickHandler="onCloseRefreshClick">
                        </f:Button>
                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                        </f:ToolbarFill>
                        <f:ToolbarText ID="ToolbarText1" Text="提示一" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText ID="ToolbarText2" Text="提示二" runat="server">
                        </f:ToolbarText>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="labUserName" Label="申请人" Text="三生石上" CssClass="highlight" runat="server" />
                        <f:Label ID="Label3" Label="电话" Text="0551-1234567" runat="server" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="NumberBox1" NoDecimal="true" NoNegative="true" Label="数量" Required="true" ShowRedStar="true" runat="server" />
                        <f:DatePicker ID="DatePicker1" Required="true" ShowRedStar="true" runat="server"
                            SelectedDate="2008-05-09" Label="申请日期" Text="2008-05-09">
                        </f:DatePicker>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea2" Height="80px" Label="描述" runat="server" Required="true" ShowRedStar="true" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:HtmlEditor ID="HtmlEditor1" Editor="UMEditor" BasePath="~/res/third-party/umeditor/"
                            Label="详细描述" Height="200px" runat="server">
                        </f:HtmlEditor>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
    </form>
    <script>

        // 父页面打开本页时把它自己的标签页 id 放在查询串里传过来。
        // 这里必须转义：查询串是用户可控的，直接拼进脚本等于开了个注入口子。
        var parentTabId = '<%= HttpUtility.JavaScriptStringEncode(Request.QueryString["parenttabid"] ?? "") %>';

        function onCloseClick(event) {
            parent.removeActiveTab();
        }

        function onCloseRefreshClick(event) {
            parent.activeTabAndRefresh(parentTabId);
        }

    </script>
</body>
</html>
