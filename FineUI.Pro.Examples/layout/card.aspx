<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card.aspx.cs" Inherits="FineUI.Pro.Examples.layout.card" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="250px" ShowBorder="true"
        Layout="Card" ShowHeader="true"  Title="Height=250px Width=750px Layout=Card">
        <Items>
            <f:Panel ID="Panel1"  runat="server" ShowBorder="true"
                ShowHeader="false">
                <Items>
                    <f:Label ID="Label3" Text="Width=150px" runat="server">
                    </f:Label>
                </Items>
            </f:Panel>
            <f:Panel ID="Panel4"  runat="server" ShowBorder="true"
                ShowHeader="false">
                <Items>
                    <f:Label ID="Label4" Text="ColumnWidth=30%" runat="server">
                    </f:Label>
                </Items>
            </f:Panel>
            <f:Form ID="Form2"  runat="server" ShowBorder="true"
                ShowHeader="false">
                <Rows>
                    <f:FormRow>
                        <Items>
                            <f:Label ID="Label1" Text="ColumnWidth=70%" ShowLabel="false" runat="server">
                            </f:Label>
                        </Items>
                    </f:FormRow>
                    <f:FormRow>
                        <Items>
                            <f:TextBox ID="TextBox1" Label="TextBox1" runat="server">
                            </f:TextBox>
                            <f:Label ID="Label2" runat="server">
                            </f:Label>
                        </Items>
                    </f:FormRow>
                </Rows>
            </f:Form>
        </Items>
    </f:Panel>
    </form>
</body>
</html>
