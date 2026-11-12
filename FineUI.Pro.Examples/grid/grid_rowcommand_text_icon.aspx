<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_text_icon.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_text_icon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="行命令文本与图标" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="Actions" Width="260px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="EncodedText" Text="&lt;普通文本&gt;" />
                        <f:Command CommandName="TrustedText" Text="&lt;strong&gt;可信 HTML&lt;/strong&gt;" TextRaw="true" />
                        <f:Command CommandName="ImageIcon" Icon="Pencil" ToolTip="图片图标" />
                        <f:Command CommandName="FontIcon" IconFont="_Close" IconFontClass="text-danger" ToolTip="字体图标" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br /><br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用自定义命令正文或图标显示行操作，点击后仍按命令名处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照命令外观与对应结果</h3>
            <ul>
                <li>分别点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="行命令文本与图标">行命令文本与图标</strong>同一行中的文字或图标命令，出现确认框时先确认。<br />结果：命令回发后，<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>'
                        title="命令结果">命令结果</strong>显示所点记录和命令信息；改变显示外观或同列排列，不会把多个入口合并为同一命令。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>普通文本默认编码；只有显式 TextRaw=&quot;true&quot; 的开发者可信文本才原样输出。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TextRawHtml</code>（<strong>行命令</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="行命令文本与图标">行命令文本与图标</strong>）：控制命令显示的正文或图标；业务动作仍由命令标识或对应点击处理器决定。</li>
            </ul>
        </section>
    </template>
</body>
</html>
