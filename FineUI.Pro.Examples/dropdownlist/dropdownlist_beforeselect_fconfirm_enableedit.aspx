<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_beforeselect_fconfirm_enableedit.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_beforeselect_fconfirm_enableedit" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（确认对话框，F.confirm）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableEdit="true">
                    <Items>
                        <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                        <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                        <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                        <f:ListItem Text="可选项4" Value="Value4" />
                        <f:ListItem Text="可选项5" Value="Value5" />
                        <f:ListItem Text="可选项6" Value="Value6" />
                        <f:ListItem Text="可选择项7" Value="Value7" />
                        <f:ListItem Text="可选择项8" Value="Value8" />
                        <f:ListItem Text="可选择项9" Value="Value9" />
                        <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                    </Items>
                    <Listeners>
                        <f:Listener Event="beforeselect" Handler="onDropDownListBeforeSelect" />
                    </Listeners>
                </f:DropDownList>

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        <br />
        注：下拉列表的属性设置为EnableEdit=true（ForceSelection默认为true）。
    </form>

    <script>

        function onDropDownListBeforeSelect(event, selectedValue) {
            // this代表当前下拉列表对象
            var ddl = this;

            // F.confirm是异步函数，直接返回
            F.confirm({
                message: '确定改变选中项？',
                ok: function () {
                    // 重新设置选中项
                    ddl.hidePopEl();
                    ddl.setValue(selectedValue);
                },
                cancel: function () {
                    // 如果用户手工输入值，则可能输入框中的值已经改变，需要还原
                    ddl.hidePopEl();
                    ddl.setValue(ddl.getValue());
                }
            });

            // 需要显式的返回 false，来阻止执行返回的脚本
            return false;
        }
        

    </script>
</body>
</html>
