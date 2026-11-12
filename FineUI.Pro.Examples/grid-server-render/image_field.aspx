<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="image_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.image_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>图片列：路径与尺寸</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="图片列：路径与尺寸"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:ImageField ColumnID="Group" HeaderText="分组图片" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" ImageWidth="32px"
                    ImageHeight="32px" />
            </Columns>
        </f:Grid>

        <f:Label ID="labResult" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>根据每行分组字段选择对应图片，并设置图片显示尺寸。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看由字段决定的图片</h3>
            <ul>
                <li>比较<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="图片列：路径与尺寸">图片列：路径与尺寸</strong>不同行的图片。<br />结果：图片地址把各行分组值代入路径模板，按指定尺寸显示；不同分组可以使用不同文件。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>ImageField 在服务端按字段拼出图片地址并设置尺寸；新项目优先使用 RenderField 的渲染函数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataImageUrlField / DataImageUrlFormatString</code>（<strong>图片列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="图片列：路径与尺寸">图片列：路径与尺寸</strong>）：从
                    <code>Group</code> 读取文件名片段，再代入图片路径。
                </li>
                <li><code>ImageWidth / ImageHeight</code>（<strong>图片列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="图片列：路径与尺寸">图片列：路径与尺寸</strong>）：独立控制图片的显示尺寸，不等于整列宽度与行高。</li>
            </ul>
        </section>
    </template>
</body>
</html>
