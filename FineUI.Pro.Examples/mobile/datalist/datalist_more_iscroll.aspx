<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_more_iscroll.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_more_iscroll" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../../res/css/datalist.css" rel="stylesheet" />
    <style>
        .item-desc {
            word-break: break-all;
            white-space: normal;
        }

        #wrapper {
            position: absolute;
            z-index: 1;
            top: 0;
            bottom: 0;
            left: -9999px;
            width: 100%;
            overflow: auto;
        }

        #scroller {
            position: absolute;
            z-index: 1;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            width: 100%;
            padding: 0;
        }

        /*
            #scroller ul {
                list-style: none;
                padding: 0;
                margin: 0;
                width: 100%;
                text-align: left;
            }

            #scroller li {
                padding: 0 10px;
                height: 40px;
                line-height: 40px;
                border-bottom: 1px solid #ccc;
                border-top: 1px solid #fff;
                background-color: #fafafa;
                font-size: 14px;
            }
            */

        #myFrame {
            position: absolute;
            top: 0;
            left: 0;
        }

        #pullDown, #pullUp {
            background: #fff;
            height: 50px;
            line-height: 40px;
            padding: 5px 10px;
            border-bottom: 1px solid #ccc;
            font-weight: bold;
            font-size: 14px;
            color: #888;
        }

            #pullDown .pullDownIcon, #pullUp .pullUpIcon {
                display: block;
                float: left;
                width: 40px;
                height: 40px;
                background: url(../../res/images/pull-icon@2x.png) 0 0 no-repeat;
                -webkit-background-size: 40px 80px;
                background-size: 40px 80px;
                -webkit-transition-property: -webkit-transform;
                -webkit-transition-duration: 250ms;
            }

            #pullDown .pullDownIcon {
                -webkit-transform: rotate(0deg) translateZ(0);
            }

            #pullUp .pullUpIcon {
                -webkit-transform: rotate(-180deg) translateZ(0);
            }

            #pullDown.flip .pullDownIcon {
                -webkit-transform: rotate(-180deg) translateZ(0);
            }

            #pullUp.flip .pullUpIcon {
                -webkit-transform: rotate(0deg) translateZ(0);
            }

            #pullDown.loading .pullDownIcon, #pullUp.loading .pullUpIcon {
                background-position: 0 100%;
                -webkit-transform: rotate(0deg) translateZ(0);
                -webkit-transition-duration: 0ms;
                -webkit-animation-name: loading;
                -webkit-animation-duration: 2s;
                -webkit-animation-iteration-count: infinite;
                -webkit-animation-timing-function: linear;
            }

        @-webkit-keyframes loading {
            from {
                -webkit-transform: rotate(0deg) translateZ(0);
            }

            to {
                -webkit-transform: rotate(360deg) translateZ(0);
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <%--<f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="Fit" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="列表" runat="server" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Panel ID="Panel2" CssClass="mypanel" ShowBorder="false" ShowHeader="false" runat="server">
                    <Items>


                        <f:Label runat="server" CssClass="morebutton" ID="labMore" Text="上拉加载..."></f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>--%>

        <div id="wrapper">
            <div id="scroller">
                <div id="pullDown">
                    <span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
                </div>
                <f:DataList runat="server" ID="DataList1" AttributeDataTag="1" OnItemDataBound="DataList1_ItemDataBound">
                </f:DataList>
                <div id="pullUp">
                    <span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载...</span>
                </div>
            </div>
        </div>

    </form>
    <script src="../../res/third-party/iscroll/iscroll.js"></script>
    <script>

        // 本示例代码参考：https://davidwalsh.name/iphone-scrollbars
        // 本示例代码参考：https://davidwalsh.name/demo/iscroll/examples/pull-to-refresh/

        var myScroll,
            pullDownEl, pullDownOffset,
            pullUpEl, pullUpOffset,
            generatedCount = 0;

        function pullDownAction() {
            window.location.reload();
        }

        function pullUpAction() {
            // 自定义回发，设置完成时回调complete
            F.doPostBack({
                eventName: 'PullUpAction',
                // 不显示页面加载动画
                enableAjaxLoading: false,
                complete: function (data) {
                    // AJAX回发结束
                    myScroll.refresh();
                }
            });
        }


        function loaded() {
            pullDownEl = document.getElementById('pullDown');
            pullDownOffset = pullDownEl.offsetHeight;
            pullUpEl = document.getElementById('pullUp');
            pullUpOffset = pullUpEl.offsetHeight;

            myScroll = new iScroll('wrapper', {
                useTransition: true,
                topOffset: pullDownOffset,
                onRefresh: function () {
                    if (pullDownEl.className.match('loading')) {
                        pullDownEl.className = '';
                        pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
                    } else if (pullUpEl.className.match('loading')) {
                        pullUpEl.className = '';
                        pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载...';
                    }
                },
                onScrollMove: function () {
                    if (this.y > 5 && !pullDownEl.className.match('flip')) {
                        pullDownEl.className = 'flip';
                        pullDownEl.querySelector('.pullDownLabel').innerHTML = '松开开始刷新...';
                        this.minScrollY = 0;
                    } else if (this.y < 5 && pullDownEl.className.match('flip')) {
                        pullDownEl.className = '';
                        pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
                        this.minScrollY = -pullDownOffset;
                    } else if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
                        pullUpEl.className = 'flip';
                        pullUpEl.querySelector('.pullUpLabel').innerHTML = '松开开始加载...';
                        this.maxScrollY = this.maxScrollY;
                    } else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
                        pullUpEl.className = '';
                        pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载...';
                        this.maxScrollY = pullUpOffset;
                    }
                },
                onScrollEnd: function () {
                    if (pullDownEl.className.match('flip')) {
                        pullDownEl.className = 'loading';
                        pullDownEl.querySelector('.pullDownLabel').innerHTML = '正在加载...';
                        pullDownAction();
                    } else if (pullUpEl.className.match('flip')) {
                        pullUpEl.className = 'loading';
                        pullUpEl.querySelector('.pullUpLabel').innerHTML = '正在加载...';
                        pullUpAction();
                    }
                }
            });

            setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
        }

        document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);

        //document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

        F.ready(function () {
            loaded();
        });

    </script>
</body>
</html>
