<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_celleditor_serverdelete.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_celleditor_serverdelete" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId"
            OnRowDataBound="Grid1_RowDataBound"
            AllowCellEditing="true" ClicksToEdit="1"
            OnRowCommand="Grid1_RowCommand">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnDelete" Text="删除选中行（可删除多行）" Icon="Delete" OnClick="btnDelete_Click" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称">
                    <Editor>
                        <f:TextBox ID="tbxName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Type" DataField="Type" HeaderText="类型"
                    RendererFunction="renderType">
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
                <f:RenderField Width="150px" ColumnID="ModifyDate" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy/MM/dd">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:LinkButtonField ColumnID="Delete" ConfirmText="删除选中行？" ConfirmTarget="Top"
                    CommandName="Delete" Icon="Delete" />
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
</body>
</html>
