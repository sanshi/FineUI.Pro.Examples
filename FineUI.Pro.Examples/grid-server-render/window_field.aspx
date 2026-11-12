<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.window_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>弹窗列：窗口地址与标题</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="弹窗列：窗口地址与标题"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:WindowField ColumnID="Edit" HeaderText="编辑" Text="编辑" WindowID="Window1" DataIFrameUrlFields="Id,Name"
                    DataIFrameUrlFormatString="../grid/grid_iframe_window.aspx?id={0}&amp;name={1}" DataWindowTitleField="Name"
                    DataWindowTitleFormatString="编辑 - {0}" />
            </Columns>
        </f:Grid>
        <f:Window ID="Window1" runat="server" Hidden="true" EnableIFrame="true" Width="600px" Height="400px" Title="编辑" />

        <f:Label ID="labResult" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>由窗口列读取当前行编号与姓名，拼出编辑窗口地址和标题。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>打开不同行对应的窗口</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="弹窗列：窗口地址与标题">弹窗列：窗口地址与标题</strong>第一行的编辑，再关闭并打开另一行。<br />结果：窗口标题与 iframe 地址采用被点击行的编号和<strong>姓名</strong>；重新打开另一行时参数随之变化，不沿用上次记录。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>WindowField 按当前行拼出窗口地址和标题；新项目优先使用 RenderField.Commands 的窗口命令。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>WindowID</code>（<strong>窗口列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="弹窗列：窗口地址与标题">弹窗列：窗口地址与标题</strong>）：关联本页编辑窗口，链接点击复用该窗口。</li>
                <li><code>DataIFrameUrlFields / DataIFrameUrlFormatString</code>（<strong>窗口列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="弹窗列：窗口地址与标题">弹窗列：窗口地址与标题</strong>）：把行编号与<strong>姓名</strong>填入子页地址；标题通过对应标题格式生成。</li>
            </ul>
        </section>
    </template>
</body>
</html>
