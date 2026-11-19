<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_iframe_alert.aspx.cs" Inherits="FineUI.Pro.Examples.iframe.grid_iframe_alert" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/grid_iframe_alert_window.aspx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel7" IsFluid="true" runat="server" BodyPadding="10px" Title="Panel" ShowBorder="true" ShowHeader="true" Layout="VBox"
            BoxConfigAlign="Stretch">
            <Items>
                <f:Form ID="Form5" ShowBorder="false" ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TwinTriggerBox runat="server" EmptyText="输入要搜索的关键词" ShowLabel="false" ID="ttbSearch" ShowTrigger1="false"
                                    OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click" Trigger1Icon="Clear"
                                    Trigger2Icon="Search">
                                </f:TwinTriggerBox>
                                <f:DropDownList ID="DropDownList1" ShowLabel="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server">
                                    <f:ListItem Text="过滤条件一" Value="filter1" />
                                    <f:ListItem Text="过滤条件二" Value="filter2" />
                                    <f:ListItem Text="过滤条件三" Value="filter3" />
                                </f:DropDownList>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Grid DataIDField="Id" ID="Grid2" Title="Grid2" PageSize="10" ShowBorder="true" BoxFlex="1" AllowPaging="true" IsDatabasePaging="false"
                    ShowHeader="false" runat="server" EnableCheckBoxSelect="true" OnSort="Grid2_Sort">
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                        <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                        <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                            RendererFunction="renderMajor" />
                        <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                        <f:RenderField ColumnID="myWindowField" TextAlign="Center">
                            <Commands>
                                <f:Command Icon="Pencil" ToolTip="编辑" WindowID="Window1" WindowIFrameUrlFields="Id,Name"
                                    WindowIFrameUrlFormatString="./grid_iframe_alert_window.aspx?id={0}&name={1}" WindowTitle="编辑"
                                    WindowIFrameUrl="~/alert.aspx" CommandName="Edit" />
                            </Commands>
                        </f:RenderField>
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
        <f:Window ID="Window1" Title="弹出窗体" Hidden="true" EnableIFrame="true" EnableMaximize="true" Target="Top" EnableResize="true" runat="server"
            CloseAction="HidePostBack" OnClose="Window1_Close" IsModal="true" Width="850px" Height="550px">
        </f:Window>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示子页面保存后在顶层显示提示，确认后按配置的关闭回发动作通知父页。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>确认提示后通知父页</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid2").ClientID %>'
                        title="Grid2">Grid2</strong>点击第一行的<strong>编辑</strong>或弹出窗体入口。<br />结果：<code>iframe</code> 窗体打开当前记录，标题或地址包含本次选择的行信息；不会固定打开同一条记录。</li>
                <li>在子页面点击保存按钮，再确认顶层提示。<br />结果：提示确认后才执行本页关闭及父页通知逻辑；表格标题显示本次回发参数，本例不因此承诺已保存数据库。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid2").ClientID %>'
                        title="Grid2">Grid2</strong>）：初始为<code>Id</code>，表格使用稳定的记录 <code>ID</code> 识别当前行。</li>
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="弹出窗体">弹出窗体</strong>）：初始为<code>true</code>，编辑窗体使用独立子页面。</li>
                <li><code>IFrameUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="弹出窗体">弹出窗体</strong>）：本页根据当前记录拼接子页面地址及必要参数。
                </li>
                <li><code>GetCustomEventReference()</code>（<strong>子页面与父页面交互</strong>）：子页面向正确的父页面发送本页约定的更新通知。</li>
            </ul>
        </section>
    </template>
</body>
</html>
