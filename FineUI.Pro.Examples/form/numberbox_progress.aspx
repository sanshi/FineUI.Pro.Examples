<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_progress.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_progress" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:NumberBox ID="NumberBox1" Width="500" Text="25" runat="server" DisplayType="Progress">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox2" Width="500" Text="50" runat="server" DisplayType="Progress">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox3" Width="500" Text="75" runat="server" DisplayType="Progress" ProgressTextVisible="true">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox4" Width="500" Text="95" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <br />
        <f:NumberBox ID="NumberBox5" Width="500" Text="25" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressTextInside="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox6" Width="500" Text="50" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressTextInside="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox7" Width="500" Text="75" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressTextInside="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox8" Width="500" Text="95" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressTextInside="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <br />
        <f:Button Text="0%" ClickHandler="onChangeTo0Click" runat="server" MarginRight="5"></f:Button>
        <f:Button Text="25%" ClickHandler="onChangeTo25Click" runat="server" MarginRight="5"></f:Button>
        <f:Button Text="50%" ClickHandler="onChangeTo50Click" runat="server" MarginRight="5"></f:Button>
        <f:Button Text="75%" ClickHandler="onChangeTo75Click" runat="server" MarginRight="5"></f:Button>
        <f:Button Text="100%" ClickHandler="onChangeTo100Click" runat="server" MarginRight="5"></f:Button>
        <br />
        <br />
    </form>
    <script>
        var NumberBox1ClientID = '<%= NumberBox1.ClientID %>';
        var NumberBox2ClientID = '<%= NumberBox2.ClientID %>';
        var NumberBox3ClientID = '<%= NumberBox3.ClientID %>';
        var NumberBox4ClientID = '<%= NumberBox4.ClientID %>';
        var NumberBox5ClientID = '<%= NumberBox5.ClientID %>';
        var NumberBox6ClientID = '<%= NumberBox6.ClientID %>';
        var NumberBox7ClientID = '<%= NumberBox7.ClientID %>';
        var NumberBox8ClientID = '<%= NumberBox8.ClientID %>';

        function changeTo(num) {
            F(NumberBox1ClientID).setValue(num);
            F(NumberBox2ClientID).setValue(num);
            F(NumberBox3ClientID).setValue(num);
            F(NumberBox4ClientID).setValue(num);
            F(NumberBox5ClientID).setValue(num);
            F(NumberBox6ClientID).setValue(num);
            F(NumberBox7ClientID).setValue(num);
            F(NumberBox8ClientID).setValue(num);
        }

        function onChangeTo0Click(event) {
            changeTo(0);
        }

        function onChangeTo25Click(event) {
            changeTo(25);
        }

        function onChangeTo50Click(event) {
            changeTo(50);
        }

        function onChangeTo75Click(event) {
            changeTo(75);
        }

        function onChangeTo100Click(event) {
            changeTo(100);
        }

    </script>
</body>
</html>
