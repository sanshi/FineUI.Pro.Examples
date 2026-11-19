<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_assignment_order.aspx.cs" Inherits="FineUI.Pro.Examples.form.dropdownlist_assignment_order" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>下拉列表赋值顺序</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm runat="server" ID="SimpleForm1" IsFluid="true" MaxWidth="600" Title="可编辑下拉列表" ShowHeader="true" ShowBorder="true" BodyPadding="10"
            LabelWidth="100">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList2" Label="当前选择" EnableEdit="true" ForceSelection="false">
                    <Items>
                        <f:ListItem Value="a" Text="甲" />
                        <f:ListItem Value="b" Text="乙" />
                    </Items>
                </f:DropDownList>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" ID="Toolbar1" Position="Bottom">
                    <Items>
                        <f:Button runat="server" ID="btnValueThenText" Text="清空后先赋值再写文字" OnClick="btnValueThenText_Click" CssClass="marginr" />
                        <f:Button runat="server" ID="btnTextThenValue" Text="清空后先写文字再赋值" OnClick="btnTextThenValue_Click" CssClass="marginr" />
                        <f:Button runat="server" ID="btnReadDropDownList" Text="读取赋值结果" OnClick="btnReadDropDownList_Click" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        <f:SimpleForm runat="server" ID="SimpleFormResult" IsFluid="true" MaxWidth="600" Title="后台读取结果" ShowHeader="true" ShowBorder="true" BodyPadding="10">
            <Items>
                <f:Label runat="server" ID="labResult" ShowLabel="false" Text="请先选择一种赋值顺序，再读取赋值结果。" />
            </Items>
        </f:SimpleForm>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比清空后先写选中值还是先写自定义文字，验证最终值与文字的对应关系。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>比较两种赋值顺序</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnValueThenText.ClientID %>"
                        title="清空后先赋值再写文字">清空后先赋值再写文字</strong>，再点击<strong class="example-control-reference"
                        data-example-control="<%= btnReadDropDownList.ClientID %>" title="读取赋值结果">读取赋值结果</strong>。<br />
                    结果：后写的自定义文字生效，读取结果显示自定义输入，并可对照此时的选中值。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnTextThenValue.ClientID %>"
                        title="清空后先写文字再赋值">清空后先写文字再赋值</strong>，再点击<strong class="example-control-reference"
                        data-example-control="<%= btnReadDropDownList.ClientID %>" title="读取赋值结果">读取赋值结果</strong>。<br />
                    结果：最后选中值 <code>a</code> 生效，显示“甲”；后写的选中值决定对应的显示文字。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p><strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>"
                    title="可编辑下拉列表">可编辑下拉列表</strong>清空后，最后写文字表示自由输入，最后选值则显示对应选项。</p>
            <p>先赋值再写文字：选中值为空，文字为“自定义输入”；先写文字再赋值：选中值为 <code>a</code>，文字为“甲”。</p>
            <p>点击<strong class="example-control-reference" data-example-control="<%= btnReadDropDownList.ClientID %>"
                    title="读取赋值结果">读取赋值结果</strong>，可核对下一次回发时后台收到的选中值和文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SelectedValue</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList2.ClientID %>"
                        title="当前选择">当前选择</strong>）：赋值先后影响最终的列表选择和自由输入文字，应按业务希望保留的结果安排调用顺序。</li>
                <li><code>Text</code>（<strong class="example-control-reference" data-example-control="<%= btnValueThenText.ClientID %>"
                        title="清空后先赋值再写文字">清空后先赋值再写文字</strong>、<strong class="example-control-reference" data-example-control="<%= btnTextThenValue.ClientID %>"
                        title="清空后先写文字再赋值">清空后先写文字再赋值</strong>、<strong class="example-control-reference"
                        data-example-control="<%= btnReadDropDownList.ClientID %>" title="读取赋值结果">读取赋值结果</strong>、<strong class="example-control-reference"
                        data-example-control="<%= labResult.ClientID %>"
                        title="请先选择一种赋值顺序，再读取赋值结果。">请先选择一种赋值顺序，再读取赋值结果。</strong>）：同一轮赋值中最后写入文字时保留自由输入，最后设置选中值时采用对应选项文字。</li>
            </ul>
        </section>
    </template>
</body>
</html>
