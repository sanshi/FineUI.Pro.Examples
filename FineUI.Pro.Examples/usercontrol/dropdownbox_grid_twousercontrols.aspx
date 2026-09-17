<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_twousercontrols.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.dropdownbox_grid_twousercontrols" %>

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
                <f:DropDownBox runat="server" Label="用户甲" ID="DropDownBox1" EmptyText="多选" DataControlID="Grid1" 
                    EnableMultiSelect="true" MatchFieldWidth="false">
                    <PopPanel>
                        <f:UserControlConnector runat="server">
                            <uc1:SelectUserControl runat="server" ID="SelectUserControl1" EnableGridMultiSelect="true" />
                        </f:UserControlConnector>
                    </PopPanel>
                </f:DropDownBox>
                <f:DropDownBox runat="server" Label="用户乙" ID="DropDownBox2" EmptyText="单选，仅可从[材料物理与化学]专业中选取" DataControlID="Grid1" 
                    EnableMultiSelect="false" MatchFieldWidth="false">
                    <PopPanel>
                        <f:UserControlConnector ID="UserControlConnector1" runat="server">
                            <uc1:SelectUserControl runat="server" ID="SelectUserControl2" EnableGridMultiSelect="false" GridMajor="材料物理与化学" />
                        </f:UserControlConnector>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" EncodeText="false" ID="labResult">
        </f:Label>
    </form>
</body>
</html>
