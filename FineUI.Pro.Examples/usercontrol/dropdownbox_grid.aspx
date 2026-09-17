<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.dropdownbox_grid" %>

<%@ Register Src="~/usercontrol/SelectUserControl.ascx" TagPrefix="uc1" TagName="SelectUserControl" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/usercontrol/SelectUserControl.ascx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉表格（复杂布局）" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择（多选）" DataControlID="Grid1" 
                    EnableMultiSelect="true" MatchFieldWidth="false">
                    <PopPanel>
                        <f:UserControlConnector runat="server">
                            <uc1:SelectUserControl runat="server" EnableGridMultiSelect="true" ID="SelectUserControl1" />
                        </f:UserControlConnector>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
</body>
</html>
