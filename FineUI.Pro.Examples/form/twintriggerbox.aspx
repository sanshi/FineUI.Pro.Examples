<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="twintriggerbox.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.twintriggerbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px"  EnableCollapse="false"
            Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:TwinTriggerBox ID="ttbxMyBox2" ShowLabel="false" OnTrigger1Click="ttbxMyBox2_Trigger1Click" OnTrigger2Click="ttbxMyBox2_Trigger2Click"
                    Trigger1Icon="Clear" ShowTrigger1="false" EmptyText="搜索用户名" Trigger2Icon="Search"
                    runat="server">
                </f:TwinTriggerBox>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
