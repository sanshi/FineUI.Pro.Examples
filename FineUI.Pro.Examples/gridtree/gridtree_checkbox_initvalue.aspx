<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_checkbox_initvalue.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.treegrid_checkbox_initvalue" %>

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
            <p>首次绑定即恢复指定树节点的勾选，不依赖用户逐项点击。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>核对初始勾选</h3>
            <ol>
                <li>刚打开页面，展开已配置的目录并查看勾选状态。<br />结果：本页指定的父节点与子节点已勾选，二者按各自初始配置显示。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetCheckedValues").ClientID %>'
                        title="获取选中的复选框">获取选中的复选框</strong>。<br />结果：客户端读取已勾选树节点并交给后台，在结果区域显示标识与<strong>名称</strong>；没有勾选时显示对应提示。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本树表格默认选中 [common] 和 [menu.xml] 的复选框。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TreeNodeChecked</code>（<strong>行绑定处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>）：行绑定时按稳定节点标识设置初始勾选，必要的父目录同时展开。</li>
                <li><code>getCheckedRows</code>（<strong>读取勾选的页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：读取树复选框结果，不使用
                    getSelectedRows 代替节点勾选。</li>
            </ul>
        </section>
    </template>
</body>
</html>
