<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_ajax_complete.aspx.cs" Inherits="FineUI.Pro.Examples.other.form_ajax_complete" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form LabelWidth="100px" BodyPadding="10px" EnableCollapse="false"
            ID="Form1" IsFluid="true" runat="server" Title="表单">
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
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" runat="server" Required="true" ShowRedStar="true"
                            EmptyText="请选择审批人" AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                            <f:ListItem Text="老大丁" Value="3"></f:ListItem>
                            <f:ListItem Text="老大午" Value="4"></f:ListItem>
                            <f:ListItem Text="老大己" Value="5"></f:ListItem>
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
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="btnSubmit" Text="验证此表单并提交" CssClass="marginr" runat="server" ClickHandler="onSubmitClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>
    </form>
    <script>
        var Form1ClientID = '<%= Form1.ClientID %>';

        function onSubmitClick(event) {
            var form1 = F(Form1ClientID);

            // AJAX回发之前，先对表单进行验证
            if (!F.validateForm(Form1ClientID, { target: '_top' })) {
                return;
            }

            // AJAX回发之前显示面板加载动画
            form1.showLoading();

            // 自定义回发，设置完成时回调complete
            F.doPostBack({
                eventName: 'SubmitForm1',
                // 不显示页面加载动画
                enableAjaxLoading: false,
                complete: function (data) {
                    // AJAX回发结束时隐藏面板加载动画
                    form1.hideLoading();
                }
            });
        }
    </script>
</body>
</html>
