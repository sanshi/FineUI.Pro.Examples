<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_customheadmenu.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_customheadmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .custom-filter {
            position: absolute;
            margin-left: 2px;
            cursor: pointer;
        }

        .f-grid-colheader.custom-filtered .f-grid-colheader-text {
            /*font-style: italic;*/
            font-weight: bold;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableHeaderMenu="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="150px" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="150px" ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <f:Menu ID="Menu1" runat="server">
            <Items>
                <f:MenuCheckBox ID="btnSelectAll" GroupName="AtSchool" Checked="true" OnCheckedChanged="btnAtSchool_CheckedChanged" runat="server" Text="全部">
                </f:MenuCheckBox>
                <f:MenuCheckBox ID="btnSelectAtSchool" GroupName="AtSchool" OnCheckedChanged="btnAtSchool_CheckedChanged" runat="server" Text="在校">
                </f:MenuCheckBox>
                <f:MenuCheckBox ID="btnSelectNotAtSchool" GroupName="AtSchool" OnCheckedChanged="btnAtSchool_CheckedChanged" runat="server" Text="离校">
                </f:MenuCheckBox>
            </Items>
        </f:Menu>
        <f:Menu ID="Menu2" runat="server">
            <Items>
                <f:MenuCheckBox ID="btnEntranceYearAll" GroupName="EntranceYear" Checked="true" OnCheckedChanged="btnEntranceYear_CheckedChanged" runat="server"
                    Text="全部">
                </f:MenuCheckBox>
                <f:MenuCheckBox ID="btnEntranceYearGreatThan2002" GroupName="EntranceYear" OnCheckedChanged="btnEntranceYear_CheckedChanged" runat="server"
                    Text="入学年份大于2002">
                </f:MenuCheckBox>
            </Items>
        </f:Menu>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Menu1ClientID = '<%= Menu1.ClientID %>';
        var Menu2ClientID = '<%= Menu2.ClientID %>';
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        var btnEntranceYearAllClientID = '<%= btnEntranceYearAll.ClientID %>';
        var btnSelectAllClientID = '<%= btnSelectAll.ClientID %>';

        function checkGridColheaderStyle() {
            var grid1El = F(Grid1ClientID).el;
            var colheaderEntranceYearEl = grid1El.find('.f-grid-colheader-EntranceYear');
            var colheaderAtSchoolEl = grid1El.find('.f-grid-colheader-AtSchool');

            var btnSelectAll = F(btnSelectAllClientID);
            var btnEntranceYearAll = F(btnEntranceYearAllClientID);

            if (btnSelectAll.isChecked()) {
                colheaderAtSchoolEl.removeClass('custom-filtered');
            } else {
                colheaderAtSchoolEl.addClass('custom-filtered');
            }

            if (btnEntranceYearAll.isChecked()) {
                colheaderEntranceYearEl.removeClass('custom-filtered');
            } else {
                colheaderEntranceYearEl.addClass('custom-filtered');
            }
        }

        function onGridDataLoad(event) {
            checkGridColheaderStyle();
        }

        F.ready(function() {

            F(Grid1ClientID).el.on('click', '.f-grid-colheader .custom-filter', function(event) {
                var colHeaderEl = $(this).parents('.f-grid-colheader');
                if (colHeaderEl.hasClass('f-grid-colheader-AtSchool')) {
                    F(Menu1ClientID).show();
                } else if (colHeaderEl.hasClass('f-grid-colheader-EntranceYear')) {
                    F(Menu2ClientID).show();
                }
            });

        });

    </script>
</body>
</html>
