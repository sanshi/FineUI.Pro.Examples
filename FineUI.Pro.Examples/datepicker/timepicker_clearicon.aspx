<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="timepicker_clearicon.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.timepicker_clearicon" %>

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
                <f:DatePicker runat="server" Required="true" EnableEdit="false" Label="日期" EmptyText="请选择日期"
                    ID="DatePicker1" ShowRedStar="true" AutoShowClearIcon="true">
                </f:DatePicker>
                <f:TimePicker ID="TimePicker1" ShowRedStar="true" EnableEdit="false" Label="时间" Increment="30"
                    Required="true" EmptyText="请选择时间" runat="server" AutoShowClearIcon="true">
                </f:TimePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
        <br />
        注：
        <ul>
            <li>
                本示例通过EnableEdit属性控制日期和时间选择器不可编辑。
            </li>
            <li>
                为日期和时间选择器增加清空图标。
            </li>
        </ul>
        
    </form>
</body>
</html>
