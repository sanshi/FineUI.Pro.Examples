<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="custom_postback.aspx.cs"
    Inherits="FineUI.Pro.Examples.other.custom_postback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false"
            Title="简单表单">
            <Items>
                <f:TextBox ID="TextBox1" runat="server" ShowLabel="false" EmptyText="输入一些文字并按 ENTER 键">
                    <Listeners>
                        <f:Listener Event="enter" Handler="onTextBoxEnter" />
                    </Listeners>
                </f:TextBox>
                <f:TextBox ID="TextBox2" runat="server" ShowLabel="false">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
    </form>

    <script type="text/javascript">

        function onTextBoxEnter(event) {
            F.doPostBack({
                eventName: 'TextBox1_ENTER'
            });
        }

        //var textbox1ID = '<%= TextBox1.ClientID %>';

        //F.ready(function () {

        //    F(textbox1ID).on("enter", function (event) {
        //        F.doPostBack({ eventName: 'TextBox1_ENTER' });
        //    });

        //});

    </script>
</body>
</html>
