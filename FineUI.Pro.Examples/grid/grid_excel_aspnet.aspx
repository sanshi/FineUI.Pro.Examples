<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="grid_excel_aspnet.aspx.cs"
    Inherits="FineUI.Pro.Examples.data.grid_excel_aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <asp:GridView ID="GridView1" Width="900px" AutoGenerateColumns="false" runat="server">
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
                <asp:ImageField DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组">
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="导出为Excel文件" OnClick="Button2_Click"></asp:Button>
        <br />
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把原生 ASP.NET GridView 输出为可供 Excel 打开的表格文件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>导出原生 GridView</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control="Button2" title="导出为Excel文件">导出为Excel文件</strong>。<br />结果：页面普通提交，后台将
                    GridView 渲染的 HTML 写入附件响应，浏览器下载 myexcel.xls；文件内容是 HTML 表格，不是原生 XLSX 工作簿。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RenderControl / ContentType</code>（<strong class="example-control-reference" data-example-control="GridView1"
                        title="ASP.NET GridView">ASP.NET GridView</strong>）：把 <strong class="example-control-reference" data-example-control="GridView1"
                        title="ASP.NET GridView">ASP.NET GridView</strong>的渲染结果作为附件返回，并指定 Excel 对应的响应类型。</li>
            </ul>
        </section>
    </template>
</body>
</html>
