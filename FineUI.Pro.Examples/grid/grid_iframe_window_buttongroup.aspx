<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="grid_iframe_window_buttongroup.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_iframe_window_buttongroup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        .f-buttongroup-body {
            /*white-space: nowrap;*/
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server" />
        <f:Form ID="SimpleForm1" ShowBorder="true" ShowHeader="false"
            AutoScroll="true" BodyPadding="10px" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnClose" Text="关闭" runat="server" Icon="SystemClose" ClickHandler="onCloseClick">
                        </f:Button>
                        <f:ButtonGroup runat="server">
                            <f:Button ID="btnSaveContinue" Text="回发父页面" runat="server" Icon="SystemSave"
                                OnClick="btnSaveContinue_Click">
                            </f:Button>
                            <f:Button ID="btnSaveRefresh" Text="刷新父页面" runat="server" Icon="SystemSaveNew"
                                OnClick="btnSaveRefresh_Click">
                            </f:Button>
                            <f:Button ID="Button1" Text="关闭当前选项卡" runat="server" Icon="SystemSaveClose"
                                OnClick="btnSaveClose_Click">
                            </f:Button>
                        </f:ButtonGroup>
                        <f:ToolbarSeparator runat="server">
                        </f:ToolbarSeparator>
                        <f:ButtonGroup runat="server">
                            <f:Button ID="Button2" Text="按钮一" runat="server" Icon="SystemSave">
                            </f:Button>
                            <f:Button ID="Button3" Text="按钮二" runat="server" Icon="SystemSave">
                            </f:Button>
                            <f:Button ID="Button4" Text="按钮三" runat="server" Icon="SystemSave">
                            </f:Button>
                            <f:Button ID="Button5" Text="按钮四" runat="server" Icon="SystemSave">
                            </f:Button>
                        </f:ButtonGroup>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
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

        function onCloseClick(event) {
            F.activeWindow.hide();
        }

    </script>
</body>
</html>
