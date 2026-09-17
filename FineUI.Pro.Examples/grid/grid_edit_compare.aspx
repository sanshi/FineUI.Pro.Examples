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
                <f:TemplateField Width="60px" EnableColumnHide="false" EnableHeaderMenu="false">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:TemplateField ColumnID="Group" HeaderText="分组一">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxGroup1" CssClass="group1" runat="server" Width="60px" TabIndex='<%# Container.DataItemIndex + 10 %>'
                            Text='<%# Eval("Group") %>'></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
                <f:TemplateField HeaderText="分组二">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxGroup2" CssClass="group2" runat="server" Width="60px" TabIndex='<%# Container.DataItemIndex + 100 %>'></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
                <f:TemplateField HeaderText="比较结果" Width="150px">
                    <ItemTemplate>
                        <asp:Label runat="server" CssClass="result" ID="labCompare"></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
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

    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var inputselector = '.f-grid-tpl input';


        function registerEnterEvent() {
            var grid = F(gridClientID);

            grid.el.on('keypress', inputselector, function (event) {
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

            var resultNode = row.find('.f-grid-tpl span.result');
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

            grid.el.on('input', inputselector, function (event) {
                doCompare(this);
            });

            

        }

        F.ready(function () {
            registerEnterEvent();
            registerCompareEvent();
        });

    </script>
</body>
</html>
