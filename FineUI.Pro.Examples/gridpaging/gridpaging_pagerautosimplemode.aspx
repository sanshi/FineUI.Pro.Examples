<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pagerautosimplemode.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pagerautosimplemode" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%-- 在 PageManager 级别开启“窄屏自动简洁分页” --%>
        <f:PageManager ID="PageManager1" runat="server" GridPagerAutoSimpleMode="true" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" ShowPageSizeSelector="true" runat="server" OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="60px" />
                <f:RenderField Width="150px" DataField="Id" HeaderText="ID" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="EntranceTime" HeaderText="时间" />
            </Columns>
        </f:Grid>
        <br />
        <%-- 说明文字放在表格下方 --%>

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>表格变窄时自动把完整分页栏收为简洁页码，重新拉宽后恢复完整入口。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>对照宽窄分页栏</h3>
            <ol>
                <li>缩小浏览器宽度或示例可用宽度。<br />结果：分页栏显示当前页与总页数等简洁入口，避免完整分页工具挤在同一行。</li>
                <li>在窄屏下点击下一页，然后拉宽页面。<br />结果：新页数据与简洁页码一起更新；宽度恢复后重新显示完整分页栏。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <div>
                本页已在 PageManager 级别开启 GridPagerAutoSimpleMode。请缩小浏览器宽度（或在移动端/窄屏查看）：当分页栏放不下时，完整分页器会自动降级为简洁形态（上一页 + 当前/总页 + 下一页）；拉宽后自动还原。
            </div>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PagerAutoSimpleMode</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：按分页栏可用宽度自动切换简洁模式；本页不依赖手工切换按钮。
                </li>
                <li><code>ShowPageSizeSelector</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，在完整分页栏中提供每页记录数选择入口。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
