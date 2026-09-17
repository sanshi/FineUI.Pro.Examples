<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_form_emptylabel.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablestyle_form_emptylabel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form1" IsFluid="true" runat="server"
            ShowBorder="false" ShowHeader="false" EnableTableStyle="true" MessageTarget="Qtip">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label3" Label="电话" Text="0551-1234567" runat="server" />
                        <f:Label ID="Label16" runat="server" Label="申请人" Text="admin">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label4" Label="编号" Text="200804170006" runat="server" />
                        <f:Label runat="server"></f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" runat="server" ForceSelection="false" Required="true" ShowRedStar="true"
                            EmptyText="请选择审批人" AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" MaxValue="1000" Required="true" runat="server"
                            ShowRedStar="true" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowRedStar="true" Required="true">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <f:Button ID="btnSubmitForm1" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm1_Click"
            ValidateForms="Form1" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        <f:Form ID="Form2" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false"
            Layout="HBox" EnableTableStyle="true" MessageTarget="Qtip">
            <Items>
                <f:Panel runat="server" ShowBorder="false" ShowHeader="false" BoxFlex="1" Layout="VBox">
                    <Items>
                        <f:TextBox runat="server" Required="true" Label="国家"></f:TextBox>
                        <f:TextBox runat="server" Required="true" Label="邮编"></f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ShowBorder="false" ShowHeader="false" BoxFlex="1" Layout="VBox">
                    <Items>
                        <f:TextBox runat="server" Required="true" Label="省份"></f:TextBox>
                        <f:TextBox runat="server" Required="true" Label="城市"></f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ShowBorder="false" ShowHeader="false" BoxFlex="1" Layout="VBox">
                    <Items>
                        <f:TextBox runat="server" Required="true" Label="地址"></f:TextBox>
                        <f:Label runat="server"></f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Form>
        <f:Button ID="Button2" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
            ValidateForms="Form2" MarginTop="5px">
        </f:Button>
    </form>
</body>
</html>
