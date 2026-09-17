<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_rate.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_rate" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:NumberBox ID="NumberBox1" runat="server" DisplayType="Rate" Text="3">
        </f:NumberBox>
        <br />
        <br />
        半星评分：
        <br />
        <f:NumberBox ID="NumberBox2" runat="server" DisplayType="Rate" Text="3.5" RateAllowHalf="true">
        </f:NumberBox>
        <br />
        <br />
        只读：
        <br />
        <f:NumberBox ID="NumberBox3" runat="server" DisplayType="Rate" Text="2" Readonly="true">
        </f:NumberBox>
        <br />
        <br />
        禁用点击清除：
        <br />
        <f:NumberBox ID="NumberBox4" runat="server" DisplayType="Rate" Text="3" RateAllowClear="false">
        </f:NumberBox>
        <br />
        <br />
        自定义字符、图标、个数：
        <br />
        <f:NumberBox ID="NumberBox5" runat="server" DisplayType="Rate" Text="3" RateCharacter="A">
        </f:NumberBox>
        <br />
        <f:NumberBox ID="NumberBox6" runat="server" DisplayType="Rate" Text="4" RateCharacter="好">
        </f:NumberBox>
        <br />
        <f:NumberBox ID="NumberBox7" runat="server" DisplayType="Rate" Text="5" RateIconFont="_SmileO" RateCount="10">
        </f:NumberBox>
        <br />
        <f:NumberBox ID="NumberBox8" runat="server" DisplayType="Rate" Text="6" RateIconFont="_ThumbsUp" RateCount="10">
        </f:NumberBox>
        <br />
        <f:NumberBox ID="NumberBox9" runat="server" DisplayType="Rate" Text="7" RateIconFont="_Heart" RateCount="10">
        </f:NumberBox>
        <br />
        <br />
        评分文本：
        <br />
        <f:NumberBox ID="NumberBox10" runat="server" DisplayType="Rate" Text="3" RateTextVisible="true" RateTextRendererFunction="renderNumberBox10">
        </f:NumberBox>
        <br />
        <f:NumberBox ID="NumberBox11" runat="server" DisplayType="Rate" Text="3.5" RateAllowHalf="true" RateTextVisible="true">
        </f:NumberBox>
        <br />
        <br />
        后台更新：
        <br />
        <f:NumberBox ID="NumberBox12" runat="server" DisplayType="Rate" Text="3">
        </f:NumberBox>
        <br />
        <f:Button ID="Button1" runat="server" Text="更新" OnClick="Button1_Click"></f:Button>
        <br />
    </form>
    <script>
        var desc = ['terrible', 'bad', 'normal', 'good', 'wonderful'];

        function renderNumberBox10(val) {
            var rateText = 'not yet rated';
            if (val > 0) {
                rateText = desc[val - 1];
            }
            return rateText;
        }
    </script>
</body>
</html>
