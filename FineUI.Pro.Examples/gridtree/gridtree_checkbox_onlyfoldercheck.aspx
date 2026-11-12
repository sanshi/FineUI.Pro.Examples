<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_checkbox_onlyfoldercheck.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_checkbox_onlyfoldercheck" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" DataTextField="Name" TreeCheckBox="true" TreeOnlyFolderCheck="true">
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
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>只在目录节点显示树复选框，文件仅供查看。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>限制可勾选节点类型</h3>
            <ol>
                <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>的 basic、res 等目录，尝试切换<strong>名称</strong>旁的树复选框。<br />结果：目录有复选框，叶子文件不显示，目录展开与勾选分别操作。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetCheckedValues").ClientID %>'
                        title="获取选中的复选框">获取选中的复选框</strong>。<br />结果：客户端读取已勾选树节点并交给后台，在结果区域显示标识与<strong>名称</strong>；没有勾选时显示对应提示。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TreeOnlyFolderCheck</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>true</code>，只给非叶子目录创建树复选框。
                </li>
                <li><code>getCheckedRows</code>（<strong>读取勾选的页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：读取树复选框结果，不使用
                    getSelectedRows 代替节点勾选。</li>
            </ul>
        </section>
    </template>
</body>
</html>
