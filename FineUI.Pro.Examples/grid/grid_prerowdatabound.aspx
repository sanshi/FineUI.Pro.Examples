<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_prerowdatabound.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_prerowdatabound" %>

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
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="cbxAtSchool" TextAlign="Center" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="hlMajor" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank"
                    ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" Hidden="true" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:LinkButtonField TextAlign="Center" ConfirmText="你确定要这么做么？" ConfirmTarget="Top" ColumnID="lbfAction1" Width="60px" CommandName="Action1"
                    Text="按钮" />
                <f:LinkButtonField TextAlign="Center" ConfirmText="你确定要这么做么？" Icon="Delete" ConfirmTarget="Top" ColumnID="lbfAction2" Width="60px"
                    CommandName="Action2" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在服务器行预绑定阶段按入学年份决定本行操作是否可用，并修改专业链接文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>比较可用与禁用的行入口</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>对照入学年份不小于 2004 和早于 2004 的记录，尝试操作是否在校及行内<strong>按钮</strong>。<br />结果：不小于 2004 的行允许操作，较早记录的对应入口禁用；专业链接还附带本行入学年份。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本示例不允许对入学年份小于2004的记录进行操作。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PreRowDataBound / Enabled</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：在每行绑定前读源数据，给该行即将渲染的列设置是否可用。
                </li>
                <li><code>DataTextFormatString</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：专业链接的显示格式逐行附加入学年份。</li>
            </ul>
        </section>
    </template>
</body>
</html>
