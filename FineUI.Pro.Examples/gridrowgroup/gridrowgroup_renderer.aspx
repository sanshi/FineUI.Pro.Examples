<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_renderer.aspx.cs" Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_renderer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupRendererFunction="onGrid1RowGroupRenderer">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="../res/js/grid.js"></script>
    <script>

        function onGrid1RowGroupRenderer(groupValue, rowData) {
            var maleCount = 0, total = rowData.children.length;
            for (var i = 0; i < total; i++) {
                var childData = rowData.children[i];
                var genderVaue = childData.values['Gender'];
                if (genderVaue.indexOf('男') >= 0) {
                    maleCount++;
                }
            }
            return F.formatString('入学年份：{0}，男：{1}，女：{2}', groupValue, maleCount, total - maleCount);
        }

    </script>
</body>
</html>
