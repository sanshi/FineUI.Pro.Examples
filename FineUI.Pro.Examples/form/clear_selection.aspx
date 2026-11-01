<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="clear_selection.aspx.cs" Inherits="FineUI.Pro.Examples.form.clear_selection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>统一清空选择</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" ID="Panel1" IsFluid="true" MaxWidth="1000" Layout="Block" BlockConfigSpace="20" ShowHeader="false" ShowBorder="false">
            <Items>
                <f:Panel runat="server" ID="PanelActions" Block="12" ShowHeader="false" ShowBorder="false">
                    <Items>
                        <f:Button runat="server" ID="btnClearSelection" Text="清空全部选择" OnClick="btnClearSelection_Click" CssClass="marginr marginb" />
                        <f:Button runat="server" ID="btnClearAndSelect" Text="清空后重新选中甲" OnClick="btnClearAndSelect_Click" CssClass="marginr marginb" />
                        <f:Button runat="server" ID="btnReadSelection" Text="读取当前选择" OnClick="btnReadSelection_Click" CssClass="marginb" />
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="PanelResult" Block="12" Title="后台读取结果" ShowHeader="true" ShowBorder="true" BodyPadding="10">
                    <Items>
                        <f:Label runat="server" ID="labResult" ShowLabel="false" Text="请先清空，再读取当前选择。" />
                    </Items>
                </f:Panel>

                <f:Grid runat="server" ID="Grid1" Block="12" BlockMD="6" Height="220" Title="表格（Grid）" ShowHeader="true" ShowBorder="true" DataIDField="Id"
                    DataTextField="Name" EnableCheckBoxSelect="true" EnableMultiSelect="true" SelectedRowIDArray="a,b"
                    RowDataBoundFunction="onGridRowDataBound">
                    <Columns>
                        <f:RenderField ColumnID="Name" DataField="Name" HeaderText="名称" ExpandUnusedSpace="true" />
                    </Columns>
                </f:Grid>
                <f:Tree runat="server" ID="Tree1" Block="12" BlockMD="6" Height="220" Title="树（Tree）" ShowHeader="true" ShowBorder="true"
                    EnableMultiSelect="true" EnableCheckBox="true" SelectedNodeIDArray="a,b">
                    <Nodes>
                        <f:TreeNode NodeID="root" Text="分组" Expanded="true" EnableCheckBox="false">
                            <f:TreeNode NodeID="a" Text="甲" Checked="true" />
                            <f:TreeNode NodeID="b" Text="乙（不可选）" Selectable="false" />
                        </f:TreeNode>
                    </Nodes>
                    <Toolbars>
                        <f:Toolbar runat="server" ID="ToolbarTree" Position="Bottom">
                            <Items>
                                <f:Button runat="server" ID="btnUncheckNodes" Text="取消树节点勾选" OnClick="btnUncheckNodes_Click" />
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:Tree>

                <f:SimpleForm runat="server" ID="SimpleFormDropDownList" Block="12" BlockMD="6" Title="下拉列表（DropDownList）" ShowHeader="true" ShowBorder="true"
                    BodyPadding="10">
                    <Items>
                        <f:DropDownList runat="server" ID="DropDownList1" Label="下拉列表" ShowLabel="false" EnableMultiSelect="true" MultiSelectMode="Tags">
                            <Items>
                                <f:ListItem Value="a" Text="甲" />
                                <f:ListItem Value="b" Text="乙" />
                            </Items>
                        </f:DropDownList>
                    </Items>
                </f:SimpleForm>
                <f:SimpleForm runat="server" ID="SimpleFormDropDownBox" Block="12" BlockMD="6" Title="下拉选择框（DropDownBox）" ShowHeader="true" ShowBorder="true"
                    BodyPadding="10">
                    <Items>
                        <f:DropDownBox runat="server" ID="DropDownBox1" Label="下拉选择框" ShowLabel="false" DataControlID="CheckBoxList2" EnableMultiSelect="true"
                            MultiSelectMode="Tags" EnableEdit="true" Values="a,b" Texts="甲,乙">
                            <PopPanel>
                                <f:SimpleForm runat="server" ID="SimpleForm1" Hidden="true" ShowHeader="false" BodyPadding="10">
                                    <Items>
                                        <f:CheckBoxList runat="server" ID="CheckBoxList2" AutoColumnWidth="true">
                                            <Items>
                                                <f:CheckItem Value="a" Text="甲" />
                                                <f:CheckItem Value="b" Text="乙" />
                                            </Items>
                                        </f:CheckBoxList>
                                    </Items>
                                </f:SimpleForm>
                            </PopPanel>
                        </f:DropDownBox>
                    </Items>
                </f:SimpleForm>

                <f:Panel runat="server" ID="PanelDataList" Block="12" BlockMD="6" Title="数据列表（DataList）" ShowHeader="true" ShowBorder="true" BodyPadding="10">
                    <Items>
                        <f:DataList runat="server" ID="DataList1" EnableSelect="true" EnableMultiSelect="true">
                            <Items>
                                <f:DataListItem Value="a" Text="甲" />
                                <f:DataListItem Value="b" Text="乙（不可选）" EnableSelect="false" />
                            </Items>
                        </f:DataList>
                    </Items>
                </f:Panel>
                <f:SimpleForm runat="server" ID="SimpleFormCheckBoxList" Block="12" BlockMD="6" Title="复选框列表（CheckBoxList）" ShowHeader="true" ShowBorder="true"
                    BodyPadding="10">
                    <Items>
                        <f:CheckBoxList runat="server" ID="CheckBoxList1" Label="复选框列表" ShowLabel="false" AutoColumnWidth="true">
                            <Items>
                                <f:CheckItem Value="a" Text="甲" />
                                <f:CheckItem Value="b" Text="乙（禁用）" Enabled="false" />
                            </Items>
                        </f:CheckBoxList>
                    </Items>
                </f:SimpleForm>
                <f:SimpleForm runat="server" ID="SimpleFormRadioButtonList" Block="12" BlockMD="6" Title="单选框列表（RadioButtonList）" ShowHeader="true"
                    ShowBorder="true" BodyPadding="10">
                    <Items>
                        <f:RadioButtonList runat="server" ID="RadioButtonList1" Label="单选框列表" ShowLabel="false" AutoColumnWidth="true">
                            <Items>
                                <f:RadioItem Value="a" Text="甲" />
                                <f:RadioItem Value="b" Text="乙" />
                            </Items>
                        </f:RadioButtonList>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>
        <br />
        <p>七类控件都使用 ClearSelection 清空选择，数据保留，禁用项的旧选择也会清除。</p>
        <p>树的清空选择只取消节点高亮，保留节点勾选和展开状态；取消勾选请使用树区域内的按钮。</p>
    </form>
    <script>
        function onGridRowDataBound(rowData) {
            if (rowData.id === 'b') {
                rowData.unselectable = true;
            }
        }

    </script>
</body>
</html>
