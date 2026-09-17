<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_selectfromwindow_emptyrows_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_selectfromwindow_emptyrows_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="true" runat="server" Title="Panel" BodyPadding="10px" ShowHeader="false" Layout="VBox" BoxConfigAlign="Stretch">
            <Items>
                <f:Form ShowBorder="false" ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow runat="server">
                            <Items>
                                <f:TwinTriggerBox runat="server" EmptyText="在姓名中搜索" ShowLabel="false" ID="ttbSearch" ShowTrigger1="false"
                                    OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click" Trigger1Icon="Clear"
                                    Trigger2Icon="Search">
                                </f:TwinTriggerBox>
                                <f:RadioButtonList ID="rblAtSchool" ShowLabel="false" MarginLeft="20px"
                                    OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" runat="server">
                                    <f:RadioItem Text="全部" Value="all" Selected="true" />
                                    <f:RadioItem Text="在校" Value="in" />
                                    <f:RadioItem Text="离校" Value="out" />
                                </f:RadioButtonList>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" ShowHeader="false" Title="表格" runat="server" EnableCollapse="false"
                    EnableCheckBoxSelect="true" EnableMultiSelect="false" BoxFlex="1">
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别" />
                        <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                        <f:RenderField ColumnID="EntranceDate" DataField="EntranceDate" HeaderText="入学日期" />
                        <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:RenderField ColumnID="Major" DataField="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" />
                    </Columns>
                    <Listeners>
                        <f:Listener Event="rowdblclick" Handler="onGridRowSelectNext" />
                    </Listeners>
                </f:Grid>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom" ToolbarAlign="Center">
                    <Items>
                        <f:Button ID="Button1" Text="选择后定位到下一行" runat="server" Icon="SystemSave" ClickHandler="onGridRowSelectNext"></f:Button>
                        <f:Button ID="btnSaveClose" Text="选择后关闭" runat="server" Icon="SystemSaveClose" ClickHandler="onGridRowSelectClose"></f:Button>
                        <f:Button ID="btnClose" Text="关闭" runat="server" Icon="SystemClose" ClickHandler="onWindowClose"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function onWindowClose(event) {
            // 隐藏当前弹出窗体
            F.getActiveWindow().hide();
        }

        // 调用父页面的 updateGridRow 函数
        function updateParentGridRow(activeWindow) {
            // 选中行数据
            var rowData = F(grid1ClientID).getSelectedRow(true);
            var rowValue = rowData.values;

            var selectedValues = {
                'Name': rowValue['Name'],
                'Gender': rowValue['Gender'],
                'EntranceYear': rowValue['EntranceYear'],
                'EntranceDate': rowValue['EntranceDate'],
                'AtSchool': rowValue['AtSchool'],
                'Major': rowValue['Major']
            };

            // 调用父页面的 updateGridRow 函数
            activeWindow.window.updateGridRow(selectedValues);
        }

        function onGridRowSelectClose(event) {
            var grid = F(grid1ClientID);
            if (!grid.getSelectedRow()) {
                F.alert('请至少选择一行！');
                return;
            }

            // 返回当前活动Window对象（浏览器窗口对象通过F.getActiveWindow().window获取）
            var activeWindow = F.getActiveWindow();

            // 调用父页面的 updateGridRow 函数
            updateParentGridRow(activeWindow);

            // 隐藏当前弹出窗体
            activeWindow.hide();
        }

        function onGridRowSelectNext(event) {
            var grid = F(grid1ClientID);
            if (!grid.getSelectedRow()) {
                F.alert('请至少选择一行！');
                return;
            }

            // 返回当前活动Window对象（浏览器窗口对象通过F.getActiveWindow().window获取）
            var activeWindow = F.getActiveWindow();

            // 调用父页面的 updateGridRow 函数
            updateParentGridRow(activeWindow);

            // 调用父页面的 moveToNextRow 函数
            activeWindow.window.moveToNextRow();
        }

    </script>
</body>
</html>
