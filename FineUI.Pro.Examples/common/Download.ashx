<%@ WebHandler Language="C#" Class="Download" %>

using System;
using System.Web;
using System.IO;
using FineUI.Pro.Examples;

// 公共下载入口：图片上传示例与 WebUploader 示例共享。
// 读取保存在 App_Data/upload（ASP.NET/IIS 内置受保护目录，直接 HTTP 访问返回 404）下的上传文件。
//
// 输出形态由“调用方”声明，而不是由文件扩展名推断：
//   不带 inline（UploadStorage.GetFileUrl）→ 一律 application/octet-stream + attachment，浏览器只下载不渲染；
//   带 inline=1（UploadStorage.GetImageUrl）→ 仅当扩展名在图片白名单内才按 image/xxx 内联显示，
//   白名单外（.html / .svg 等）降级为附件下载。
//
// 于是“能被内联渲染的集合”恒为那 5 种位图，与谁来请求、请求方怎么写参数无关。
// 上传目录、扩展名白名单、Content-Type 表、inline 判定都取自 UploadStorage，与上传端同一份实现。
// 注意：.ashx 是独立 HTTP 处理器，不经过 FineUI 的 aspx 响应处理，无需额外排除配置。
public class Download : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string file = context.Request.QueryString["file"];
        if (String.IsNullOrEmpty(file))
        {
            WriteStatus(context, 404);
            return;
        }

        // 安全①：先挡掉非法文件名字符。.NET Framework 的 Path.GetFileName 遇到 | < > " * ?
        // 和控制字符会抛 ArgumentException（.NET Core 不抛），不先挡一次的话 ?file=a|b 就是 500。
        if (file.IndexOfAny(Path.GetInvalidFileNameChars()) >= 0)
        {
            WriteStatus(context, 400);
            return;
        }

        // 安全②：只取文件名部分，剥离任何目录信息，防止路径穿越（如 ..\..\Web.config）
        string safeName = Path.GetFileName(file);
        if (safeName != file)
        {
            WriteStatus(context, 400);
            return;
        }

        string fullPath = UploadStorage.GetUploadFilePath(safeName);
        if (!File.Exists(fullPath))
        {
            WriteStatus(context, 404);
            return;
        }

        // 禁止浏览器嗅探内容改写 Content-Type
        context.Response.AddHeader("X-Content-Type-Options", "nosniff");

        // 安全③：只有白名单内的图片、且调用方明确要求内联时，才按 image/xxx 输出。
        string imageContentType = UploadStorage.GetImageContentType(safeName);
        if (UploadStorage.IsInlineRequested(context.Request.QueryString["inline"]) && imageContentType != null)
        {
            // 不写 Content-Disposition，浏览器默认即内联
            context.Response.ContentType = imageContentType;
            context.Response.TransmitFile(fullPath);
            return;
        }

        // 其余一律以附件下载：传上来的 .html / .svg 等不会被渲染，从根上杜绝存储型 XSS。
        context.Response.ContentType = "application/octet-stream";
        context.Response.AddHeader("Content-Disposition", BuildContentDisposition(safeName));
        context.Response.TransmitFile(fullPath);
    }

    /// <summary>
    /// 构造 Content-Disposition：filename 用 URL 编码兜底老浏览器，
    /// filename* 使用 UTF-8 编码，保证中文文件名在现代浏览器里不乱码。
    /// </summary>
    private static string BuildContentDisposition(string fileName)
    {
        string encoded = HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8);
        return "attachment; filename=\"" + encoded + "\"; filename*=UTF-8''" + encoded;
    }

    private static void WriteStatus(HttpContext context, int statusCode)
    {
        context.Response.StatusCode = statusCode;
        context.Response.ContentType = "text/plain";
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
