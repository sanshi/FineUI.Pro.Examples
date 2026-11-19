<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_disabled.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form IsFluid="true" LabelWidth="100px" LabelSeparator="：" BodyPadding="10px" EnableCollapse="false" ID="Form1" runat="server" Title="表单">
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
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" EmptyText="请输入常用电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" runat="server" EmptyText="请选择审批人" Required="true" ShowRedStar="true"
                            AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" EmptyText="请输入申请数量" NoNegative="true" NoDecimal="true" MaxValue="1000" Required="true"
                            runat="server" ShowRedStar="true" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DatePicker runat="server" Required="true" Label="日期" EmptyText="请选择日期" ID="DatePicker1" SelectedDate="2014-07-10" ShowRedStar="true">
                        </f:DatePicker>
                        <f:TimePicker ID="TimePicker1" ShowRedStar="true" Label="时间" Increment="30" Required="true" Text="08:30" EmptyText="请选择时间"
                            runat="server">
                        </f:TimePicker>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:FileUpload runat="server" ID="filePhoto" EmptyText="请选择一张照片" Label="个人头像" Required="true" ShowRedStar="true">
                        </f:FileUpload>
                        <f:CheckBox runat="server" ID="cbxAtSchool" Label="是否在读"></f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowRedStar="true" Required="true">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:CheckBoxList ID="CheckBoxList1" Label="复选框列表" ColumnNumber="3" runat="server">
                            <f:CheckItem Text="可选项 1" Value="value1" />
                            <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                            <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                            <f:CheckItem Text="可选项 4" Value="value4" Selected="true" />
                            <f:CheckItem Text="可选项 5" Value="value5" Selected="true" />
                        </f:CheckBoxList>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:RadioButtonList ID="RadioButtonList2" Label="单选框列表" Required="true" ColumnNumber="3" runat="server">
                            <f:RadioItem Text="可选项 1" Value="value1" />
                            <f:RadioItem Text="可选项 2" Value="value2" />
                            <f:RadioItem Text="可选项 3" Value="value3" />
                            <f:RadioItem Text="可选项 4" Value="value4" />
                            <f:RadioItem Text="可选项 5" Value="value5" />
                        </f:RadioButtonList>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <f:Button ID="btnDisableAll" Text="全部禁用" CssClass="marginr" runat="server" OnClick="btnDisableAll_Click">
        </f:Button>
        <f:Button ID="btnEnableAll" Text="全部启用" CssClass="marginr" runat="server" OnClick="btnEnableAll_Click">
        </f:Button>
        <f:Button ID="btnReadOnlyAll" Text="全部只读" CssClass="marginr" runat="server" OnClick="btnReadOnlyAll_Click">
        </f:Button>
        <f:Button ID="btnCancelReadOnlyAll" Text="取消只读" CssClass="marginr" runat="server" OnClick="btnCancelReadOnlyAll_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnMarkInvalid" Text="设置无效标识" CssClass="marginr" runat="server" OnClick="btnMarkInvalid_Click">
        </f:Button>
        <f:Button ID="btnClearInvalid" Text="取消无效标识" CssClass="marginr" runat="server" OnClick="btnClearInvalid_Click">
        </f:Button>
        <f:Button ID="Button1" ValidateForms="Form1" Text="验证并提交表单" runat="server" OnClick="Button1_Click"></f:Button>
        <br />
        <br />
        <br />
        <br />
        <f:Button ID="btnDisablePanel" Text="禁用表单面板" CssClass="marginr" runat="server" OnClick="btnDisablePanel_Click">
        </f:Button>
        <f:Button ID="btnEnablePanel" Text="启用表单面板" CssClass="marginr" runat="server" OnClick="btnEnablePanel_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" Text="添加只读样式（类似禁用样式）" CssClass="marginr" runat="server" ClickHandler="onAddReadonlyStyleClick"></f:Button>
        <f:Button ID="Button3" Text="删除只读样式" CssClass="marginr" runat="server" ClickHandler="onRemoveReadonlyStyleClick"></f:Button>
    </form>
    <textarea id="readonlycss_holder" style="display: none;">
        .f-readonly { 
            opacity: .5; 
            filter: alpha(opacity=50);
        }
    </textarea>
    <script>
        function onAddReadonlyStyleClick(event) {
            F.addCSS('readonlycss', $('#readonlycss_holder').val());
        }

        function onRemoveReadonlyStyleClick(event) {
            $('#readonlycss').remove();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比逐字段禁用、只读、错误标记和禁用整个表单面板的效果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-power-off" aria-hidden="true"></i>禁用与只读</h3>
            <ol>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>"
                        title="电子邮箱">电子邮箱</strong>输入<code>demo&#64;example.com</code>，点击<strong class="example-control-reference"
                        data-example-control="<%= btnDisableAll.ClientID %>" title="全部禁用">全部禁用</strong>。<br />
                    结果：回发后后台禁用各字段，不能继续输入或选择；已有值保留。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnEnableAll.ClientID %>" title="全部启用">全部启用</strong>，再点击<strong
                        class="example-control-reference" data-example-control="<%= btnReadOnlyAll.ClientID %>" title="全部只读">全部只读</strong>。<br />
                    结果：字段恢复启用后进入只读状态，已有文字保留但不能由用户修改。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnCancelReadOnlyAll.ClientID %>" title="取消只读">取消只读</strong>。<br />
                    结果：恢复原有输入和选择能力；只读与禁用是不同的状态。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>面板与只读外观</h3>
            <ul>
                <li>
                    先点击<strong class="example-control-reference" data-example-control="<%= btnDisablePanel.ClientID %>"
                        title="禁用表单面板">禁用表单面板</strong>，再点击<strong class="example-control-reference" data-example-control="<%= btnEnablePanel.ClientID %>"
                        title="启用表单面板">启用表单面板</strong>。<br />
                    结果：切换表单整体可用状态，和逐个字段设置是两条独立操作路径。
                </li>
                <li>
                    在只读状态点击<strong class="example-control-reference" data-example-control="<%= Button2.ClientID %>"
                        title="添加只读样式（类似禁用样式）">添加只读样式（类似禁用样式）</strong>，再点击<strong class="example-control-reference"
                        data-example-control="<%= Button3.ClientID %>" title="删除只读样式">删除只读样式</strong>。<br />
                    结果：只读字段先显示半透明外观，再恢复原有外观；这里只改变样式，不把只读改成禁用。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>F.addCSS()</code>（<strong>页面客户端配置</strong>）：临时添加 .<code>f</code>-<code>readonly</code> 的透明度样式；删除同名样式后恢复。</li>
            </ul>
        </section>
    </template>
</body>
</html>
