using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Web;
using System.Web.SessionState;

namespace FineUI.Pro.Examples.third_party.webuploader
{
    /// <summary>
    /// WebUploader 示例的上传入口（handler=Process）。
    ///
    /// 上传文件保存在 App_Data/upload（ASP.NET/IIS 内置受保护目录，直接 HTTP 访问返回 404），
    /// 浏览器够不到物理文件；读回走公共处理器 ~/common/Download.ashx（下载链接在页面脚本里
    /// 按行拼，不带 inline），强制 application/octet-stream + Content-Disposition: attachment，
    /// 所以传上来的 .html 等只会被下载，绝不会被当页面/脚本执行。
    ///
    /// 与头像/图片上传示例共用同一个上传目录，也共用同一个下载入口——上传目录、防重名改名都取自
    /// UploadStorage（与图片上传、下载入口同一份实现，不再各存一份）。
    /// 区别只在调用方要不要 inline：图片示例的 UploadStorage.GetImageUrl 带 inline=1（按 image/xxx 内联显示），
    /// 这里的下载链接不带（任意文件、恒下载）。
    ///
    /// handler 参数保留成一个固定值 Process：五个示例页的 SERVER_URL 都带着它，
    /// 下载搬走后它不再有分发作用，但去掉要改一批页面且没有实际收益。
    /// </summary>
    public class fileupload : IHttpHandler, IRequiresSessionState
    {

        private static readonly string WEBUPLOADER_FIXED_SESSION_NAME = "webuploader.webuploader_fixed";

        private void ResponseError(HttpContext context)
        {
            // 出错了
            context.Response.StatusCode = 500;
            context.Response.Write("No file");
        }

        public void ProcessRequest(HttpContext context)
        {
            // 本处理器只接受上传（POST），没有可浏览的内容。不挡这一下的话，任何 GET
            // （包括指向旧下载地址的历史链接）都会落进下面的上传流程、因为没有文件而变成 500。
            if (context.Request.HttpMethod != "POST")
            {
                context.Response.StatusCode = 404;
                context.Response.ContentType = "text/plain";
                return;
            }

            context.Response.ContentType = "text/plain";

            string owner = context.Request.Form["owner"];

            if (context.Request.Files.Count == 0)
            {
                ResponseError(context);
                return;
            }

            if (String.IsNullOrEmpty(owner))
            {
                ResponseError(context);
                return;
            }

            // owner 直接来自请求表单、下面会被当会话键用。不校验的话客户端能写任意会话键
            // （值是服务端造的 JArray，塞不进恶意内容，但能把别的页的会话值覆盖掉、让那页下次强转失败）。
            if (!owner.StartsWith(WebUploaderStore.OWNER_PREFIX))
            {
                ResponseError(context);
                return;
            }

            // 固定槽的 owner 必须形如「webuploader.webuploader_fixed#行标识」（客户端 initUploader 拼的）。
            // 只带前缀不带 #行标识时既不是固定槽上传、也不该当普通上传落进那个键——那会给只认自己
            // 播种槽的固定页凭空多出一条记录。挡在这里而不是等分派完：晚了文件已经落盘，留下孤儿文件。
            if (owner.StartsWith(WEBUPLOADER_FIXED_SESSION_NAME)
                && !owner.StartsWith(WEBUPLOADER_FIXED_SESSION_NAME + "#"))
            {
                ResponseError(context);
                return;
            }

            HttpPostedFile postedFile = context.Request.Files[0];
            // 文件名完整路径
            string fileName = postedFile.FileName;
            // 文件名保存的服务器路径
            string savedFileName = UploadStorage.BuildUploadFileName(fileName);
            string savePath = UploadStorage.GetUploadFilePath(savedFileName);
            Directory.CreateDirectory(Path.GetDirectoryName(savePath));
            postedFile.SaveAs(savePath);

            string shortFileName = GetFileName(fileName);
            string fileType = GetFileType(fileName);
            int fileSize = postedFile.ContentLength;

            // 固定槽的 owner 形如「webuploader.webuploader_fixed#行标识」（客户端 initUploader 拼的）。
            // 必须带 # 才算：只判前缀的话，owner 恰好等于前缀本身时下面的 Substring 会越界。
            string fixedPrefix = WEBUPLOADER_FIXED_SESSION_NAME + "#";
            if (owner.StartsWith(fixedPrefix))
            {
                // 固定文件上传页面专用
                string fileId = owner.Substring(fixedPrefix.Length);

                // 会话清单可能还没初始化（比如先调上传端点、没打开过页面），此时按「找不到该行」处理
                JArray source = context.Session[WEBUPLOADER_FIXED_SESSION_NAME] as JArray;
                JObject file = source == null ? null : GetFileObject(source, fileId);
                if (file == null)
                {
                    ResponseError(context);
                    return;
                }

                file["name"] = shortFileName;
                file["type"] = fileType;
                file["savedName"] = savedFileName;
                file["size"] = fileSize;
                file["status"] = "uploaded";

                context.Response.Write("Success");
            }
            else
            {
                JObject fileObj = new JObject();
                string fileId = Guid.NewGuid().ToString();

                fileObj.Add("name", shortFileName);
                fileObj.Add("type", fileType);
                fileObj.Add("savedName", savedFileName);
                fileObj.Add("size", fileSize);
                fileObj.Add("id", fileId);

                fileObj.Add("status", "uploaded");

                SaveToDatabase(context, owner, fileObj);

                context.Response.Write("Success");
            }

        }

        private JObject GetFileObject(JArray source, string fileId)
        {
            for (int i = 0, count = source.Count; i < count; i++)
            {
                JObject item = source[i] as JObject;

                if (item.Value<string>("id") == fileId)
                {
                    return item;
                }
            }
            return null;
        }


        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private void SaveToDatabase(HttpContext context, string sessionName, JObject fileObj)
        {
            if (context.Session[sessionName] == null)
            {
                context.Session[sessionName] = new JArray();
            }

            JArray source = context.Session[sessionName] as JArray;
            source.Add(fileObj);

            context.Session[sessionName] = source;
        }


        private string GetFileType(string fileName)
        {
            string fileType = String.Empty;
            int lastDotIndex = fileName.LastIndexOf(".");
            if (lastDotIndex >= 0)
            {
                fileType = fileName.Substring(lastDotIndex + 1).ToLower();
            }

            return fileType;
        }

        private string GetFileName(string fileName)
        {
            string shortFileName = fileName;
            int lastSlashIndex = shortFileName.LastIndexOf("\\");
            if (lastSlashIndex >= 0)
            {
                shortFileName = shortFileName.Substring(lastSlashIndex + 1);
            }

            return shortFileName;
        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
