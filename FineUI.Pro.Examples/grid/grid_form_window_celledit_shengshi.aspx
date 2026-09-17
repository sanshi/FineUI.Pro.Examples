<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_form_window_celledit_shengshi.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_form_window_celledit_shengshi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" EnableCollapse="false"
            runat="server" AllowCellEditing="true" ClicksToEdit="2"
            DataIDField="Id" Title="表格与表单">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" Position="Top" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增" Icon="Add" runat="server" ClickHandler="onNewButtonClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:TemplateField Width="60px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别" Hidden="true">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期" Hidden="true">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" EnableColumnEdit="false" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Sheng" DataField="Sheng"
                    RendererFunction="renderSheng" HeaderText="省">
                </f:RenderField>
                <f:RenderField ColumnID="Shi" DataField="Shi"
                    RendererFunction="renderShi" HeaderText="市">
                </f:RenderField>
                <f:LinkButtonField ColumnID="Edit" Width="50px" Icon="Pencil" />
                <f:LinkButtonField ColumnID="Delete" Width="50px" Icon="Delete" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnSaveAll" Text="全部保存" Icon="DatabaseSave" OnClick="btnSaveAll_Click" runat="server">
        </f:Button>
        <f:Window ID="Window1" Title="弹出窗体" Hidden="true" EnableIFrame="false"
            EnableMaximize="true" Target="Self" EnableResize="true" runat="server"
            IsModal="true" Width="600px">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" ShowHeader="false" BodyPadding="10px">
                    <Items>
                        <f:HiddenField ID="hfFormID" runat="server"></f:HiddenField>
                        <f:TextBox ID="tbxFormUserName" ShowRedStar="true" Label="姓名" Required="true" runat="server">
                        </f:TextBox>
                        <f:RadioButtonList ID="rblFormGender" Label="性别" ShowRedStar="true" Required="true" runat="server">
                            <f:RadioItem Text="男" Value="1" />
                            <f:RadioItem Text="女" Value="0" />
                        </f:RadioButtonList>
                        <f:NumberBox ID="nbFormEntranceYear" Label="入学年份" NoDecimal="true" NoNegative="true" MinValue="2000" ShowRedStar="true" Required="true"
                            MaxValue="2025" runat="server">
                        </f:NumberBox>
                        <f:DatePicker ID="dpFormEntranceDate" Label="入学日期" ShowRedStar="true" Required="true" runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:CheckBox ID="cbFormAtSchool" Label="是否在校" runat="server">
                        </f:CheckBox>
                        <f:DropDownList ID="ddlFormMajor" Label="所学专业" ShowRedStar="true" Required="true" AutoSelectFirstItem="false" runat="server">
                            <f:ListItem Text="材料科学与工程系" Value="材料科学与工程系" />
                            <f:ListItem Text="化学系" Value="化学系" />
                            <f:ListItem Text="数学系" Value="数学系" />
                            <f:ListItem Text="物理系" Value="物理系" />
                            <f:ListItem Text="自动化系" Value="自动化系" />
                            <f:ListItem Text="计算机科学与工程系" Value="计算机科学与工程系" />
                        </f:DropDownList>
                        <f:DropDownList ID="ddlSheng" Label="省" ShowRedStar="true" Required="true" AutoSelectFirstItem="false" runat="server">
                            <Listeners>
                                <f:Listener Event="change" Handler="onShengChange" />
                            </Listeners>
                        </f:DropDownList>
                        <f:DropDownList ID="ddlShi" Label="市" ShowRedStar="true" Required="true" AutoSelectFirstItem="false" runat="server">
                        </f:DropDownList>
                    </Items>
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" Position="Bottom" ToolbarAlign="Right" runat="server">
                            <Items>
                                <f:Button ID="btnSave" Icon="TableSave" runat="server" Text="保存到表格" ValidateForms="SimpleForm1" ClickHandler="onSaveToTableClick">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:SimpleForm>
            </Items>
        </f:Window>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：初始[性别]和[入学日期]列处于隐藏状态。
    </form>
    <script>

        // 根据省代码获取省名称
        function getShengName(shengValue) {
            var shengName = '', sheng;
            if (shengValue) {
                for (var i = 0, count = window._SHENG.length; i < count; i++) {
                    sheng = window._SHENG[i];
                    if (shengValue == sheng[0]) {
                        shengName = sheng[1];
                        break;
                    }
                }
            }
            return shengName;
        }

        // 根据省代码和市代码获取市名称
        function getShiName(shengValue, shiValue) {
            var shiData = window._SHI[shengValue], shi, shiName = '';
            if (shiData) {
                for (var i = 0, count = shiData.length; i < count; i++) {
                    shi = shiData[i];
                    if (shiValue == shi[0]) {
                        shiName = shi[1];
                        break;
                    }
                }
            }
            return shiName;
        }


        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function renderSheng(value) {
            return getShengName(value);
        }

        function renderShi(value, params) {
            var shengValue = params.rowValue['Sheng']; // 'Sheng' - ColumnID
            return getShiName(shengValue, value);
        }

        var windowClientID = '<%= Window1.ClientID %>';
        var gridClientID = '<%= Grid1.ClientID %>';
        var btnSaveClientID = '<%= btnSave.ClientID %>';

        var formClientID = '<%= SimpleForm1.ClientID %>';
        var hfFormIDClientID = '<%= hfFormID.ClientID %>';
        var tbxFormUserNameClientID = '<%= tbxFormUserName.ClientID %>';
        var rblFormGenderClientID = '<%= rblFormGender.ClientID %>';
        var nbFormEntranceYearClientID = '<%= nbFormEntranceYear.ClientID %>';
        var dpFormEntranceDateClientID = '<%= dpFormEntranceDate.ClientID %>';
        var cbFormAtSchoolClientID = '<%= cbFormAtSchool.ClientID %>';
        var ddlFormMajorClientID = '<%= ddlFormMajor.ClientID %>';
        var ddlFormShengClientID = '<%= ddlSheng.ClientID %>';
        var ddlFormShiClientID = '<%= ddlShi.ClientID %>';


        function onNewButtonClick(event) {
            // 重置表单字段
            F(formClientID).reset();

            // 弹出窗体
            F(windowClientID).show();
            F(windowClientID).setTitle('新增数据');
        }

        function onEditButtonClick(event) {
            showEditWindow();
        }


        // 省下拉列表改变事件处理函数
        function onShengChange(event) {
            var sheng = this.getValue();
            var shidata = window._SHI[sheng];
            F(ddlFormShiClientID).loadData(shidata);
        }


        // 显示编辑/新增窗体
        function showEditWindow(rowId) {
            var grid1 = F(gridClientID);
            var window1 = F(windowClientID);

            // 如果传入参数为空，则获取当前选中行
            if (!rowId) {
                var selectedRowIds = grid1.getSelectedRows();
                if (!selectedRowIds.length) {
                    F.alert('请至少选择一项！');
                    return;
                }

                rowId = selectedRowIds[0];
            }

            
            window1.setTitle('编辑数据');

            // 当前行数据
            var rowValue = grid1.getRowValue(rowId);

            // 使用当前行数据填充表单字段
            F(hfFormIDClientID).setValue(rowId);
            F(tbxFormUserNameClientID).setValue(rowValue['Name']);
            F(rblFormGenderClientID).setValue(rowValue['Gender']);
            F(nbFormEntranceYearClientID).setValue(rowValue['EntranceYear']);
            F(dpFormEntranceDateClientID).setValue(rowValue['EntranceDate']);
            F(cbFormAtSchoolClientID).setValue(rowValue['AtSchool']);
            F(ddlFormMajorClientID).setValue(rowValue['Major']);

            // 省市
            var sheng = rowValue['Sheng'];
            F(ddlFormShengClientID).setValue(sheng);

            var shidata = window._SHI[sheng];
            F(ddlFormShiClientID).loadData(shidata);
            F(ddlFormShiClientID).setValue(rowValue['Shi']);

            // 弹出新增窗体
            window1.show();
        }

        // 表单数据更新至表格
        function saveToTable() {
            var grid1 = F(gridClientID);
            var window1 = F(windowClientID);

            var rowId = F(hfFormIDClientID).getValue();

            if (rowId) {
                grid1.updateCellValue(rowId, {
                    'Name': F(tbxFormUserNameClientID).getValue(),
                    'Gender': F(rblFormGenderClientID).getValue(),
                    'EntranceYear': F(nbFormEntranceYearClientID).getValue(),
                    'EntranceDate': F(dpFormEntranceDateClientID).getValue(),
                    'AtSchool': F(cbFormAtSchoolClientID).getValue(),
                    'Major': F(ddlFormMajorClientID).getValue(),
                    'Sheng': F(ddlFormShengClientID).getValue(),
                    'Shi': F(ddlFormShiClientID).getValue()
                });
            } else {
                grid1.addNewRecord({
                    'Name': F(tbxFormUserNameClientID).getValue(),
                    'Gender': F(rblFormGenderClientID).getValue(),
                    'EntranceYear': F(nbFormEntranceYearClientID).getValue(),
                    'EntranceDate': F(dpFormEntranceDateClientID).getValue(),
                    'AtSchool': F(cbFormAtSchoolClientID).getValue(),
                    'Major': F(ddlFormMajorClientID).getValue(),
                    'Sheng': F(ddlFormShengClientID).getValue(),
                    'Shi': F(ddlFormShiClientID).getValue(),
                    'Edit': '<a href="javascript:;"><img class="f-grid-imagefield" src="../res/icon/pencil.png"></a>',
                    'Delete': '<a href="javascript:;"><img class="f-grid-imagefield" src="../res/icon/delete.png"></a>'
                }, true);
            }

            window1.hide();
        }


        F.ready(function () {

            var grid1 = F(gridClientID);

            grid1.el.on('click', '.f-grid-cell-Edit a,.f-grid-cell-Delete a', function (event) {
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);
                var rowId = rowData.id;

                if (targetEl.parents('.f-grid-cell-Edit').length) {
                    // 点击了行编辑图标
                    showEditWindow(rowId);
                } else {
                    // 点击了行删除图标
                    F.confirm({
                        message: '删除选中行？',
                        messageIcon: 'question',
                        ok: function () {
                            grid1.deleteRow(rowId);
                        }
                    });
                }
            });


            // 初始化省下拉列表
            F(ddlFormShengClientID).loadData(window._SHENG);

        });

        function onSaveToTableClick(event) {
            saveToTable();
        }

    </script>
</body>
</html>
