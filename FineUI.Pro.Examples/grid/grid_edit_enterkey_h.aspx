<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_enterkey_h.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_enterkey_h" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>




</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField Width="60px" EnableColumnHide="false" EnableHeaderMenu="false" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField HeaderText="语文" RendererFunction="renderInput1" />
                <f:RenderField HeaderText="数学" RendererFunction="renderInput2" />
                <f:RenderField HeaderText="英语" RendererFunction="renderInput3" />
            </Columns>
        </f:Grid>
        <br />
        注：
        <ul>
            <li>Tab/Enter遍历文本框时，先遍历一行的文本框，然后再遍历下一行的文本框</li>
        </ul>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" CssClass="marginr" Text="获取用户输入的分组值">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
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
            value = Math.floor(Math.random() * 101);
            return createGridTextInput(value, params, {
                id: 'tbxYuwen',
                cssClass: 'group1',
                width: '60px',
                tabIndex: params.rowIndex * 3 + 10
            });
        }

        function renderInput2(value, params) {
            params.grid = this;
            value = Math.floor(Math.random() * 101);
            return createGridTextInput(value, params, {
                id: 'tbxShuxue',
                cssClass: 'group2',
                width: '60px',
                tabIndex: params.rowIndex * 3 + 11
            });
        }

        function renderInput3(value, params) {
            params.grid = this;
            value = Math.floor(Math.random() * 101);
            return createGridTextInput(value, params, {
                id: 'tbxYingyu',
                cssClass: 'group3',
                width: '60px',
                tabIndex: params.rowIndex * 3 + 12
            });
        }

    </script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var inputselector = '.f-grid-cell input';


        function registerEnterEvent() {
            var grid = F(gridClientID);

            grid.el.on('keypress', inputselector, function(event) {
                if (event.keyCode === F.KEY.ENTER) {
                    var row = $(this).parents('.f-grid-row');

                    var inputs = row.find(inputselector);
                    // 一行中有多少个输入框
                    var inputCount = inputs.length;
                    // 当前输入框在本行中的序号（用来标示那一列）
                    var inputIndex = inputs.index(this);
                    inputIndex++;

                    if (inputIndex <= inputCount - 1) {
                        // 选中本行下一列中的输入框
                        inputs.eq(inputIndex).select();
                    } else {
                        var nextRow = row.next();
                        if (nextRow.length) {
                            // 选中下一行第一列的的输入框
                            nextRow.find(inputselector).eq(0).select();
                        } else {
                            // 如果本行是最后一行，则选择第一行第一列的输入框
                            row.prevAll(':last').find(inputselector).eq(0).select();
                        }
                    }
                }
            });
        }


        F.ready(function() {
            registerEnterEvent();
        });

    </script>
</body>
</html>
