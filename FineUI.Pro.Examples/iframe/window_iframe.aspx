<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.window_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .steps {
            border: solid 1px red;
            padding: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" EnableFormChangeConfirm="true" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" CssClass="f-widget-content" Layout="Fit" runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="btnClose" Text="关闭" Icon="SystemClose" runat="server" ClickHandler="onCloseClick">
                        </f:Button>
                        <f:Button ID="btnClosePostBack" Text="保存数据" ValidateForms="SimpleForm1" OnClick="btnClosePostBack_Click" Icon="SystemSave"
                            runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm ID="SimpleForm1" ShowBorder="false"
                    ShowHeader="false" AutoScroll="true" BodyPadding="10px" runat="server" EnableCollapse="false">
                    <Items>
                        <f:Label ID="Label2" EncodeText="false" CssClass="steps" Text="按照如下步骤操作来观察“确认关闭”对话框：<ul><li>编辑本表单（比如选中复选框、修改日期）</li><li>点击弹出窗体右上角关闭图标、关闭按钮、当前选项卡关闭图标、浏览器的关闭按钮或者浏览器的刷新图标，<a target='_blank' href='../res/images/formchangeconfirm.png'>查看图示</a></li><li>弹出确认关闭窗体的对话框</li></ul>" runat="server" />
                        <f:NumberBox ID="NumberBox1" Label="数字输入框" Required="true" ShowRedStar="true" runat="server" />
                        <f:CheckBox ID="CheckBox1" runat="server" Label="复选框">
                        </f:CheckBox>
                        <f:TextBox ID="TextBox1" Label="文本输入框" runat="server" ShowRedStar="true" Required="true">
                        </f:TextBox>
                        <f:DatePicker ID="DatePicker1" runat="server" SelectedDate="2008-05-09" Label="日期选择器"
                            Text="2008-05-09">
                        </f:DatePicker>
                        <f:TextBox ID="TextBox2" Label="默认隐藏的字段" runat="server" Hidden="true">
                        </f:TextBox>
                        <f:DropDownList Label="下拉列表" runat="server" ID="DropDownList1">
                            <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                            <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                            <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                            <f:ListItem Text="可选项4" Value="Value4" />
                            <f:ListItem Text="可选项5" Value="Value5" />
                            <f:ListItem Text="可选项6" Value="Value6" />
                            <f:ListItem Text="可选择项7" Value="Value7" />
                            <f:ListItem Text="可选择项8" Value="Value8" />
                            <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                            <f:ListItem Text="可选择项9" Value="Value9" />
                            <f:ListItem Text="可选择项10" Value="Value10" />
                            <f:ListItem Text="可选择项11" Value="Value11" />
                            <f:ListItem Text="可选择项12" Value="Value12" />
                            <f:ListItem Text="可选择项13" Value="Value13" />
                            <f:ListItem Text="可选择项14" Value="Value14" />
                            <f:ListItem Text="可选择项15" Value="Value15" />
                            <f:ListItem Text="可选择项16" Value="Value16" />
                        </f:DropDownList>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>
    </form>
    <script>

        function onCloseClick(event) {
            F.activeWindow.hide();
        }

    </script>
</body>
</html>
