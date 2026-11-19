<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_inkbar.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_inkbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Top" ActiveTabIndex="0" ShowInkBar="true" runat="server">
            <Tabs>
                <f:Tab Title="标签一" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip2" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Bottom" ActiveTabIndex="0" ShowInkBar="true" runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip3" IsFluid="true" Height="250px" ShowBorder="true" TabPosition="Left" ActiveTabIndex="0" ShowInkBar="true" runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip4" IsFluid="true" Height="250px" ShowBorder="true" TabPosition="Right" ActiveTabIndex="0" ShowInkBar="true" runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>

        <br />
        <br />
        <br />
        以下示例增加属性：InkBarPosition="Top"
        <hr />
        <br />
        <br />

        <f:TabStrip ID="TabStrip5" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Top" ActiveTabIndex="0" ShowInkBar="true" InkBarPosition="Top"
            runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip6" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Bottom" ActiveTabIndex="0" ShowInkBar="true"
            InkBarPosition="Top" runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip7" IsFluid="true" Height="250px" ShowBorder="true" TabPosition="Left" ActiveTabIndex="0" ShowInkBar="true" InkBarPosition="Top"
            runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip8" IsFluid="true" Height="250px" ShowBorder="true" TabPosition="Right" ActiveTabIndex="0" ShowInkBar="true" InkBarPosition="Top"
            runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用墨水条跟随当前标签，并比较墨水条在标题不同边缘的位置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对比标题与当前项</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="第 1 个选项卡">第 1 个选项卡</strong>依次点击不同标签，对照本页其它组的同类标题。<br />结果：内容区随当前标签切换；标题方向、对齐、背景、边框或墨水条按本页配置显示。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>低版本<code>IE</code>浏览器不支持左侧和右侧选项卡。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowInkBar</code>（本页各选项卡，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="第 1 个选项卡">第 1
                        个选项卡</strong>）：初始为<code>true</code>，为当前标题显示墨水条。</li>
                <li><code>InkBarPosition</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip5").ClientID %>' title="第 5 个选项卡">第 5 个选项卡</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip6").ClientID %>'
                        title="第 6 个选项卡">第 6 个选项卡</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip7").ClientID %>' title="第 7 个选项卡">第 7 个选项卡</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip8").ClientID %>'
                        title="第 8 个选项卡">第 8 个选项卡</strong>）：初始为<code>Top</code>，指定墨水条位于标题的哪一边。</li>
            </ul>
        </section>
    </template>
</body>
</html>
