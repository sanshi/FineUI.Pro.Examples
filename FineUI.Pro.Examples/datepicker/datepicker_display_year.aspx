<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_display_year.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_display_year" %>

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
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy" Label="开始年份" EmptyText="请选择开始年份"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="Year" ShowTodayButton="false">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="yyyy"
                    CompareOperator="GreaterThan" CompareMessage="结束年份应该大于开始年份" Label="结束年份"
                    runat="server" ShowRedStar="true" DisplayType="Year" ShowTodayButton="false">
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
