<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_aspnet.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <asp:GridView ID="GridView1" Width="800px" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="姓名" />
                <asp:TemplateField HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <asp:CheckBoxField DataField="AtSchool" HeaderText="是否在校" />
                <asp:HyperLinkField HeaderText="所学专业" DataTextField="Major" DataTextFormatString="{0}" DataNavigateUrlFields="Major"
                    DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" Target="_blank" />
                <%--<asp:ImageField DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组">
                </asp:ImageField>--%>
                <asp:BoundField DataField="LogTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="注册日期" />
            </Columns>
        </asp:GridView>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用原生 ASP.NET GridView 显示学生数据，作为 FineUI 表格的对照。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看 ASP.NET 表格</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= GridView1.ClientID %>' title="ASP.NET GridView">ASP.NET
                        GridView</strong>的姓名、性别和专业等列。<br />结果：后台绑定学生记录，BoundField 读取数据字段，模板列及专用列分别呈现性别、复选框、链接和图片。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataSource / DataBind</code>（<strong class="example-control-reference" data-example-control='<%= GridView1.ClientID %>'
                        title="ASP.NET GridView">ASP.NET GridView</strong>）：后台读取示例数据并绑定 ASP.NET GridView；此处是原生 ASP.NET 控件的对照示例。</li>
                <li><code>AutoGenerateColumns</code>（<strong class="example-control-reference" data-example-control='<%= GridView1.ClientID %>'
                        title="ASP.NET GridView">ASP.NET
                        GridView</strong>）：初始为 <code>false</code>，仅显示页面显式声明的数据列与模板列。</li>
            </ul>
        </section>
    </template>
</body>
</html>
