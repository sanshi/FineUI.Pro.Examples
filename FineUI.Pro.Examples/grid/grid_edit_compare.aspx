<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_compare.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_compare" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .success {
            color: Green;
        }

        .error {
            color: Red;
        }

    </style>



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
                <f:RenderField ColumnID="Group" HeaderText="分组一" DataField="Group" RendererFunction="renderInput1" />
                <f:RenderField HeaderText="分组二" RendererFunction="renderInput2" />
                <f:RenderField HeaderText="比较结果" Width="150px" RendererFunction="renderComparison3" />
            </Columns>
        </f:Grid>
        <br />
        注：
        <ul>
            <li>使用Tab键遍历一列当中所有的文本输入框（通过TextBox的TabIndex属性）</li>
            <li>使用Enter键遍历一列当中所有的文本输入框（JavaScript函数registerEnterEvent）</li>
            <li>比较两个输入框的文本是否相同（JavaScript函数registerCompareEvent）</li>
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
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function renderInput1(value, params) {
            params.grid = this;
            return createGridTextInput(value, params, {
                id: 'tbxGroup1',
                cssClass: 'group1',
                width: '60px'
            });
        }

        function renderInput2(value, params) {
            params.grid = this;
            return createGridTextInput(value, params, {
                id: 'tbxGroup2',
                cssClass: 'group2',
                width: '60px',
                tabIndex: params.rowIndex + 100
            });
        }

        function renderComparison3(value, params) {
            return $('<span>').addClass('result');
        }

    </script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var inputselector = '.f-grid-cell input';


        function registerEnterEvent() {
            var grid = F(gridClientID);

            grid.el.on('keypress', inputselector, function(event) {
                var $this = $(this);
                if (event.keyCode === F.KEY.ENTER) {
                    var inputCls = $this.hasClass('group1') ? 'group1' : 'group2';
                    var nextRow = $this.parents('.f-grid-row').next();
                    if (nextRow.length) {
                        nextRow.find(inputselector + '.' + inputCls).select();
                    }
                }
            });
        }

        function doCompare(inputNode) {
            inputNode = $(inputNode);

            var row = inputNode.parents('.f-grid-row');
            var num1 = row.find(inputselector + '.group1').val();
            var num2 = row.find(inputselector + '.group2').val();

            var resultNode = row.find('.f-grid-cell span.result');
            resultNode.removeClass('success error');

            if (num1 == num2) {
                resultNode.addClass('success');
                resultNode.text('两组录入一致');
            } else {
                resultNode.addClass('error');
                resultNode.text('两组录入不一致！');
            }

        }

        function registerCompareEvent() {
            var grid = F(gridClientID);

            grid.el.on('input', inputselector, function(event) {
                doCompare(this);
            });



        }

        F.ready(function() {
            registerEnterEvent();
            registerCompareEvent();
        });

    </script>
</body>
</html>
