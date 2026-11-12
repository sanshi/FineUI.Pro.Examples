<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_lazyload_templatefield.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_lazyload_templatefield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound" OnRowLazyLoad="Grid1_RowLazyLoad">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="修改日期" />
                <f:TemplateField Width="180px" HeaderText="模板列（名称）">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在树节点按需加载子记录时同时创建服务器模板列内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>逐层加载模板行</h3>
            <ol>
                <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>的 basic（延迟加载）文件夹。<br />结果：后台按行编号 50 读取其子记录，追加到当前树中，原有节点保留；模板列一并生成。</li>
                <li>继续展开新出现的 Captcha 文件夹。<br />结果：后台按行编号 54 加载下一层子记录，层级与已有模板内容保持。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataParentIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>ParentId</code>，通过父编号把新记录挂到正确文件夹。
                </li>
                <li><code>RowLazyLoad / DataBind(true)</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>）：按展开节点取数，以追加绑定保留当前树；模板列仍按新行正常绑定。</li>
            </ul>
        </section>
    </template>
</body>
</html>
