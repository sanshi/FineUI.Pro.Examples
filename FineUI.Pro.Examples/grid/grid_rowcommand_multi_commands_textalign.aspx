<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_multi_commands_textalign.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_multi_commands_textalign" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="多命令对齐" ShowBorder="true" ShowHeader="true" EnableColumnLines="true" DataIDField="Id"
            DataKeyNames="Id,Name" OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="LeftActions" Width="90px" TextAlign="Left" HeaderText="左对齐">
                    <Commands>
                        <f:Command CommandName="LeftEdit" Icon="Pencil" />
                        <f:Command CommandName="LeftDelete" Icon="Delete" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="CenterActions" Width="90px" TextAlign="Center" HeaderText="居中">
                    <Commands>
                        <f:Command CommandName="CenterEdit" Icon="Pencil" />
                        <f:Command CommandName="CenterDelete" Icon="Delete" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="RightActions" Width="90px" TextAlign="Right" HeaderText="右对齐">
                    <Commands>
                        <f:Command CommandName="RightEdit" Icon="Pencil" />
                        <f:Command CommandName="RightDelete" Icon="Delete" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在同一列内居中排列多个命令，分别保留它们的命令标识与点击处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照命令外观与对应结果</h3>
            <ul>
                <li>分别点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="多命令对齐">多命令对齐</strong>同一行中的文字或图标命令，出现确认框时先确认。<br />结果：命令回发后，<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>'
                        title="命令结果">命令结果</strong>显示所点记录和命令信息；改变显示外观或同列排列，不会把多个入口合并为同一命令。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TextAlign</code>（<strong>操作列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="多命令对齐">多命令对齐</strong>）：所属操作列配置居中对齐，使一组命令在列宽中居中显示。</li>
            </ul>
        </section>
    </template>
</body>
</html>
