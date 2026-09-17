<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkall_customheadmenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkall_customheadmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        .custom-arrow-down {
            position: absolute;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true"
                    Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        <br />
        <f:Menu ID="Menu1" runat="server">
            <Items>
                <f:MenuButton ID="btnSelectInverse" runat="server" Text="反选" ClickHandler="onSelectInverse"></f:MenuButton>
                <f:MenuSeparator runat="server"></f:MenuSeparator>
                <f:MenuButton ID="btnSelectOdd" runat="server" Text="选中奇数行" ClickHandler="onSelectOdd"></f:MenuButton>
                <f:MenuButton ID="btnSelectEven" runat="server" Text="选中偶数行" ClickHandler="onSelectEven"></f:MenuButton>
                <f:MenuSeparator runat="server"></f:MenuSeparator>
                <f:MenuButton ID="btnSelectAtSchool" runat="server" Text="选中在校的行" ClickHandler="onSelectAtSchool"></f:MenuButton>
                <f:MenuButton ID="btnSelectLargeThan2004" runat="server" Text="选中入学年份大于2004的行" ClickHandler="onSelectLargeThan2004"></f:MenuButton>
            </Items>
        </f:Menu>
    </form>
    <script>
        var menu1ClientID = '<%= Menu1.ClientID %>';
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onSelectInverse(event) {
            var grid1 = F(grid1ClientID), rows = [];
            var currentSelectedRows = grid1.getSelectedRows();
            grid1.resolveRow(function (rowData) {
                if ($.inArray(rowData.id, currentSelectedRows) < 0) {
                    rows.push(rowData.id);
                }
            });
            grid1.selectRows(rows);
        }

        function onSelectOdd(event) {
            var grid1 = F(grid1ClientID), rows = [];
            var rowIndex = 0;
            grid1.resolveRow(function (rowData) {
                if (rowIndex % 2 === 0) {
                    rows.push(rowData.id);
                }
                rowIndex++;
            });
            grid1.selectRows(rows);
        }

        function onSelectEven(event) {
            var grid1 = F(grid1ClientID), rows = [];
            var rowIndex = 0;
            grid1.resolveRow(function (rowData) {
                if (rowIndex % 2 !== 0) {
                    rows.push(rowData.id);
                }
                rowIndex++;
            });
            grid1.selectRows(rows);
        }

        function onSelectLargeThan2004(event) {
            var grid1 = F(grid1ClientID), rows = [];
            grid1.resolveRow(function (rowData) {
                var entranceYear = parseInt(rowData.values['EntranceYear'], 10);
                if (entranceYear > 2004) {
                    rows.push(rowData.id);
                }
            });
            grid1.selectRows(rows);
        }

        function onSelectAtSchool(event) {
            var grid1 = F(grid1ClientID), rows = [];
            grid1.resolveRow(function (rowData) {
                if (rowData.values['AtSchool'].indexOf('f-checked') >= 0) {
                    rows.push(rowData.id);
                }
            });
            grid1.selectRows(rows);
        }

        
        F.ready(function () {

            var grid1 = F(grid1ClientID);

            grid1.el.on('click', '.f-grid-colheader .custom-arrow-down', function (event) {
                F(menu1ClientID).show();

                // 阻止事件传播（不执行表头复选框的选中/反选事件）
                event.stopPropagation();
            });

        });

    </script>
</body>
</html>
