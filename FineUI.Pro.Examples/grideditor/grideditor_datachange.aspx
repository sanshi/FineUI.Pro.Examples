<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_datachange.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_datachange" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（双击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="2">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick">
                        </f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" runat="server" ClickHandler="onDeleteClick">
                        </f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" runat="server" ClickHandler="onResetClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000" MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Delete" Width="50px" TextAlign="Center" EnableHeaderMenu="false">
                    <Commands>
                        <f:Command CommandName="Delete" Icon="Delete" ConfirmText="删除选中行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="datachange" Handler="checkSubmitBtnStatus" />
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button CssClass="marginr" ID="Button2" runat="server" Text="保存数据" Enabled="false" OnClick="Button2_Click">
        </f:Button>
        <f:Button CssClass="marginr" ID="btnRejectChanges" runat="server" Text="服务端撤销编辑" ConfirmText="确定要撤销未保存的编辑？" OnClick="btnRejectChanges_Click" />
        <f:Button CssClass="marginr" ID="btnReadChanges" runat="server" Text="读取修改记录" OnClick="btnReadChanges_Click" />
        <f:Button ID="btnCommitChanges" runat="server" Text="仅确认客户端编辑" OnClick="btnCommitChanges_Click" />
        <br />
        <f:Button CssClass="marginr" ID="btnUpdateCells" runat="server" Text="服务端修改 101 行" OnClick="btnUpdateCells_Click" />
        <f:Button CssClass="marginr" ID="btnAddRecord" runat="server" Text="服务端插入第二行" OnClick="btnAddRecord_Click" />
        <f:Button CssClass="marginr" ID="btnAppendRecord" runat="server" Text="服务端追加末行" OnClick="btnAppendRecord_Click" />
        <f:Button CssClass="marginr" ID="btnDeleteRow" runat="server" Text="服务端删除 101 行" OnClick="btnDeleteRow_Click" />
        <f:Button CssClass="marginr" ID="btnForceDeleteRow" runat="server" Text="强制移除 102 行" OnClick="btnForceDeleteRow_Click" />
        <f:Button ID="btnDeleteSelected" runat="server" Text="服务端删除选中行" OnClick="btnDeleteSelected_Click" />
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />


    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        // 删除表格中选中的行（先确认）。
        function deleteSelectedRows() {
            F.confirm({
                message: '删除选中行？',
                messageIcon: 'question',
                ok: function() {
                    F(Grid1ClientID).deleteSelectedRows(false);
                }
            });
        }

        function onNewClick(event) {
            F(Grid1ClientID).addNewRecord({
                    "Name": "新用户",
                    "Gender": "1",
                    "EntranceYear": "2015",
                    "EntranceDate": "2015-09-01",
                    "AtSchool": false,
                    "Major": "化学系"
                },
                true);
        }

        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            if (commandName === 'Delete') {
                F(Grid1ClientID).deleteRow(rowId);
            }
        }

        function onDeleteClick(event) {
            if (!F(Grid1ClientID).hasSelection()) {
                F.alert({
                    message: '请至少选择一项！',
                    messageIcon: 'information'
                });
                return false;
            }
            deleteSelectedRows();
        }

        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function() {
                    F(Grid1ClientID).rejectChanges();
                },
                messageIcon: 'question'
            });
        }

        var gridClientID = '<%= Grid1.ClientID %>';
        var btnClientID = '<%= Button2.ClientID %>';

        function checkSubmitBtnStatus(event) {
            var grid = F(gridClientID);
            var submitBtn = F(btnClientID);

            // 如果没有删除行，没有新增行，没有修改的数据
            if (!grid.getModifiedData().length) {
                submitBtn.disable();
            } else {
                submitBtn.enable();
            }
        }


        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>监听表格数据变化，仅在存在未保存的增删改时启用保存按钮。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>让保存按钮跟随待提交修改</h3>
            <ol>
                <li>从初始状态修改<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>一个<strong>姓名</strong>并结束编辑。<br />结果：<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="保存数据">保存数据</strong>从禁用变为可用；新增或删除记录也会使本轮修改非空。
                </li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnReset").ClientID %>'
                        title="重置表格数据">重置表格数据</strong>并确认，或保存本轮修改。<br />结果：待提交的变化清除后，保存按钮重新禁用；只选择一行不算数据修改。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>核对撤销与确认的区别</h3>
            <ol>
                <li>修改一行后点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnReadChanges").ClientID %>'
                        title="读取修改记录">读取修改记录</strong>，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnRejectChanges").ClientID %>'
                        title="服务端撤销编辑">服务端撤销编辑</strong>并确认。<br />结果：后台先显示收到的修改记录数；撤销动作返回浏览器后恢复未编辑状态，下一次读取不再携带这些旧修改。</li>
                <li>重新修改一行，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnCommitChanges").ClientID %>'
                        title="仅确认客户端编辑">仅确认客户端编辑</strong>，再改一次并撤销。<br />结果：确认动作只把当前浏览器值作为新的编辑基准，不写入后台数据；之后撤销回到这个新基准。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>由后台安排浏览器编辑动作</h3>
            <ul>
                <li>分别从初始状态点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUpdateCells").ClientID %>' title="服务端修改 101 行">服务端修改 101
                        行</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnAddRecord").ClientID %>' title="服务端插入第二行">服务端插入第二行</strong>或<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnAppendRecord").ClientID %>'
                        title="服务端追加末行">服务端追加末行</strong>，再读取修改记录。<br />结果：返回的客户端动作按稳定行标识修改指定行、插入第二行或追加末行；这些动作同样进入待保存变更。</li>
                <li>从初始状态分别尝试<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDeleteRow").ClientID %>'
                        title="服务端删除 101 行">服务端删除 101 行</strong>与<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnForceDeleteRow").ClientID %>' title="强制移除 102 行">强制移除 102
                        行</strong>。<br />结果：普通删除登记待删除并可撤销；强制移除直接调整客户端显示，不产生同样的待删除记录，也不因此删除后台原始数据。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>datachange / getModifiedData</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>）：每次数据变化后检查变更集合；集合非空则启用保存，为空则禁用。</li>
                <li><code>Enabled</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="保存数据">保存数据</strong>）：初始为
                    <code>false</code>，保存按钮只在有待提交记录时可用。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
