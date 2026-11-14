<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid.aspx.cs" Inherits="FineUI.Pro.Examples.csp.grid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" CspScripts="true" CspScriptsAllowNonce="true" CspScriptsAllowUrls="cdn.jsdelivr.net,unpkg.com" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DataTextField="Name">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField DataField="AtSchool" HeaderText="是否在校" RendererFunction="renderInverseCheck1" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnShowSelectedRows" Text="选中了哪些行" ClickHandler="onShowSelectedNamesClick" runat="server"></f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script nonce="<%= PageManager.Instance.CspScriptsNonceValue %>">
        function renderInverseCheck1(value, params) {
            var checked = String(value).toLowerCase() === 'false';
            return $('<i>').addClass('f-icon f-iconfont f-grid-static-checkbox').toggleClass('f-checked', checked);
        }

    </script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/underscore@1.13.7/underscore-umd-min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/underscore@1.13.7/underscore-umd-min.js"></script>

    <script nonce="<%= PageManager.Instance.CspScriptsNonceValue %>" type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';

        function renderGender(value, params) {
            return value == 1 ? '男' : '女';
        }

        function onShowSelectedNamesClick(event) {
            var grid1 = F(gridClientID);

            if (!grid1.hasSelection()) {
                F.alert('没有选中项！');
            } else {
                var selectedRowTexts = _.map(grid1.getSelectedRows(true), function(rowData, index) {
                    return rowData.text;
                });
                F.alert(F.formatString('选中的项：{0}', selectedRowTexts.join(', ')));
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为严格 CSP 页面放行所需外部脚本来源，再用外部依赖渲染表格。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>验证外部依赖与选择</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中的性别列。<br />结果：本页具名渲染函数可以调用已加载的外部依赖，单元格显示中文性别。</li>
                <li>点击<strong class="example-control-reference" data-example-control="btnShowSelectedRows"
                        title="选中了哪些行">选中了哪些行</strong>。<br />结果：没有选择时显示空选择提示；选中记录后再次点击显示对应姓名。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CSP 脚本来源</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：只为本页使用的外部依赖放行相应来源，加载成功后才由渲染函数使用。</li>
            </ul>
        </section>
    </template>
</body>
</html>
