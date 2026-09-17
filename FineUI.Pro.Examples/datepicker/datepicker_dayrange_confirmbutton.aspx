<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_dayrange_confirmbutton.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_dayrange_confirmbutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="简单表单" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy/MM/dd" Label="日期范围" EmptyText="请选择日期范围"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="DayRange" ShowConfirmButton="true" ConfirmToSelect="true">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单"
                    OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
