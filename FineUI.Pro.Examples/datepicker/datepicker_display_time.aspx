<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_display_time.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_display_time" %>

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
                <f:DatePicker runat="server" Required="true" DateFormatString="HH:mm:ss" Label="开始时间" EmptyText="请选择开始时间"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="Time" ShowTodayButton="false">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="HH:mm:ss"
                    CompareOperator="GreaterThan" CompareMessage="结束时间应该大于开始时间" Label="结束时间"
                    runat="server" ShowRedStar="true" DisplayType="Time" ShowTodayButton="false">
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
