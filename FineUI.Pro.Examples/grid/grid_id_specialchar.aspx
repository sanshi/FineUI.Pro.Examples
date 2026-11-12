<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_id_specialchar.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_id_specialchar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged" DataIDField="Id">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="60px" TextAlign="Left" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Id" HeaderText="ID" />
                <f:RenderField Width="150px" DataField="EntranceTime" HeaderText="时间" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <br />
    <br />
    @!^&*\"'
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用包含中文、空格等特殊字符的业务主键绑定表格，验证选中行仍按完整主键识别。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>选择特殊字符主键的行</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>勾选一行，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="选中了哪些行">选中了哪些行</strong>。<br />结果：提示显示选中行对应的完整主键，中文和空格不会被拆成多个主键。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：表格的DataIDField属性定义的行标识符中可以包含特殊字符，比如：.$#</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Id</code>，指定保存业务主键的字段；字段值不要求是数字，也不应被手工转换成数字。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
