<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajax.aspx.cs" Inherits="FineUI.Pro.Examples.ajax" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        ul.mainlist {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        ul.mainlist>li {
            display: inline-block;
            width: 250px;
            margin: 0 10px 10px 0;
            vertical-align: top;
        }

        ul.mainlist>li .mainitem {
            border-style: solid;
            border-width: 1px;
        }

        ul.mainlist>li .f-widget-header {
            padding: 10px;
            border-bottom-width: 1px;
            border-bottom-style: solid;
        }

        ul.mainlist>li .ajaxlist-container {
            height: 220px;
            overflow-y: auto;
        }

        ul.ajaxlist {
            list-style-type: none;
            margin: 5px 10px;
            padding: 0;
        }

        ul.ajaxlist>li {
            margin-bottom: 5px;
        }

        .mysearch {
            text-align: left;
        }

        .mysearch .f-field-textbox {
            height: 46px;
            font-size: 24px;
            line-height: 28px;
            padding: 8px 12px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server"></f:PageManager>
        <div class="mysearch">
            <f:TextBox ID="tbxSearch" ShowLabel="false" EmptyText="搜索类名" runat="server" Width="350px">
                <Listeners>
                    <f:Listener Event="change" Handler="onSearchBoxChange" />
                </Listeners>
            </f:TextBox>
        </div>
        <br />
        <asp:Literal ID="litResult" EnableViewState="false" runat="server"></asp:Literal>
        <%--<br />
        FineUI.Pro 有原生的 AJAX 支持，也就是说不需要做任何配置，控件属性在服务器端的改变都能以 AJAX 的方式影响到前端界面的显示。
        <br />
        但是，并非控件的所有属性都支持 AJAX 改变，下面列表展示了每个控件有哪些属性支持 AJAX 改变。--%>
        <br />
        <br />
    </form>
    <script>
        function onSearchBoxChange(event) {
            var keyword = this.getValue().toLowerCase();

            $('ul.mainlist > li').each(function() {
                var cnode = $(this),
                    title = cnode.find('.f-widget-header').text().toLowerCase();

                if (title.indexOf(keyword) >= 0) {
                    cnode.show();
                } else {
                    cnode.hide();
                }
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按控件类名筛选 FineUI.Pro 支持 AJAX 更新的属性清单。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>按类名查找属性</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxSearch").ClientID %>'
                        title="搜索类名">搜索类名</strong>输入 <code>TextBox</code>。<br />结果：浏览器只显示类名包含 TextBox 的属性分组；本页不是按属性名搜索，也没有详情抽屉。</li>
                <li>清空搜索文字。<br />结果：所有控件分组重新显示，列表中的属性可作为后台更新能力的查询入口。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>change</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxSearch").ClientID %>'
                        title="搜索类名">搜索类名</strong>）：搜索框文字变化后，在浏览器按各分组的类名过滤，不发送查询回发。</li>
            </ul>
        </section>
    </template>
</body>
</html>
