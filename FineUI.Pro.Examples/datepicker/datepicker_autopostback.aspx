<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_autopostback.aspx.cs"
    Inherits="FineUI.Pro.Examples.datepicker.datepicker_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="简单表单（AutoPostBack）" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" OnTextChanged="DatePicker1_TextChanged" Label="开始日期" EmptyText="请选择开始日期" ID="DatePicker1"
                    ShowRedStar="true">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="yyyy/MM/dd"
                    CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" Label="结束日期" runat="server" ShowRedStar="true">
                </f:DatePicker>
                <f:Button ID="Button1" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="Button1_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
        <br />
        <f:SimpleForm ID="SimpleForm2" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="简单表单（EnableDateSelectEvent）" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" EnableDateSelectEvent="true" OnDateSelect="DatePicker3_DateSelect" Label="开始日期" EmptyText="请选择开始日期"
                    ID="DatePicker3" ShowRedStar="true">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker4" Required="true" Readonly="false" CompareControl="DatePicker3" DateFormatString="yyyy/MM/dd"
                    CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" Label="结束日期" runat="server" ShowRedStar="true">
                </f:DatePicker>
                <f:Button ID="Button2" runat="server" ValidateForms="SimpleForm2" Text="提交表单" OnClick="Button2_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult2" ShowLabel="false" runat="server">
        </f:Label>
        <br />
        注：
        <ul>
            <li>手工输入第一个表单的开始日期，会自动回发。</li>
            <li>手工输入第二个表单的开始日期，不会自动回发。</li>
        </ul>

    </form>
</body>
</html>
