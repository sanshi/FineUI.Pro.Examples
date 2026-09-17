<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid.aspx.cs" Inherits="FineUI.Pro.Examples.multilang.grid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="<%$ Resources:GridTitle %>" runat="server" EnableCollapse="false"
            DataIDField="Id" DataTextField="Name" DataKeyNames="Id,Name,Major">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="150px" ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="<%$ Resources:Field_Name %>" />
                <f:TemplateField Width="150px" ColumnID="Gender" HeaderText="<%$ Resources:Field_Gender %>">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="150px" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="<%$ Resources:Field_EntranceYear %>" />
                <f:CheckBoxField ColumnID="AtSchool" Width="150px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="<%$ Resources:Field_AtSchool %>" />
                <f:HyperLinkField ColumnID="Major" HeaderText="<%$ Resources:Field_Major %>" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:BoundField Width="150px" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="<%$ Resources:Field_LogTime %>" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="<%$ Resources:ShowSelectedRows %>" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="<%$ Resources:ShowSelectedRowsClient %>" ClickHandler="onButton2Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>

    <script src="../res/js/grid.js"></script>

    <script type="text/javascript">
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onButton2Click(event) {
            notifySelectedRows(grid1ClientID);
        }
    </script>

    <!-- 输出多语言资源 -->
    <script type="text/javascript">
        <%= FineUI.Pro.PageContext.GetJavaScriptResourcesReference<Resources.SharedJavaScriptResources>() %>
    </script>

</body>
</html>
