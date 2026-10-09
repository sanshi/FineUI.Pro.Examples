<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_selectrow.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_edit_selectrow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>



</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name" EnableMultiSelect="false" Height="300">
            <Columns>
                <f:RowNumberField Width="60px" EnableColumnHide="false" EnableHeaderMenu="false" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderInput1" />
            </Columns>
        </f:Grid>
        <br />
        注：
        <ul>
            <li>点击文本框选中文本</li>
            <li>使用 Enter 或者 Tab 键遍历所有的文本输入框</li>
            <li>遍历文本框时同时选中所在的行</li>
        </ul>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" CssClass="marginr" Text="获取用户输入的分组值">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <br />
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
            return createGridTextInput(value, params, {
                id: 'tbxGroupName',
                cssClass: '',
                width: '60px'
            });
        }

    </script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var inputselector = '.f-grid-cell input';


        function registerEnterEvent() {
            var grid = F(gridClientID);

            grid.el.on('keydown', inputselector, function(event) {

                // 如果是 ENTER键 或者 TAB键
                if (event.keyCode === F.KEY.ENTER || event.keyCode === F.KEY.TAB) {
                    // 当前选中的行数组
                    var nextRow = $(this).parents('.f-grid-row').next();
                    if (nextRow.length) {
                        // 选中文本框中的文本
                        nextRow.find(inputselector).select();
                        // 选中下一行
                        grid.selectRow(nextRow);
                    }
                }
            });

            // 点击选中文本框中的文本
            grid.el.on('click', inputselector, function(event) {
                $(this).select();
            });

        }

        F.ready(function() {
            registerEnterEvent();
        });

    </script>
</body>
</html>
