<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_selectfromwindow_clientscript_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_selectfromwindow_clientscript_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" ShowHeader="false" Title="表格" runat="server" EnableCollapse="false"
            EnableCheckBoxSelect="true" EnableMultiSelect="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField ColumnID="EntranceDate" DataField="EntranceDate" HeaderText="入学日期" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" />
            </Columns>
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Button ID="btnClose" Text="关闭" runat="server" Icon="SystemClose" ClickHandler="onCloseClick">
                        </f:Button>
                        <f:Button ID="btnSaveClose" Text="选择后关闭" runat="server" Icon="SystemSaveClose" ClickHandler="onGridRowSelect"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Listeners>
                <f:Listener Event="rowdblclick" Handler="onGridRowSelect" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        注：由于需要在客户端获取表格行数据，所以需要使用RenderField替换所有的BoundField。
    </form>
    <script>
        function onCloseClick(event) {
            F.activeWindow.hide();
        }


        var gridClientID = '<%= Grid1.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function onGridRowSelect(event) {
            // 返回当前活动Window对象（浏览器窗口对象通过F.getActiveWindow().window获取）
            var activeWindow = F.getActiveWindow();

            // 选中行数据
            var rowData = F(gridClientID).getSelectedRow(true);
            var rowValue = rowData.values;

            var queryRowId = F.queryString('rowid');
            var selectedValues = {
                'Name': rowValue['Name'],
                'Gender': rowValue['Gender'],
                'EntranceYear': rowValue['EntranceYear'],
                'EntranceDate': rowValue['EntranceDate'],
                'AtSchool': rowValue['AtSchool'],
                'Major': rowValue['Major']
            };

            // 隐藏弹出窗体
            activeWindow.hide();

            // 调用父页面的 updateGridRow 函数
            activeWindow.window.updateGridRow(queryRowId, selectedValues);
        }

    </script>
</body>
</html>
