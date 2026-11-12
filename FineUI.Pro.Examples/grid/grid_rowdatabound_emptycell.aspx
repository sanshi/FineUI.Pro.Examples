<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowdatabound_emptycell.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowdatabound_emptycell" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .colorred {
            font-weight: bold;
            color: red;
        }

        .colorgreen {
            font-weight: bold;
            color: green;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="3" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" OnRowCommand="Grid1_RowCommand" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="bfEntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="cbfAtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank"
                    ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:LinkButtonField TextAlign="Center" ConfirmText="你确定要这么做么？" ConfirmTarget="Top" ColumnID="lbfAction1" Width="60px" CommandName="Action1"
                    Text="按钮" />
                <f:LinkButtonField TextAlign="Center" ConfirmText="删除选中行？" Icon="Delete" ConfirmTarget="Top" ColumnID="lbfAction2" Width="60px"
                    CommandName="Action2" />
            </Columns>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在服务器行绑定后清空指定记录的复选框与删除单元格。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看条件命中的空白单元格</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中入学年份为 2008 的记录。<br />结果：2008 年记录的是否在校和删除入口为空白，其余单元格保留；不是把这一行删除。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：当[入学年份]为2008年时，清空[是否在校]和[删除]两列的单元格。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowDataBound / SetCellValue</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：条件命中后把对应列渲染内容设为空。</li>
            </ul>
        </section>
    </template>
</body>
</html>
