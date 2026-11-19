<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="slide.aspx.cs" Inherits="FineUI.Pro.Examples.third_party.slide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <link href="<%= PageContext.ResolveUrl("~/third-party/slide/demo.css") %>" rel="stylesheet" />
        <style>
            .pagecontent {
                border-left-width: 0;
                border-right-width: 0;
            }

            .pagecontent .f-panel-body {
                text-align: center;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager2" AutoSizePanelID="Panel1" runat="server"></f:PageManager>
        <f:Panel runat="server" ID="Panel1" Margin="24px" ShowBorder="false" ShowHeader="false" Layout="VBox">
            <Items>
                <f:ContentPanel ID="ContentPanel1" runat="server" ShowBorder="false" ShowHeader="false">
                    <div id="main">
                        <div id="gallery">
                            <div id="slides">
                                <div class="slide">
                                    <img src="<%= PageContext.ResolveUrl("~/third-party/slide/img/sample_slides/macbook.jpg") %>" width="920" height="400"
                                        alt="side" />
                                </div>
                                <div class="slide">
                                    <img src="<%= PageContext.ResolveUrl("~/third-party/slide/img/sample_slides/iphone.jpg") %>" width="920" height="400"
                                        alt="side" />
                                </div>
                                <div class="slide">
                                    <img src="<%= PageContext.ResolveUrl("~/third-party/slide/img/sample_slides/imac.jpg") %>" width="920" height="400"
                                        alt="side" />
                                </div>
                                <div class="slide">
                                    <img src="<%= PageContext.ResolveUrl("~/third-party/slide/img/sample_slides/info.jpg") %>" width="920" height="400"
                                        alt="side" />
                                </div>
                            </div>
                            <div id="menu">
                                <ul>
                                    <li class="fbar">&nbsp;</li>
                                    <li class="menuItem"><a href="#">
                                            <img src="<%= PageContext.ResolveUrl("~/third-party/slide/img/sample_slides/thumb_macbook.png") %>"
                                                alt="thumbnail" /></a></li>
                                    <li class="menuItem"><a href="#">
                                            <img src="<%= PageContext.ResolveUrl("~/third-party/slide/img/sample_slides/thumb_iphone.png") %>"
                                                alt="thumbnail" /></a></li>
                                    <li class="menuItem"><a href="#">
                                            <img src="<%= PageContext.ResolveUrl("~/third-party/slide/img/sample_slides/thumb_imac.png") %>"
                                                alt="thumbnail" /></a></li>
                                    <li class="menuItem"><a href="#">
                                            <img src="<%= PageContext.ResolveUrl("~/third-party/slide/img/sample_slides/thumb_about.png") %>"
                                                alt="thumbnail" /></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </f:ContentPanel>
                <f:ContentPanel BoxFlex="1" ShowBorder="true" ShowHeader="false" CssClass="pagecontent" runat="server">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill
                        Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1955年10月28日出生于美国华盛顿州西雅图，13岁开始计算机编程设计，18岁考入哈佛大学，一年后从哈佛退学，1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                    <p>
                        比尔·盖茨1995-2007年连续13年成为《福布斯》全球富翁榜首富，连续20年成为《福布斯》美国富翁榜首富。
                    </p>
                    <p>
                        来源： http://tutorialzine.com/2009/10/beautiful-apple-gallery-slideshow/
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Panel>

        <br />
    </form>
    <script>
        F.ready(function() {



            // 以下脚本来自：http://tutorialzine.com/2009/10/beautiful-apple-gallery-slideshow/
            var totWidth = 0;
            var positions = new Array();

            $('#slides .slide').each(function(i) {

                /* Traverse through all the slides and store their accumulative widths in totWidth */

                positions[i] = totWidth;
                totWidth += $(this).width();

                /* The positions array contains each slide's commulutative offset from the left part of the container */

                if (!$(this).width()) {
                    alert("Please, fill in width & height for all your images!");
                    return false;
                }

            });

            $('#slides').width(totWidth);

            /* Change the cotnainer div's width to the exact width of all the slides combined */
            $('#menu ul li a').click(function(e, keepScroll) {

                /* On a thumbnail click */

                $('li.menuItem').removeClass('act').addClass('inact');
                $(this).parent().addClass('act');

                var pos = $(this).parent().prevAll('.menuItem').length;

                $('#slides').stop().animate({
                    marginLeft: -positions[pos] + 'px'
                }, 450);
                /* Start the sliding animation */

                e.preventDefault();
                /* Prevent the default action of the link */


                // Stopping the auto-advance if an icon has been clicked:
                if (!keepScroll) clearInterval(itvl);
            });

            $('#menu ul li.menuItem:first').addClass('act').siblings().addClass('inact');
            /* On page load, mark the first thumbnail as active */



            /*****
             *
             *	Enabling auto-advance.
             *
             ****/
            var current = 1;

            function autoAdvance() {
                if (current == -1) return false;

                $('#menu ul li a').eq(current % $('#menu ul li a').length).trigger('click', [
                    true
                ]); // [true] will be passed as the keepScroll parameter of the click function on line 28
                current++;
            }

            // The number of seconds that the slider will auto-advance in:

            var changeEvery = 10;

            var itvl = setInterval(function() {
                autoAdvance()
            }, changeEvery * 1000);

            /* End of customizations */
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在 FineUI 内容面板中嵌入第三方图片轮播，并让其与正文区域一起布局。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>切换轮播图片</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="面板">面板</strong>中的轮播导航点击不同项目。<br />结果：轮播区域切换相应图片，正文面板仍保持原位置；自动轮播按本页脚本继续运行。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>slide / timer</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：本页脚本负责轮播索引、切换与自动计时，FineUI
                    面板只提供布局容器。</li>
            </ul>
        </section>
    </template>
</body>
</html>
