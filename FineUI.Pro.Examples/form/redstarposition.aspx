<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="redstarposition.aspx.cs" Inherits="FineUI.Pro.Examples.form.redstarposition" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        /*.container {
            width: 600px;
            border: 1px solid #ccc;
            padding: 10px;
            text-align: justify;
        }

            .container::after {
                content: '';
                display: inline-block;
                width: 100%;*/ /* 核心代码 */
        /*}*/

        /*.container {
            width: 600px;
            border: 1px solid #ccc;
            padding: 10px;
            text-align: justify;
            text-align-last: justify;*/ /* 核心代码 */
        /*}
        <div class="container">短文本均匀分布</div>*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" Title="表单(RedStarPosition=AfterText LabelAlign=Left)" runat="server" ShowBorder="true" BodyPadding="10px"
            ShowHeader="true" RedStarPosition="AfterText" LabelAlign="Left">
            <Items>
                <f:TextBox ID="tbxUserName" Label="用户名" Required="true" ShowRedStar="true" runat="server">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" Label="密码" TextMode="Password" Required="true" ShowRedStar="true" runat="server">
                </f:TextBox>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnLogin" Text="登录" Type="Button" ValidateForms="SimpleForm1" ValidateTarget="Top"
                            runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        <br />
        <f:SimpleForm ID="SimpleForm2" IsFluid="true" Title="表单(RedStarPosition=BeforeText LabelAlign=Right)" runat="server" ShowBorder="true" BodyPadding="10px"
            ShowHeader="true" RedStarPosition="BeforeText" LabelAlign="Right">
            <Items>
                <f:TextBox ID="TextBox1" Label="用户名" Required="true" ShowRedStar="true" runat="server">
                </f:TextBox>
                <f:TextBox ID="TextBox2" Label="密码" TextMode="Password" Required="true" ShowRedStar="true" runat="server">
                </f:TextBox>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar2" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button1" Text="登录" Type="Button" ValidateForms="SimpleForm2" ValidateTarget="Top"
                            runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        <br />
        <f:SimpleForm ID="SimpleForm3" IsFluid="true" Title="表单(RedStarPosition=AfterSeparator LabelAlign=Top)" runat="server" ShowBorder="true" BodyPadding="10px"
            ShowHeader="true" RedStarPosition="AfterSeparator" LabelAlign="Top">
            <Items>
                <f:TextBox ID="TextBox3" Label="用户名" Required="true" ShowRedStar="true" runat="server">
                </f:TextBox>
                <f:TextBox ID="TextBox4" Label="密码" TextMode="Password" Required="true" ShowRedStar="true" runat="server">
                </f:TextBox>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar3" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button3" Text="登录" Type="Button" ValidateForms="SimpleForm3" ValidateTarget="Top"
                            runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
    </form>
</body>
</html>
