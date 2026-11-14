<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_aspnet.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%-- 原生表格和页码标签需要整页重新渲染；关闭 AJAX，让翻页后的记录和页码一起更新。 --%>
        <f:PageManager ID="PageManager1" EnableAjax="false" runat="server" />
        <asp:GridView ID="Grid1" Title="表格" Width="800px" ShowBorder="true" runat="server" EnableCheckBoxSelect="true" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <asp:TemplateField HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <asp:CheckBoxField DataField="AtSchool" HeaderText="是否在校" />
                <asp:HyperLinkField HeaderText="所学专业" DataTextField="Major" DataTextFormatString="{0}" DataNavigateUrlFields="Major"
                    DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" Target="_blank" />
                <asp:ImageField DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组">
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="btnPrevious" CommandName="Previous" runat="server" OnCommand="OnPageButtonClick" UseSubmitBehavior="false" Text="Previous" />
        <asp:Button ID="btnNext" runat="server" CommandName="Next" OnCommand="OnPageButtonClick" UseSubmitBehavior="false" Text="Next" />
        Page
        <asp:Label runat="server" ID="lblCurrentPage"></asp:Label>
        of
        <asp:Label runat="server" ID="lblTotalPages"></asp:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用原生 ASP.NET GridView 与自定义上一页、下一页按钮演示后台按页取数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看 ASP.NET 表格</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= Grid1.ClientID %>' title="ASP.NET GridView">ASP.NET
                        GridView</strong>的姓名、性别和专业等列。<br />结果：后台绑定学生记录，BoundField 读取数据字段，模板列及专用列分别呈现性别、复选框、链接和图片。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>用自定义按钮换页</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= btnNext.ClientID %>' title="Next">Next</strong>，再点击<strong
                        class="example-control-reference" data-example-control='<%= btnPrevious.ClientID %>'
                        title="Previous">Previous</strong>。<br />结果：按钮整页提交，后台按页面保存的页索引读取当前页记录，并更新当前页、总页数及按钮是否可用；首页不能继续向前，末页不能继续向后。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableAjax</code>（<strong>页面的 PageManager1</strong>）：初始为 <code>false</code>，翻页时整页提交，同时更新原生表格、页码标签和分页按钮状态。</li>
                <li><code>DataSource / DataBind</code>（<strong class="example-control-reference" data-example-control='<%= Grid1.ClientID %>'
                        title="ASP.NET GridView">ASP.NET
                        GridView</strong>）：后台读取示例数据并绑定 ASP.NET GridView；此处是原生 ASP.NET 控件的对照示例。</li>
                <li><code>CurrentPageIndex / PAGE_SIZE</code>（<strong>页面</strong>）：本页自行保存从 0 开始的当前页索引，页大小为 <code>5</code>；它们用于按页读取数据与更新分页按钮。</li>
            </ul>
        </section>
    </template>
</body>
</html>
