<%@ WebHandler Language="C#" Class="AlertDownloadTextFile" %>

using System.Text;
using System.Web;

public class AlertDownloadTextFile : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.Clear();
        context.Response.ContentType = "text/plain";
        context.Response.ContentEncoding = Encoding.UTF8;
        context.Response.Charset = "utf-8";
        context.Response.AddHeader("Content-Disposition", "attachment; filename=alert_download.txt");
        context.Response.AddHeader("X-Content-Type-Options", "nosniff");
        context.Response.Write("这是下载文件的内容！");
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
