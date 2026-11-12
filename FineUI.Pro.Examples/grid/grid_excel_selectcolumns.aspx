<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_selectcolumns.aspx.cs" Inherits="FineUI.Pro.Examples.data.grid_excel_selectcolumns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_excel_selectcolumns_iframe_window.aspx,~/Code/GridExportUtil.cs" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Columns>
                <f:RowNumberField Width="60px" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnSelectColumns" runat="server" Text="选择需要导出的列（注意Window控件的EnableAjax属性）" ClickHandler="onSelectColumnsClick">
        </f:Button>
        <f:Window ID="Window1" Title="选择需要导出的列" Hidden="true" EnableIFrame="true" EnableMaximize="true" Target="Top" EnableResize="true" runat="server"
            OnClose="Window1_Close" IsModal="true" Width="450px" Height="250px" EnableAjax="false">
        </f:Window>
        <br />
        <br />
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Window1ClientID = '<%= Window1.ClientID %>';

        function onSelectColumnsClick(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/grid/grid_excel_selectcolumns_iframe_window.aspx") %>');
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>导出前在选择窗体中勾选需要的列，文件只包含本次选择的字段。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>选择导出字段</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSelectColumns").ClientID %>'
                        title="选择需要导出的列（注意Window控件的EnableAjax属性）">选择需要导出的列（注意Window控件的EnableAjax属性）</strong>，在窗体中取消<strong>姓名</strong>列的勾选。<br />结果：列选择保留在窗体内，主表的<strong>姓名</strong>列仍显示；这里选择的是导出字段。
                </li>
                <li>点击选择窗体中的导出入口。<br />结果：关闭参数带回选中的列标题，父页关闭事件通过普通回发生成 MyExcelFile.xls；文件中不再包含取消的<strong>姓名</strong>列。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnClose / CloseArgument</code>（<strong>页面导出处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：关闭窗体时读取以 # 分隔的列标题，只导出对应列。
                </li>
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="选择需要导出的列">选择需要导出的列</strong>）：初始为
                    <code>true</code>，使用独立子页显示可导出的列与勾选入口。
                </li>
                <li><code>EnableAjax</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="选择需要导出的列">选择需要导出的列</strong>）：初始为
                    <code>false</code>，关闭事件使用普通回发，让附件响应由浏览器接收。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
