<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_beforesorting.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_beforesorting" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true" SortField="Name"
            SortDirection="ASC" OnSort="Grid1_Sort">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top" ToolbarAlign="Right">
                    <Items>
                        <f:CheckBox runat="server" ID="cbxEnableSorting" Checked="false" Text="允许排序"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxEnablePaging" Checked="false" Text="允许分页"></f:CheckBox>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" SortField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';
        var cbxEnableSortingClientID = '<%= cbxEnableSorting.ClientID %>';
        var cbxEnablePagingClientID = '<%= cbxEnablePaging.ClientID %>';

        F.ready(function() {

            F(grid1ClientID).on('beforesorting', function(event, sortField, sortDirection, columnId) {
                if (!F(cbxEnableSortingClientID).isChecked()) {
                    F.alert('不允许排序！');
                    return false;
                }
            });


            F(grid1ClientID).on('beforepaging', function(event, pageIndex, oldPageIndex) {
                if (!F(cbxEnablePagingClientID).isChecked()) {
                    F.alert('不允许分页！');
                    return false;
                }
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在真正发出分页或排序请求前，按两个开关决定是否允许本次操作。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>在浏览器中拦截操作</h3>
            <ol>
                <li>取消<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxEnableSorting").ClientID %>'
                        title="允许排序">允许排序</strong>，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的可排序列标题。<br />结果：浏览器提示不允许排序并取消该次操作，数据不重排。</li>
                <li>取消<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxEnablePaging").ClientID %>'
                        title="允许分页">允许分页</strong>，再点击下一页；重新勾选对应开关后再试。<br />结果：关闭开关时提示不允许分页，页码和记录不变；开启后才正常发出相应请求。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>beforesorting / beforepaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：在排序或换页前检查开关，返回 false
                    可取消当前操作，不必先请求后台。</li>
            </ul>
        </section>
    </template>
</body>
</html>
