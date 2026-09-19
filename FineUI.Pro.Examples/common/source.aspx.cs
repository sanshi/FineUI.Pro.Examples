using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace FineUI.Pro.Examples
{
    public partial class source : PageBase
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string files = Request.QueryString["files"];

                if (String.IsNullOrEmpty(files))
                {
                    return;
                }

                if (!String.IsNullOrEmpty(files))
                {
                    string[] fileNames = files.Split(';');

                    for (int i = 0; i < fileNames.Length; i++)
                    {
                        string fileName = fileNames[i].Trim();
                        if (String.IsNullOrEmpty(fileName))
                        {
                            continue;
                        }

                        if (fileName.StartsWith("~"))
                        {
                            // 保留当前应用虚拟目录。直接删掉 ~ 会把 ~/res/... 变成站点根路径
                            // /res/...，子目录部署时 source_file.aspx 会把它判为应用根目录之外。
                            fileName = ResolveUrl(fileName);
                        }

                        // /demo_pro_i1lp/mobile/?file=datalist/datalist_linktopanel.aspx"
                        // /mobile/?file=tabstrip/tabstrip_button_icontop_hbox.aspx
                        if (fileName.Contains("/mobile/?file="))
                        {
                            fileName = fileName.Replace("/mobile/?file=", "/mobile/");
                        }


                        // 处理编辑页面，类似 /demo_pro/grid/grid_newtab_window.aspx?id=101&name=张三 
                        int lastQuestionMaskPosition = fileName.IndexOf("?");
                        if (lastQuestionMaskPosition >= 0)
                        {
                            fileName = fileName.Substring(0, lastQuestionMaskPosition);
                        }

                        string shortFileName = GetShortFileName(fileName);
                        string iframeUrl = "./source_file.aspx?file=" + fileName;

                        Tab tab = new Tab();
                        tab.Title = shortFileName;
                        tab.EnableIFrame = true;
                        tab.IFrameUrl = iframeUrl;
                        tab.IconUrl = GetIconUrl(tab.IFrameUrl);
                        tab.TitleToolTip = fileName;
                        TabStrip1.Tabs.Add(tab);

                        // 只有后置代码文件真的存在时才加这个选项卡。内联式 .ashx（C# 直接写在
                        // .ashx 里、没有 .cs 的那种）如果也硬加一个，点开就是「未能找到文件」的黄页。
                        if ((fileName.ToLower().EndsWith(".aspx")
                            || fileName.ToLower().EndsWith(".ascx")
                            || fileName.ToLower().EndsWith(".master")
                            || fileName.ToLower().EndsWith(".ashx"))
                            && File.Exists(Server.MapPath(fileName + ".cs")))
                        {
                            tab = new FineUI.Pro.Tab();
                            tab.Title = shortFileName + ".cs";
                            tab.EnableIFrame = true;
                            tab.IFrameUrl = iframeUrl + ".cs";
                            tab.IconUrl = GetIconUrl(tab.IFrameUrl);
                            tab.TitleToolTip = fileName + ".cs";
                            TabStrip1.Tabs.Add(tab);
                        }
                    }
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string GetIconUrl(string url)
        {
            string suffix = url.Substring(url.LastIndexOf('.') + 1);
            return "~/res/images/filetype/vs_" + suffix + ".png";
        }

        private string GetShortFileName(string fileName)
        {
            int index = fileName.LastIndexOf("/");

            if (index >= 0)
            {
                return fileName.Substring(index + 1);
            }

            return fileName;
        }
    }
}
