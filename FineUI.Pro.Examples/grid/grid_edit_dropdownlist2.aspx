<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_dropdownlist2.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_dropdownlist2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:TemplateField EnableColumnHide="false" EnableHeaderMenu="false">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField HeaderText="性别">
                    <ItemTemplate>
                        <asp:DropDownList runat="server" ID="ddlGender">
                        </asp:DropDownList>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank"
                    ExpandUnusedSpace="true" MinWidth="150px" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" Text="获取用户输入的性别">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在行绑定事件中为每行的 ASP.NET 下拉框提供选项并回显性别。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>读取用户改选的模板值</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong>性别</strong>列改选一项，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="获取用户输入的性别">获取用户输入的性别</strong>。<br />结果：按钮回发后后台逐行查找 ddlGender，结果区列出各行当前选值；数据选项与初始值在服务器行绑定时设置。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowDataBound</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：找到本行模板下拉框，绑定<strong>性别</strong>列表并设置对应选值。</li>
                <li><code>GridRow.FindControl / SelectedValue</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：读取本行模板控件的当前选值，不能只读原数据字段代替用户输入。</li>
            </ul>
        </section>
    </template>
</body>
</html>
