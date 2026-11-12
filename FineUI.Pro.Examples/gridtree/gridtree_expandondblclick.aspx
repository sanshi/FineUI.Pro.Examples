<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_expandondblclick.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_expandondblclick" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" DataKeyNames="Id,Name"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" EnableRowDoubleClickEvent="true"
            OnRowDoubleClick="Grid1_RowDoubleClick" TreeExpandOnDblClick="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderField Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>双击节点仅执行本页行双击处理，树分支仍由展开箭头控制。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>区分双击与树展开</h3>
            <ol>
                <li>双击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>一个父行。<br />结果：触发行双击回发并显示当前记录资料，分支不会因双击自动展开或折叠。</li>
                <li>点击同一行<strong>名称</strong>前的展开箭头。<br />结果：分支正常展开或折叠；禁用双击展开不会禁用专用箭头。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本示例启用了行双击事件（EnableRowDoubleClickEvent），禁用了双击展开树节点（TreeExpandOnDblClick）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TreeExpandOnDblClick</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>false</code>，关闭双击展开，让行双击留给本页业务处理。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
