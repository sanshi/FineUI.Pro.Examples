<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowdatabound.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowdatabound" %>

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
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
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
            <p>在服务器行绑定后修改年份单元格的 HTML 显示。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>比较年份文字的条件样式</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>不同入学年份的记录。<br />结果：不小于 2004 的年份使用 colorgreen，其他使用 colorred；只改年份显示，原数据不因此更新。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowDataBound / GetCellValue / SetCellValue</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：取得指定列渲染值，包装样式后写回本行单元格。</li>
            </ul>
        </section>
    </template>
</body>
</html>
