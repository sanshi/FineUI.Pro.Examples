<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_multiselect_showcheckbox_autohide.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_multiselect_showcheckbox_autohide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/gridcard.js" />
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIdField="Id"
            DataKeyNames="Id,Name" Height="500px" DisplayType="Card" CardRendererFunction="renderCard" EnableCheckBoxSelect="true"
            CheckBoxSelectAutoHide="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名"></f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份"></f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期"></f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校"></f:RenderCheckField>
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="选中第 2, 6, 8 行" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" Text="选中了哪些行（没选择的话不会回发页面）" OnClick="Button1_Click" ClickHandler="onButton3Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onButton3Click(event) {
            if (!F(Grid1ClientID).hasSelection()) {
                F.alert({
                    message: '没有选中项！',
                    messageIcon: 'information',
                    target: '_top'
                });
                return false;
            };
        }

    </script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/gridcard.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按需显示卡片复选入口，保留当前已选卡片的可辨识状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>按本页规则选择卡片</h3>
            <ol>
                <li>依次点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>前两张卡片的选择框。<br />结果：两张卡片同时保留选择；再操作一张卡片可取消对应项，不改变卡片资料。</li>
                <li>把鼠标移入与移出未选卡片。<br />结果：未选项选择入口按需出现，已选项保持可识别，选择集合不随鼠标离开而清空。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="选中了哪些行">选中了哪些行</strong>。<br />结果：提示当前选中卡片对应的记录，不把卡片位置当作业务主键。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CheckBoxSelectAutoHide</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，让复选入口按当前交互状态自动显示或隐藏。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
