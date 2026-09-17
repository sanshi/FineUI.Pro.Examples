<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_selectionmessagerenderer.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_selectionmessagerenderer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .bold {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="350px"
            PageSize="5" ShowBorder="true"
            ShowHeader="true" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
            OnPageIndexChanged="Grid1_PageIndexChanged" SelectionMessageRendererFunction="selectionMessageRenderer">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField HeaderText="所学专业" ColumnID="Major" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:RenderField DataField="Fee" FieldType="Int" ColumnID="Fee" HeaderText="学费" />
                <f:RenderField DataField="ExtraFee" FieldType="Int" ColumnID="ExtraFee" HeaderText="学杂费" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>

    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function selectionMessageRenderer(selectedCount) {
            var grid1 = F(grid1ClientID);

            // https://fineui.com/js/api/F.Grid.html#getSelectedRows
            // 参数为true: 返回包含行对象的数组
            var selectedRows = grid1.getSelectedRows(true);
            if (!selectedRows.length) {
                return '无选中行';
            }

            var feeSum = 0, donateSum = 0;
            $.each(selectedRows, function (index, data) {
                feeSum += data.values['Fee'];
                donateSum += data.values['ExtraFee'];
            });

            return F.rawHtml('已选择 <strong class="bold">{0}</strong> 行&nbsp;（学费合计：{1} &nbsp;学杂费合计：{2}）',
                selectedRows.length,
                F.addCommas(feeSum.toFixed(2)),
                F.addCommas(donateSum.toFixed(2)));
        }

    </script>
</body>
</html>
