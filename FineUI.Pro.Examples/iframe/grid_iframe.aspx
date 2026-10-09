<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_iframe.aspx.cs" Inherits="FineUI.Pro.Examples.iframe.grid_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />

</head>
<body class="f-body-darkerbg">
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel7" runat="server" />
        <f:Panel ID="Panel7" ShowBorder="false" runat="server" BodyPadding="20px" Title="Panel" ShowHeader="false" Layout="VBox" BoxConfigSpace="10">
            <Items>
                <f:Form ID="Form5" ShowBorder="true" ShowBorderShadow="true" ShowHeader="false" BodyPadding="10" RemoveLastFieldsMargin="true" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TwinTriggerBox runat="server" EmptyText="输入要搜索的关键词" ShowLabel="false" ID="ttbSearch" ShowTrigger1="false"
                                    OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click" Trigger1Icon="Clear"
                                    Trigger2Icon="Search">
                                </f:TwinTriggerBox>
                                <f:DropDownList ID="DropDownList1" ShowLabel="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server">
                                    <f:ListItem Text="过滤条件一" Value="filter1" />
                                    <f:ListItem Text="过滤条件二" Value="filter2" />
                                    <f:ListItem Text="过滤条件三" Value="filter3" />
                                </f:DropDownList>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Grid ID="Grid2" Title="Grid2" PageSize="5" ShowBorder="true" ShowBorderShadow="true" BoxFlex="1" AllowPaging="true" IsDatabasePaging="false"
                    ShowHeader="false" runat="server" EnableCheckBoxSelect="true" DataIDField="Id" OnSort="Grid2_Sort">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar2" runat="server">
                            <Items>
                                <f:Button ID="btnPopupWindow" Text="弹出对话框" runat="server" ClickHandler="onPopupWindowClick">
                                </f:Button>
                                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                                </f:ToolbarSeparator>
                                <f:Button ID="btnCheckSelection" Text="检查选中项状态" runat="server" ClickHandler="onCheckSelectionClick">
                                </f:Button>
                                <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                                </f:ToolbarSeparator>
                                <f:Button ID="btnConfirmButton" Text="删除选中行" runat="server" ClickHandler="onConfirmButtonClick"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                        <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                        <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                            RendererFunction="renderMajor" />
                        <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                        <f:RenderField ColumnID="myWindowField" TextAlign="Center">
                            <Commands>
                                <f:Command Icon="Pencil" ToolTip="编辑" WindowID="Window1" WindowIFrameUrlFields="Id,Name"
                                    WindowIFrameUrlFormatString="../grid/grid_iframe_window.aspx?id={0}&name={1}" WindowTitle="编辑"
                                    WindowIFrameUrl="~/alert.aspx" CommandName="Edit" />
                            </Commands>
                        </f:RenderField>
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
        <f:Window ID="Window1" Title="弹出窗体" Hidden="true" EnableIFrame="true" EnableMaximize="true" Target="Top" EnableResize="true" runat="server"
            CloseAction="HidePostBack" OnClose="Window1_Close" IsModal="true" Width="850px" Height="500px">
        </f:Window>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid2ClientID = '<%= Grid2.ClientID %>';
        var Window1ClientID = '<%= Window1.ClientID %>';

        function onPopupWindowClick(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/grid/grid_iframe_window.aspx") %>');
            return false;
        }

        function onCheckSelectionClick(event) {
            if (!F(Grid2ClientID).hasSelection()) {
                F.alert({
                    message: '请至少选择一项！',
                    messageIcon: 'information'
                });
                return false;
            };
        }


        // 控件在命名容器里，客户端 id 带前缀，必须由服务端输出 ClientID，不能写字面 id
        var grid2ClientID = '<%= Grid2.ClientID %>';

        // 完整流程：先判断有没有选中 → 提示要删除多少项 → 用户点确定后回发 → 服务端处理并反馈。
        // 客户端已经拿着选中行的标识，用自定义回发直接送到服务端，不必让服务端再从回发状态里反推。
        // （确认框是异步的，没法在这个函数里等用户点完，所以先 return false，点确定后由 ok 回调发起回发。
        //   自定义回发不带表单验证、回发前禁用按钮这些按钮内置回发才有的特性，需要的话在这里自己写。）
        function onConfirmButtonClick(event) {
            var grid = F(grid2ClientID);
            if (!grid.hasSelection()) {
                F.alert('请至少选择一项！');
                return false;
            }

            var selectedRows = grid.getSelectedRows();
            F.confirm({
                message: F.rawHtml('你确定要删除选中的&nbsp;<b>' + selectedRows.length + '</b>&nbsp;项吗？'),
                messageIcon: 'warning',
                ok: function() {
                    F.customEvent('Grid2_DeleteRows', {
                        selectedRows: selectedRows
                    });
                }
            });
            return false;
        }

    </script>

</body>
</html>
