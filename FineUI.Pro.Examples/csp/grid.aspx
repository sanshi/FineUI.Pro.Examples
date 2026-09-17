<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid.aspx.cs" Inherits="FineUI.Pro.Examples.csp.grid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" CspScripts="true" CspScriptsAllowNonce="true" CspScriptsAllowUrls="cdn.jsdelivr.net,unpkg.com" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" DataTextField="Name">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField TrueStrings="false,False" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button Text="选中了哪些行" ClickHandler="onShowSelectedNamesClick" runat="server"></f:Button>
    </form>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/underscore@1.13.7/underscore-umd-min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/underscore@1.13.7/underscore-umd-min.js"></script>

    <script nonce="<%= PageManager.Instance.CspScriptsNonceValue %>" type="text/javascript">

        var gridClientID = '<%= Grid1.ClientID %>';

        function renderGender(value, params) {
            return value == 1 ? '男' : '女';
        }

        function onShowSelectedNamesClick(event) {
            var grid1 = F(gridClientID);

            if (!grid1.hasSelection()) {
                F.alert('没有选中项！');
            } else {
                var selectedRowTexts = _.map(grid1.getSelectedRows(true), function (rowData, index) {
                    return rowData.text;
                });
                F.alert(F.formatString('选中的项：{0}', selectedRowTexts.join(', ')));
            }
        }

    </script>
</body>
</html>
