<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_dropdownlist_update.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_dropdownlist_update" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            OnRowDataBound="Grid1_RowDataBound">
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
                <f:TemplateField ColumnID="Group" HeaderText="分组">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxGroupName" runat="server" Width="60px" TabIndex='<%# Container.DataItemIndex + 10 %>' Text='<%# Eval("Group") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" CssClass="marginr" Text="将分组值全部加一">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>

    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var inputselector = '.f-grid-tpl input';


        F.ready(function() {

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在回发中直接更新服务器模板里的下拉框、输入框及普通单元格，再通过重新绑定恢复源数据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>更新后重新绑定</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="将分组值全部加一">将分组值全部加一</strong>。<br />结果：后台遍历当前行的模板控件，把<strong>分组</strong>输入值加一，并把姓名单元格改为 Updated；<strong>性别</strong>控件也由该处理器直接赋值。
                </li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="重新绑定表格">重新绑定表格</strong>。<br />结果：后台换入数据源并重新绑定，模板按新记录生成；之前直接写入界面控件的值不作为数据库保存结果。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>GridRow.FindControl</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：按当前行查找模板控件，再修改 SelectedValue
                    或 Text。</li>
                <li><code>GridRow.Values</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：可同时更新普通列的显示内容，不必把整行改成模板。</li>
            </ul>
        </section>
    </template>
</body>
</html>
