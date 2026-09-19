<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_client_not_finished.aspx.cs" Inherits="FineUI.Pro.Examples.data.grid_excel_client_not_finished" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server">
            <Columns>
                <f:TemplateField Width="60px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="tfGender" HeaderText="性别" TextAlign="Center">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" TextAlign="Center" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}"
                    HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="导出为Excel文件（客户端）" ClickHandler="onOutputExcelClick">
        </f:Button>
    </form>
    <script>
        function onOutputExcelClick(event) {
            var GridMain = '#<% =Grid1.ClientID %>';
            var gdv = $(GridMain).clone();//.find("f-grid-inner-main"); //$("[href='#']")  style="display: none;"
            gdv.find('[class="f-grid-inner-locked"]').remove();
            gdv.find('[style="display: none;"]').remove();
            gdv.find("[class]").removeClass();
            gdv.find("[href]").removeAttr("href");

            var nd = new Date();
            export_raw('DCA_' + nd.toLocaleString() + '.xls', gdv.html());
        }

        /*
        function export_raw(filename, csv) {
            var csvFile;
            var downloadLink;

            // CSV 文件
            csvFile = new Blob([csv], { type: "text/csv" });

            // 下载链接
            downloadLink = document.createElement("a");

            // 文件名
            downloadLink.download = filename;

            // 创建指向该文件的链接
            downloadLink.href = window.URL.createObjectURL(csvFile);

            // 隐藏下载链接
            downloadLink.style.display = "none";

            // 把链接挂到 DOM 上
            document.body.appendChild(downloadLink);

            // 点击下载链接
            downloadLink.click();
        }
        */
        
        function export_raw(name, data) {
            var urlObject = window.URL || window.webkitURL || window;

            var export_blob = new Blob([data]);

            var save_link = document.createElementNS("http://www.w3.org/1999/xhtml", "a")
            save_link.href = urlObject.createObjectURL(export_blob);
            save_link.download = name;
            fake_click(save_link);
        }
        function fake_click(obj) {
            var ev = document.createEvent("MouseEvents");
            ev.initMouseEvent(
                "click", true, false, window, 0, 0, 0, 0, 0
                , false, false, false, false, 0, null
            );
            obj.dispatchEvent(ev);
        }
        

    </script>
</body>
</html>
