<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_more.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_more" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .morebutton {
            width: 100%;
            text-align: center;
            margin: 8px 0;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel IsFluid="true" Title="面板" runat="server" Height="350px" AutoScroll="true">
            <Items>
                <f:Grid DataIDField="Id" ID="Grid1" EnableCollapse="false" ShowBorder="false" ShowHeader="false" runat="server" EnableCheckBoxSelect="true"
                    AttributeDataTag="0" PagingToolbarVisible="false">
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                        <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                        <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                            RendererFunction="renderMajor" />
                        <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                    </Columns>
                </f:Grid>
                <f:LinkButton runat="server" CssClass="morebutton" Text="加载更多..." ID="btnMore" OnClick="btnMore_Click"></f:LinkButton>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onShowSelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>

    <script>
        //:: 表格嵌在面板里，客户端 id 是渲染后的 ClientID（不等于声明的 Grid1），所以包一层把它传进去
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onShowSelectedRowsClick(event) {
            notifySelectedRows(grid1ClientID);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>点击加载更多，把下一批记录追加到已有数据后面。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>逐批追加记录</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnMore").ClientID %>'
                        title="加载更多...">加载更多...</strong>。<br />结果：触发本页加载处理，后台读取下一批记录并追加，已显示的记录仍保留。</li>
                <li>继续加载，直到没有剩余记录。<br />结果：加载入口变为不可继续加载的状态；不会重复追加最后一批记录。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AppendData</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：把新一批数据追加到表格；区别于重新绑定时替换现有记录。
                </li>
                <li><code>PagingToolbarVisible</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>false</code>，隐藏常规分页栏，改由加载更多入口追加记录。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
