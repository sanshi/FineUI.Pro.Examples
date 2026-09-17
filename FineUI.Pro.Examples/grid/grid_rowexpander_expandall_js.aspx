<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander_expandall_js.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowexpander_expandall_js" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false"
            Height="500px" runat="server">
            <Columns>
                <f:TemplateField RenderAsRowExpander="true">
                    <ItemTemplate>
                        <div class="expander">
                            <p>
                                <strong>姓名：</strong><%# Eval("Name") %>
                            </p>
                            <p>
                                <strong>简介：</strong><%# Eval("Desc") %>
                            </p>
                        </div>
                    </ItemTemplate>
                </f:TemplateField>
                <f:TemplateField Width="60px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}"
                    HeaderText="注册日期" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        注：请注意如何在重新绑定数据后，保持所有扩展列的展开状态。
        <br />
        这个示例演示了如何通过编写JavaScript脚本来处理不常见的逻辑，如果你对JavaScript不熟悉请参考下一个完成相同功能的示例（一个属性搞定）。
        <br />
    </form>

    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';

        function onGridDataLoad(event) {
            F(gridClientID).expandRowExpanders();
        }

    </script>
</body>
</html>
