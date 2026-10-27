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
                <f:RenderField Width="150px" ColumnID="Name" DataField="Name" HeaderText="<%$ Resources:Field_Name %>" />
                <f:RenderField Width="150px" ColumnID="Gender" HeaderText="<%$ Resources:Field_Gender %>" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="150px" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="<%$ Resources:Field_EntranceYear %>" />
                <f:RenderCheckField ColumnID="AtSchool" Width="150px" RenderAsStaticField="true" DataField="AtSchool"
                    HeaderText="<%$ Resources:Field_AtSchool %>" />
                <f:RenderField ColumnID="Major" HeaderText="<%$ Resources:Field_Major %>" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                    RendererFunction="renderMajor" />
                <f:RenderField Width="150px" DataField="LogTime" HeaderText="<%$ Resources:Field_LogTime %>" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button CssClass="marginr" ID="Button1" runat="server" Text="<%$ Resources:ShowSelectedRows %>" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="<%$ Resources:ShowSelectedRowsClient %>" ClickHandler="onButton2Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>

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
