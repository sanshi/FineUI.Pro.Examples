<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_custompostback.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_custompostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onButton1Click"></f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>

    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onButton1Click(event) {
            var grid1 = F(Grid1ClientID);

            var result = [];
            var selections = grid1.getSelectedRows(true);
            for (const selection of selections) {
                result.push({
                    'id': selection.id,
                    'text': selection.text,
                    'leaf': selection.leaf,
                    'expanded': selection.expanded
                });
            }

            // 自定义回发
            F.customEvent('Button1Click', result);
        }

    </script>
</body>
</html>
