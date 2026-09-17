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
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="150px" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="150px" ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank"
                    ExpandUnusedSpace="true" MinWidth="150px" />
                <%--<f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />--%>
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
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
