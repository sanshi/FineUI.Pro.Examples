<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_checkbox_disabled.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_checkbox_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" DataTextField="Name" TreeCheckBox="true" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderField Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick" MarginRight="5">
        </f:Button>
        <f:Button runat="server" ID="btnGetCheckedValues" Text="获取选中的复选框" OnClick="btnGetCheckedValues_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>禁用指定目录的树复选框，保留其当前勾选状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>比较受限与普通节点</h3>
            <ol>
                <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>的 basic、res 等目录，尝试切换<strong>名称</strong>旁的树复选框。<br />结果：basic 与 res 的复选框不能被用户切换，已勾选与未勾选的初始状态保持；其他节点仍可操作。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetCheckedValues").ClientID %>'
                        title="获取选中的复选框">获取选中的复选框</strong>。<br />结果：客户端读取已勾选树节点并交给后台，在结果区域显示标识与<strong>名称</strong>；没有勾选时显示对应提示。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本树表格默认禁用 [basic] 和 [res] 两个目录的复选框。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TreeNodeCheckBoxDisabled</code>（<strong>行绑定处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：本页为 basic 与 res 指定
                    true，阻止用户切换；独立的 checked 状态仍决定初始是否勾选。</li>
                <li><code>getCheckedRows</code>（<strong>读取勾选的页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：读取树复选框结果，不使用
                    getSelectedRows 代替节点勾选。</li>
            </ul>
        </section>
    </template>
</body>
</html>
