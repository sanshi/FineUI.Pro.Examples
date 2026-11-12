<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_window.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>行命令弹窗</title>
    <meta name="sourcefiles" content="~/grid/grid_rowcommand_window_details.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" Title="客户列表" ShowHeader="true" ShowBorder="true" IsFluid="true" DataIDField="ID">
            <Columns>
                <f:RenderField HeaderText="客户编号" DataField="ID" Width="150px" />
                <f:RenderField HeaderText="客户标识" DataField="Slug" Width="220px" />
                <f:RenderField HeaderText="客户姓名" DataField="DisplayName" Width="150px" />
                <f:RenderField HeaderText="操作" ExpandUnusedSpace="true">
                    <Commands>
                        <f:Command Text="查看客户" CommandName="View" WindowID="Details" WindowIFrameUrlFormatString="grid_rowcommand_window_details.aspx?slug={0}"
                            WindowIFrameUrlFields="Slug" WindowTitleFormatString="客户 - {0}" WindowTitleFields="DisplayName" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <f:Window ID="Details" runat="server" Title="客户详情" Width="500px" Height="300px" IsModal="true" EnableIFrame="true" Hidden="true" />


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>由行命令按当前记录的不同字段分别生成详情网址与窗体标题。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>按当前行打开详情</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="客户列表">客户列表</strong>第一行的<strong>查看客户</strong>，关闭后再打开另一行。<br />结果：每次打开都读取本次行数据，网址参数取自 <code>Slug</code>，标题文字取自
                    <code>DisplayName</code>；切换记录后不会沿用前一行参数。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>WindowIFrameUrlFields / WindowIFrameUrlFormatString</code>（<strong>行命令</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="客户列表">客户列表</strong>）：从当前行的指定字段取值，填入详情网址中的参数位置。
                </li>
                <li><code>WindowTitleFields / WindowTitleFormatString</code>（<strong>行命令</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="客户列表">客户列表</strong>）：标题独立从指定字段取值，可以与网址字段不同。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
