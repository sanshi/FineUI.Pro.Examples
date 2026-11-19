<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_hide_field.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_hide_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form LabelWidth="100px" BodyPadding="10px" EnableCollapse="false" ID="Form2" IsFluid="true" runat="server" Title="表单">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="labTitle" HideMode="Visibility" Label="标题" Text="申请单" runat="server" />
                        <f:Label ID="labLiuShuiHao" Label="流水号" Text="123456789" runat="server" />
                    </Items>
                </f:FormRow>
                <f:FormRow runat="server" ID="FormRow2">
                    <Items>
                        <f:Label ID="labPhone" Label="电话" Text="0551-1234567" runat="server" />
                        <f:Label ID="Label16" runat="server" Label="申请人" Text="admin">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow runat="server" ID="FormRow3" HideMode="Visibility">
                    <Items>
                        <f:Label ID="Label4" Label="编号" Text="200804170006" runat="server" />
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" EmptyText="请输入常用电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" Required="true" EmptyText="请选择审批人" runat="server" ShowRedStar="true"
                            AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" EmptyText="请输入申请数量" MaxValue="1000" Required="true"
                            runat="server" ShowRedStar="true" />
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
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:Button ID="btnSubmitForm2" Text="验证表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
                                    ValidateForms="Form2">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <f:Button ID="btnShowHideTitle" Text="显示隐藏[标题]" CssClass="marginr" runat="server" OnClick="btnShowHideTitle_Click">
        </f:Button>
        <f:Button ID="btnShowHidePhone" Text="显示隐藏[电话]" runat="server" OnClick="btnShowHidePhone_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowHideFormRow2" Text="显示隐藏第二行" CssClass="marginr" runat="server" OnClick="btnShowHideFormRow2_Click">
        </f:Button>
        <f:Button ID="btnShowHideFormRow3" Text="显示隐藏第三行（隐藏后显示空白行）" CssClass="marginr" runat="server" OnClick="btnShowHideFormRow3_Click">
        </f:Button>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示隐藏单个字段或整行，并对比保留空白位置与释放布局空间这两种隐藏方式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>隐藏单个字段</h3>
            <ul>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnShowHideTitle.ClientID %>"
                        title="显示隐藏[标题]">显示隐藏[标题]</strong>。<br />
                    结果：按钮回发后由后台隐藏<strong class="example-control-reference" data-example-control="<%= labTitle.ClientID %>"
                        title="标题">标题</strong>，原来的位置仍为空白，同行的<strong class="example-control-reference" data-example-control="<%= labLiuShuiHao.ClientID %>"
                        title="流水号">流水号</strong>不向左补位。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnShowHidePhone.ClientID %>"
                        title="显示隐藏[电话]">显示隐藏[电话]</strong>。<br />
                    结果：按钮回发后由后台隐藏<strong class="example-control-reference" data-example-control="<%= labPhone.ClientID %>"
                        title="电话">电话</strong>，释放其占用空间，同一行的<strong class="example-control-reference" data-example-control="<%= Label16.ClientID %>"
                        title="申请人">申请人</strong>向左补位。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>隐藏整行</h3>
            <ul>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnShowHideFormRow2.ClientID %>"
                        title="显示隐藏第二行">显示隐藏第二行</strong>。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= labPhone.ClientID %>" title="电话">电话</strong>、<strong
                        class="example-control-reference" data-example-control="<%= Label16.ClientID %>" title="申请人">申请人</strong>整行隐藏并释放高度，后面的行向上补位。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnShowHideFormRow3.ClientID %>"
                        title="显示隐藏第三行（隐藏后显示空白行）">显示隐藏第三行（隐藏后显示空白行）</strong>。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= Label4.ClientID %>" title="编号">编号</strong>、<strong
                        class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>" title="电子邮箱">电子邮箱</strong>整行隐藏，仍保留一整行空白。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>恢复显示</h3>
            <ul>
                <li>
                    再次点击对应的显示隐藏按钮。<br />
                    结果：相应字段或整行恢复显示；各次切换都由按钮回发，后台反转 <code>Hidden</code>。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>对比隐藏[标题]和隐藏[电话]的不同之处（[标题]的<code>HideMode</code>=<code>Visibility</code>） </li>
                <li>对比隐藏第二行和隐藏第三行的不同之处（<strong class="example-control-reference" data-example-control="<%= FormRow3.ClientID %>"
                        title="第 3 个表单行">FormRow3</strong>的<code>HideMode</code>=<code>Visibility</code>） </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>HideMode</code>（<strong class="example-control-reference" data-example-control="<%= labTitle.ClientID %>"
                        title="标题">标题</strong>、<strong class="example-control-reference" data-example-control="<%= FormRow2.ClientID %>" title="第 2 个表单行">第 2
                        个表单行</strong>、<strong class="example-control-reference" data-example-control="<%= labPhone.ClientID %>" title="电话">电话</strong>、<strong
                        class="example-control-reference" data-example-control="<%= FormRow3.ClientID %>" title="第 3 个表单行">第 3 个表单行</strong>）：标题和第三行设为
                    <code>Visibility</code>，隐藏后占位；电话和第二行使用默认 <code>Display</code>，隐藏后释放空间。
                </li>
                <li><code>Hidden</code>（<strong class="example-control-reference" data-example-control="<%= labTitle.ClientID %>" title="标题">标题</strong>、<strong
                        class="example-control-reference" data-example-control="<%= FormRow2.ClientID %>" title="第 2 个表单行">第 2 个表单行</strong>、<strong
                        class="example-control-reference" data-example-control="<%= labPhone.ClientID %>" title="电话">电话</strong>、<strong
                        class="example-control-reference" data-example-control="<%= FormRow3.ClientID %>" title="第 3 个表单行">第 3
                        个表单行</strong>）：后台按钮事件反转此值，切换字段或整行的显示。</li>
            </ul>
        </section>
    </template>
</body>
</html>
