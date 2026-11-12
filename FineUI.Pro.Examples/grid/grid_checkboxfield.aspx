<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Action1" Width="60px">
                    <Commands>
                        <f:Command CommandName="Action1" Text="按钮 1" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Action2" Width="60px">
                    <Commands>
                        <f:Command CommandName="Action2" Text="按钮 2" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" ClickHandler="onReadCheckStatesClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadCheckStatesClick(event) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('CheckSelectedRows', {
                rows: getGridCheckRows(grid, ["CheckBoxField1"], true)
            });
            return false;
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照只读与可修改的复选框列，读取所选记录修改后的正文值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照两种是否在校列</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中第二个是否在校列的复选框，再尝试第一个同名列。<br />结果：第二列可在勾选和未勾选间切换，第一列只显示数据中的原始状态，不接受点击修改。</li>
                <li>选中刚才修改的行，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="选中行复选框的状态">选中行复选框的状态</strong>。<br />结果：浏览器读取所选行当前的正文复选框值，提示中包含修改后的勾选状态。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RenderAsStaticField</code>（<strong>两个是否在校列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：第一个是否在校列初始为 true，仅展示值；第二个初始为
                    false，允许点击切换。</li>
                <li><code>ColumnID</code>（<strong>第二个是否在校列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>CheckBoxField1</code>，把可修改的单元格值与只读对照列区分；两列虽然初次绑定同一字段，后续修改仍可独立读取。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
