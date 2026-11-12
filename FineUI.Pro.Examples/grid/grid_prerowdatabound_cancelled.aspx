<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_prerowdatabound_cancelled.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_prerowdatabound_cancelled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="3" ShowBorder="true" ShowHeader="true"
            OnPreRowDataBound="Grid1_PreRowDataBound" runat="server" EnableCheckBoxSelect="true" OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="bfEntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="cbxAtSchool" TextAlign="Center" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="hlMajor" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                    RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" Hidden="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField TextAlign="Center" ColumnID="lbfAction1" Width="60px">
                    <Commands>
                        <f:Command ConfirmText="你确定要这么做么？" ConfirmTarget="Top" CommandName="Action1" Text="按钮" />
                    </Commands>
                </f:RenderField>
                <f:RenderField TextAlign="Center" ColumnID="lbfAction2" Width="60px">
                    <Commands>
                        <f:Command ConfirmText="你确定要这么做么？" Icon="Delete" ConfirmTarget="Top" CommandName="Action2" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在行预绑定时取消指定记录的输出，使不符合条件的数据不出现在表格中。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>核对被过滤的记录</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的入学年份列。<br />结果：入学年份小于 2004 的记录在预绑定事件中被跳过，页面只输出其余记录；这不是把已渲染的行用 CSS 隐藏。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本示例不显示入学年份小于2004的行数据（通过PreRowDataBound事件参数Cancelled控制，在服务器端数据绑定时过滤数据）。</p>
            <p>注：本示例不显示入学年份小于2004的行数据（通过PreRowDataBound事件参数Cancelled控制，在服务器端数据绑定时过滤数据）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Cancelled</code>（<strong>行预绑定事件参数</strong>，来自<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：命中入学年份小于 2004 时赋为
                    true，取消当前行的绑定。</li>
            </ul>
        </section>
    </template>
</body>
</html>
