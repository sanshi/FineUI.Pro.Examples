using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace FineUI.Pro.Examples
{
    public partial class source_file : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string file = Request.QueryString["file"].ToLower();

                if (file.StartsWith("http://") || file.StartsWith("https://"))
                {
                    desc.Text = String.Format("<br/><br/><a href=\"{0}\" target=\"_blank\">在新窗口打开</a>", file);
                    return;
                }

                // 不是网站根目录下的文件
                if (!UnderRootPath(file))
                {
                    return;
                }

                // 不允许下载文件的目录
                string basePath = GetBasePath(file);
                List<string> disallowPaths = new List<string> { "bin", "obj", "upload", "Properties" };
                if (disallowPaths.Contains(basePath))
                {
                    return;
                }


                // 只能下载指定类型文件
                string fileType = GetFileType(file);
                List<string> allowFileTypes = new List<string> { "aspx", "ascx", "master", "ashx", "cs", "xml", "css", "js" };
                if (!allowFileTypes.Contains(fileType))
                {
                    return;
                }

                // 文件不存在就给一句提示，不要让 ReadAllText 抛异常——异常页会把服务器上的物理路径带出去
                string fullPath = Server.MapPath(file);
                if (!File.Exists(fullPath))
                {
                    desc.Text = "<pre>源文件不存在。</pre>";
                    return;
                }

                // 读取文件内容
                string content = File.ReadAllText(fullPath);
                desc.Text = "<pre class=\"prettyprint linenums\">" + HttpUtility.HtmlEncode(content) + "</pre>"; // linenums


                // 深色主题下，使用深色的prettify主题
                if (PageManager1.Theme == FineUI.Pro.Theme.Dark_Hive)
                {
                    linkPrettifyTheme.Href = PageContext.ResolveUrl("~/res/google-code-prettify/themes/tomorrow-night.min.css");
                }
                else
                {
                    linkPrettifyTheme.Href = PageContext.ResolveUrl("~/res/google-code-prettify/themes/tomorrow.min.css");
                }
                
            }
        }

        private bool UnderRootPath(string fileName)
        {
            string filePath = Server.MapPath(fileName);
            string rootPath = Server.MapPath("~/");

            return filePath.StartsWith(rootPath);
        }

        private string GetBasePath(string fileName)
        {
            string filePath = Server.MapPath(fileName);
            string rootPath = Server.MapPath("~/");

            string basePath = filePath.Substring(rootPath.Length);
            int slashIndex = basePath.IndexOf("\\");
            if (slashIndex >= 0)
            {
                basePath = basePath.Substring(0, slashIndex);
            }

            return basePath;
        }

        private string GetFileType(string fileName)
        {
            string fileType = String.Empty;

            int lastDotIndex = fileName.ToLower().LastIndexOf(".");
            if (lastDotIndex >= 0)
            {
                fileType = fileName.Substring(lastDotIndex + 1);
            }

            return fileType;
        }
    }
}
