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
        <f:Grid AllowCellEditing="true" DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="3" ShowBorder="true"
            ShowHeader="true" OnPreRowDataBound="Grid1_PreRowDataBound" runat="server" EnableCheckBoxSelect="true" OnRowCommand="Grid1_RowCommand">
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
        注：本示例不显示入学年份小于2004的行数据（通过PreRowDataBound事件参数Cancelled控制，在服务器端数据绑定时过滤数据）。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-pro.js") %>"></script>
</body>
</html>
