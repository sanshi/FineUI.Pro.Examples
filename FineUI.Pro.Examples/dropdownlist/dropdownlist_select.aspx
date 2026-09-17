<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_select.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_select" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="简单下拉列表（自动回发）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1">
                    <Items>
                        <f:ListItem Text="可选项1" Value="Value1" />
                        <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                        <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                        <f:ListItem Text="可选项4" Value="Value4" />
                        <f:ListItem Text="可选项5" Value="Value5" />
                        <f:ListItem Text="可选项6" Value="Value6" />
                        <f:ListItem Text="可选择项7" Value="Value7" />
                        <f:ListItem Text="可选择项8" Value="Value8" />
                        <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                    </Items>
                    <Listeners>
                        <f:Listener Event="select" Handler="onDDLSelect" />
                    </Listeners>
                </f:DropDownList>

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server"
                    CssClass="marginr" ClickHandler="onSelectItem6Click"></f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" ClickHandler="onGetSelectionClick"></f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
    </form>
    <script>

        var labResultClientID = '<%= labResult.ClientID %>';
        var dropDownList1ClientID = '<%= DropDownList1.ClientID %>';

        function checkDDLSelection() {
            var ddl = F(dropDownList1ClientID);
            var ddlValue = ddl.getValue();

            if (ddlValue) {
                F(labResultClientID).setValue('选中项：' + ddl.getTextByValue(ddlValue) + '（值：' + ddlValue + '）');
            }
            else {
                F(labResultClientID).setValue('无选中项');
            }
        }

        function onDDLSelect(event, cvalue, ovalue) {
            checkDDLSelection();
        }

        function onSelectItem6Click(event) {
            F(dropDownList1ClientID).setValue('Value6');
        }

        function onGetSelectionClick(event) {
            checkDDLSelection();
        }

    </script>
</body>
</html>
