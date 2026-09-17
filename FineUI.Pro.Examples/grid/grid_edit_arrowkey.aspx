<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_arrowkey.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_arrowkey" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格"  EnableCollapse="false"
            runat="server"
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
                <f:TemplateField HeaderText="语文">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxYuwen" CssClass="group1" runat="server" Width="60px" TabIndex="<%# (Container.DataItemIndex * 3) + 10 %>" Text="<%# GetRandomNumber() %>"></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
                <f:TemplateField HeaderText="数学">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxShuxue" CssClass="group2" runat="server" Width="60px" TabIndex="<%# (Container.DataItemIndex * 3) + 11 %>" Text="<%# GetRandomNumber() %>"></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
                <f:TemplateField HeaderText="英语">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxYingyu" CssClass="group3" runat="server" Width="60px" TabIndex="<%# (Container.DataItemIndex * 3) + 12 %>" Text="<%# GetRandomNumber() %>"></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
        <br />
        注：
        <ul>
            <li>上下左右键遍历文本框</li>
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
            
            grid.el.on('keydown', inputselector, function (event) {
                var inputEl = $(this);

                // 约定优于配置：group1, group2, group3
                var inputRegex = /group(\d+)/.exec(inputEl.attr('class'));
                if (!inputRegex || !inputRegex.length) {
                    return;
                }
                var inputCls = inputRegex[0];
                var inputNum = parseInt(inputRegex[1], 10);
                

                var row = $(this).parents('.f-grid-row');
                switch (event.keyCode) {
                    case F.KEY.UP:
                        var prevRow = row.prev();
                        if (prevRow.length) {
                            prevRow.find('.' + inputCls).select();
                        }
                        event.preventDefault();
                        break;
                    case F.KEY.DOWN:
                        var nextRow = row.next();
                        if (nextRow.length) {
                            nextRow.find('.' + inputCls).select();
                        }
                        event.preventDefault();
                        break;
                    case F.KEY.LEFT:
                        inputNum--;
                        if (inputNum >= 1) {
                            row.find('.group' + inputNum).select();
                        }
                        event.preventDefault();
                        break;
                    case F.KEY.RIGHT:
                        inputNum++;
                        if (inputNum <= 3) {
                            row.find('.group' + inputNum).select();
                        }
                        event.preventDefault();
                        break;
                }
            });
        }


        F.ready(function () {
            registerEnterEvent();
        });

    </script>
</body>
</html>
