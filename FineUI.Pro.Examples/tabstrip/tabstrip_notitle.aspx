<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_notitle.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_notitle" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Top" ActiveTabIndex="0" runat="server">
            <Tabs>
                <f:Tab ID="TabExample1" IconFont="_Windows" TitleToolTip="标签一的提示文本" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Icon="Accept" TitleToolTip="标签二的提示文本" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab IconFont="_Apple" TitleToolTip="标签三的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Icon="Clock" TitleToolTip="标签四的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab IconFont="_Android" TitleToolTip="标签五的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Icon="Computer" TitleToolTip="标签六的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab IconFont="_Google" TitleToolTip="标签七的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第七个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <f:TabStrip ID="TabStrip2" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Bottom" ActiveTabIndex="3" runat="server">
            <Tabs>
                <f:Tab ID="Tab1" IconFont="_Windows" TitleToolTip="标签一的提示文本" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Icon="Accept" TitleToolTip="标签二的提示文本" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" IconFont="_Apple" TitleToolTip="标签三的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab4" Icon="Clock" TitleToolTip="标签四的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab5" IconFont="_Android" TitleToolTip="标签五的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab6" Icon="Computer" TitleToolTip="标签六的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label6" Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab7" IconFont="_Google" TitleToolTip="标签七的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label7" Text="第七个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示保留标签区域但使用空标题文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>使用本页切换入口</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="第 1 个选项卡">第 1 个选项卡</strong>中的空文字标题项。<br />结果：可以切换对应内容；没有标题文字不等于隐藏该标签。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>选项卡的标题栏文本为空</li>
                <li>选项卡标题栏有提示信息</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Title</code>（本页各选项卡页，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabExample1").ClientID %>' title="第 1 个选项卡页">第 1
                        个选项卡页</strong>）：本页标签使用空标题文字，仍保留标题区域。</li>
            </ul>
        </section>
    </template>
</body>
</html>
