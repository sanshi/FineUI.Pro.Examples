<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_dropdownlist_textbox.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_dropdownlist_textbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>



</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField EnableColumnHide="false" EnableHeaderMenu="false" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField Width="160px" HeaderText="性别" ColumnID="Gender" DataField="Gender" RendererFunction="renderInput1" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" Text="获取用户输入的性别">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-pro.js") %>"></script>
    <script>
        function renderInput1(value, params) {
            params.grid = this;
            var gender = String(value) === '1' ? '男' : '女';
            return $('<span>').append(
                createGridChoiceInput(gender, params, {
                    id: 'ddlGender',
                    cssClass: 'gender',
                    type: 'DropDownList'
                }),
                createGridTextInput(gender, params, {
                    id: 'tbxGender',
                    cssClass: 'gender',
                    width: '60px'
                })
            );
        }

    </script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var genderselector = '.f-grid-cell select.gender';

        function registerSyncEvent() {
            var grid = F(gridClientID);

            grid.el.on('change', genderselector, function(event) {
                var $this = $(this);
                var row = $this.parents('.f-grid-row');
                row.find('input.gender').val($this.val());
            });

        }

        F.ready(function() {
            registerSyncEvent();
        });

    </script>
</body>
</html>
