<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_findcontrol.aspx.cs" Inherits="FineUI.Pro.Examples.data.grid_excel_findcontrol" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Columns>
                <f:TemplateField ColumnID="tfNumber" Width="60px">
                    <ItemTemplate>
                        <asp:Label ID="labNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="tfGender" HeaderText="性别" TextAlign="Center">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="labGender" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" TextAlign="Center" />
                <f:CheckBoxField ColumnID="cbfAtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank"
                    ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="ifGroup" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" EnableAjax="false" DisableControlBeforePostBack="false" runat="server" Text="导出为Excel文件" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>导出包含服务器模板列的表格，通过查找模板控件读取内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>导出模板中的当前内容</h3>
            <ul>
                <li>修改可输入的模板内容后，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="导出为Excel文件">导出为Excel文件</strong>。<br />结果：普通回发返回 myexcel.xls 附件，导出处理遍历表格列与行，查找本行模板内的 Label 或输入框并读取其值。文件实质是 Excel 可读取的 HTML 表格，非原生
                    XLSX。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>GridRow.FindControl</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：进入当前行模板读取指定控件值，避免把模板占位标记当成导出内容。</li>
                <li><code>EnableAjax / Response</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：下载按钮使用普通请求，附件响应交给浏览器处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
