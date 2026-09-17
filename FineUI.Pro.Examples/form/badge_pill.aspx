<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="badge_pill.aspx.cs" Inherits="FineUI.Pro.Examples.form.badge_pill" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <div class="f-badge-pill f-badge-success">
            <div class="f-badge f-badge-animation-processing"></div>
            <span>优秀</span>
        </div>
        <br />
        <br />

        <div class="f-badge-pill f-badge-blue">
            <div class="f-badge f-badge-animation-processing"></div>
            <span>良好</span>
        </div>
        <br />
        <br />

        <div class="f-badge-pill f-badge-warning">
            <div class="f-badge f-badge-animation-processing"></div>
            <span>补考</span>
        </div>
        <br />
        <br />

        <div class="f-badge-pill f-badge-error">
            <div class="f-badge f-badge-animation-processing"></div>
            <span>重修</span>
        </div>

    </form>
</body>
</html>
