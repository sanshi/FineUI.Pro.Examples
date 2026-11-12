<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_celleditor.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_celleditor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound" AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称">
                    <Editor>
                        <f:TextBox ID="tbxName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Type" DataField="Type" HeaderText="类型" RendererFunction="renderType">
                    <Editor>
                        <f:DropDownList ID="ddlType" Required="true" runat="server">
                            <f:ListItem Text="文件夹" Value="文件夹"></f:ListItem>
                            <f:ListItem Text="CS文件" Value="CS文件"></f:ListItem>
                            <f:ListItem Text="CONFIG文件" Value="CONFIG文件"></f:ListItem>
                            <f:ListItem Text="ASPX文件" Value="ASPX文件"></f:ListItem>
                            <f:ListItem Text="CSS文件" Value="CSS文件"></f:ListItem>
                            <f:ListItem Text="PNG文件" Value="PNG文件"></f:ListItem>
                            <f:ListItem Text="ICO文件" Value="ICO文件"></f:ListItem>
                            <f:ListItem Text="GIF文件" Value="GIF文件"></f:ListItem>
                            <f:ListItem Text="XML文件" Value="XML文件"></f:ListItem>
                            <f:ListItem Text="ASHX文件" Value="ASHX文件"></f:ListItem>
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Size" DataField="Size" HeaderText="大小" FieldType="Int">
                    <Editor>
                        <f:NumberBox ID="tbxSize" NoDecimal="true" NoNegative="true" MinValue="0" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="ModifyDate" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script>
        var ddlTypeID = '<%= ddlType.ClientID %>';

        function renderType(value) {
            return F(ddlTypeID).getTextByValue(value);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在树表格中编辑节点名称、类型和大小，保存后保留父子层级。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>编辑后保留父子关系</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>一个可编辑节点的<strong>名称</strong>，输入<code>新名称</code>，修改<strong>类型</strong>或<strong>大小</strong>后点击<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="保存数据">保存数据</strong>。<br />结果：后台按节点主键更新本轮修改并重新绑定，节点仍属于原父目录；不因改<strong>名称</strong>改变层级。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowCellEditing</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>true</code>，让节点数据列采用对应编辑器，树形展示与数据编辑共同保留。
                </li>
                <li><code>DataParentIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>ParentId</code>，通过父节点标识维护层级；删除父节点时本页处理同时移除后代。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
