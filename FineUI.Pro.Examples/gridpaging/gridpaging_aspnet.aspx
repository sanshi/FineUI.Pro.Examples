<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_aspnet.aspx.cs" Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <asp:GridView ID="Grid1" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true" runat="server"
            EnableCheckBoxSelect="true" Width="800px" AutoGenerateColumns="false" OnPageIndexChanging="Grid1_PageIndexChanging">
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
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用原生 ASP.NET GridView 演示服务器分页，作为 FineUI 表格的对照。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看 ASP.NET 表格</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= Grid1.ClientID %>' title="ASP.NET GridView">ASP.NET
                        GridView</strong>的姓名、性别和专业等列。<br />结果：后台绑定学生记录，BoundField 读取数据字段，模板列及专用列分别呈现性别、复选框、链接和图片。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>使用 GridView 分页</h3>
            <ul>
                <li>点击表格下方的其他页码。<br />结果：页面整页提交；PageIndexChanging 处理器采用新页索引，重新绑定完整数据，由 ASP.NET GridView 输出对应页的记录。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataSource / DataBind</code>（<strong class="example-control-reference" data-example-control='<%= Grid1.ClientID %>'
                        title="ASP.NET GridView">ASP.NET
                        GridView</strong>）：后台读取示例数据并绑定 ASP.NET GridView；此处是原生 ASP.NET 控件的对照示例。</li>
                <li><code>AllowPaging / PageSize</code>（<strong class="example-control-reference" data-example-control='<%= Grid1.ClientID %>'
                        title="ASP.NET GridView">ASP.NET
                        GridView</strong>）：启用 ASP.NET GridView 自带分页，并限制每页记录数；换页通过服务器事件完成。</li>
            </ul>
        </section>
    </template>
</body>
</html>
