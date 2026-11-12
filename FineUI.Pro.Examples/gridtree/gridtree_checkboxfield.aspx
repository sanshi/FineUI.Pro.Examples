<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_checkboxfield.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_checkboxfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell.hidethis .f-grid-checkbox {
            display: none;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" DataKeyNames="Id,Name"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderCheckField ColumnID="FollowFolder" RenderAsStaticField="false" HeaderText="关注目录" />
                <f:RenderField Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button CssClass="marginr" ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="关注的目录列表" ClickHandler="onReadFollowFoldersClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadFollowFoldersClick(event) {
            F.customEvent('ReadFollowFolders', {
                rows: getGridCheckRows(F('<%= Grid1.ClientID %>'), ['FollowFolder'], false)
            });
            return false;
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>只为目录显示关注复选框，读取已关注目录，文件行不提供这个操作。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>关注目录并读取名单</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong><strong>关注目录</strong>列勾选一个目录，再查看文件行。<br />结果：目录可切换关注状态，文件行的关注复选框隐藏；树展开与关注状态分别处理。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="关注的目录列表">关注的目录列表</strong>。<br />结果：提示列出正文关注复选框已勾选的目录标识和<strong>名称</strong>，不把整行选择当作关注状态。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction / cellCls</code>（<strong>关注目录列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>）：按<strong>类型</strong>为非文件夹单元格添加隐藏样式，保留树列本身。</li>
            </ul>
        </section>
    </template>
</body>
</html>
