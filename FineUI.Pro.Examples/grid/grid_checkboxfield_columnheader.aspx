<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_columnheader.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_columnheader" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:CheckBoxField ColumnID="CheckBoxField1" Width="150px" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校1" />
                <f:CheckBoxField ColumnID="CheckBoxField2" Width="150px" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校2" />
                <f:CheckBoxField ColumnID="CheckBoxField3" Width="150px" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校3" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';

        F.ready(function () {

            var grid1 = F(grid1ClientID);


            grid1.el.on('click', '.f-grid-colheader.myheadercheckbox .f-grid-checkbox', function (event) {
                var cnode = $(this);

                // 表头中复选框是否选中
                var checked = cnode.hasClass('f-checked');
                // 列序号
                var thIndex = cnode.parents('.f-grid-colheader').index();

                // 选中相应列的复选框（nth-child选择器是从 1 开始的）
                var checkboxEls = grid1.el.find('.f-grid-row td:nth-child(' + (thIndex + 1) + ') .f-grid-checkbox');
                checkboxEls.toggleClass('f-checked', checked);

            });

        });

    </script>
</body>
</html>
