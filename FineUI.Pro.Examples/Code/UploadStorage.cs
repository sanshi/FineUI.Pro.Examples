using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace FineUI.Pro.Examples
{
    /// <summary>
    /// 上传文件的存放与读回：白名单校验、防重名改名、保存到不可直接访问的目录、生成公共下载地址。
    /// 全是静态方法、不依赖页面上下文，所以页面、一般处理程序（.ashx）都能用同一份实现
    /// ——上传目录与图片扩展名白名单以前在页面基类和两个处理程序里各存一份，改一处漏两处的
    /// 症状是「能传上去、下载时却变成附件」，不报错也很难发现。
    /// </summary>
    public static class UploadStorage
    {
        /// <summary>
        /// 允许上传的文件扩展名白名单（小写、不含点）。
        /// </summary>
        public readonly static IReadOnlyList<string> VALID_FILE_TYPES = new List<string> { "jpg", "bmp", "gif", "jpeg", "png" };

        /// <summary>
        /// 允许上传的最大字节数（示例限制为 2MB）。
        /// </summary>
        public const long MAX_FILE_SIZE = 2 * 1024 * 1024;

        // 上传文件的保存目录：ASP.NET/IIS 内置受保护目录 App_Data（默认在 hiddenSegments 中，
        // 直接 HTTP 访问会返回 404），浏览器无法直接访问，上传 .html 等文件也不会被当页面/脚本执行。
        // 读回统一通过公共处理器 ~/common/Download.ashx（地址由 GetImageUrl / GetFileUrl 生成）。
        // 注意：.NET Framework 无 wwwroot，整个应用根目录都可 web 访问，故用 App_Data 作为不可直接访问区。
        // ⚠️ 图片上传与 WebUploader 上传共用这一个目录，而 WebUploader 不设扩展名白名单、也不限 2MB。
        //    也就是说，本目录里文件的可达性取决于**最宽松的那个入口**：图片上传的白名单 + 2MB
        //    实际上可以从 WebUploader 那条路绕过（传个大图进来，再用图片地址内联显示）。
        //    示例站上无所谓；照抄到生产系统时，两条上传路径的校验强度要按同一个标准定。
        public const string UPLOAD_DIR = "~/App_Data/upload/";

        /// <summary>
        /// 从文件名中提取小写扩展名（不含点）。无扩展名时返回空字符串。
        /// </summary>
        public static string GetFileExtension(string fileName)
        {
            if (String.IsNullOrEmpty(fileName))
            {
                return String.Empty;
            }
            int lastDotIndex = fileName.LastIndexOf('.');
            // 点在最后一位（如 "abc."）也视为无有效扩展名
            if (lastDotIndex < 0 || lastDotIndex == fileName.Length - 1)
            {
                return String.Empty;
            }
            // 用不变区域性：土耳其语等区域下 "GIF".ToLower() 会得到带点的 ı，
            // 白名单与 Content-Type 表都会因此匹配不上。
            return fileName.Substring(lastDotIndex + 1).ToLowerInvariant();
        }

        /// <summary>
        /// 校验一个上传文件：① 文件大小上限 ② 扩展名白名单。
        /// 任一项不通过即返回 false，并通过 error 输出具体原因（可直接用于 ShowNotify）。
        /// </summary>
        public static bool Validate(string fileName, long length, out string error)
        {
            error = String.Empty;

            if (length == 0)
            {
                error = "文件为空！";
                return false;
            }

            // ① 大小校验
            if (length > MAX_FILE_SIZE)
            {
                error = String.Format("文件过大，最大允许 {0} MB！", MAX_FILE_SIZE / 1024 / 1024);
                return false;
            }

            // ② 扩展名白名单
            if (!VALID_FILE_TYPES.Contains(GetFileExtension(fileName)))
            {
                error = "无效的文件类型！";
                return false;
            }

            return true;
        }

        /// <summary>
        /// 生成防重名的保存文件名（时间戳前缀 + 清理特殊字符）。
        /// </summary>
        public static string BuildUploadFileName(string originalName)
        {
            string fileName = (originalName ?? String.Empty).Replace(":", "_").Replace(" ", "_").Replace("\\", "_").Replace("/", "_");
            // 其余非法文件名字符（| < > " * ? 与控制字符）一并换掉：Windows 上直接拿它们
            // 建文件会抛异常，不清理的话上传一个名为 a|b.txt 的文件就是 500。
            foreach (char invalid in Path.GetInvalidFileNameChars())
            {
                fileName = fileName.Replace(invalid, '_');
            }
            return DateTime.Now.Ticks.ToString() + "_" + fileName;
        }

        /// <summary>
        /// 获取上传文件在服务端的物理路径。
        /// **入参必须是纯文件名**（不含目录分隔符）：这是个 public 方法，公共下载入口与上传端点都在调，
        /// 所以守卫放在这里，而不是靠每个调用方各自记得先净化。
        /// </summary>
        public static string GetUploadFilePath(string fileName)
        {
            if (String.IsNullOrEmpty(fileName) || Path.GetFileName(fileName) != fileName)
            {
                throw new ArgumentException("上传文件名必须是不含目录的纯文件名：" + fileName, "fileName");
            }
            return HostingEnvironment.MapPath(UPLOAD_DIR + fileName);
        }

        /// <summary>
        /// 把输入流保存到上传目录（自动创建目录），返回保存后的文件名。
        /// **本方法不做任何校验**：扩展名白名单与大小上限要调用方先用 Validate 把关
        /// WebUploader 场景有意不校验；它与普通上传共用目录，因此该目录中的文件实际受更宽松的
        /// WebUploader 入口约束，不能假定所有文件都经过扩展名白名单和大小检查。
        /// </summary>
        public static string Save(string originalName, Stream source)
        {
            string savedName = BuildUploadFileName(originalName);
            string savePath = GetUploadFilePath(savedName);
            Directory.CreateDirectory(Path.GetDirectoryName(savePath));
            using (var dest = new FileStream(savePath, FileMode.Create))
            {
                // HttpPostedFile.InputStream 是整个请求共享的一个流、可能已被读过，写盘前必须归零。
                // Core 侧不需要这一步：那边每次 OpenReadStream() 都是新流、位置恒为 0。
                source.Position = 0;
                source.CopyTo(dest);
            }
            return savedName;
        }

        // 允许内联显示的图片扩展名 → Content-Type（键集合与上传白名单 VALID_FILE_TYPES 一致）。
        // 用硬编码表而不是 IIS mime 映射：只有 5 项，一张表最省事也最可预测，五套示例的输出还能逐字对齐。
        private static readonly Dictionary<string, string> IMAGE_CONTENT_TYPES = new Dictionary<string, string>
        {
            { "jpg", "image/jpeg" },
            { "jpeg", "image/jpeg" },
            { "png", "image/png" },
            { "gif", "image/gif" },
            { "bmp", "image/bmp" },
        };

        /// <summary>
        /// 取图片的 Content-Type；不在白名单内返回 null（调用方据此降级为附件下载）。
        /// </summary>
        public static string GetImageContentType(string fileName)
        {
            string contentType;
            return IMAGE_CONTENT_TYPES.TryGetValue(GetFileExtension(fileName), out contentType) ? contentType : null;
        }

        /// <summary>
        /// 调用方是否要求内联显示。只认 1 / true 两个值，其余（含拼错的 no、off、空）一律当作
        /// 没要求——未知输入落到附件下载这一侧，是两个方向里安全的那个。
        /// 地址由 GetImageUrl 生成、恒为 inline=1。
        /// </summary>
        public static bool IsInlineRequested(string inline)
        {
            if (String.IsNullOrEmpty(inline))
            {
                return false;
            }
            string value = inline.ToLowerInvariant();
            return value == "1" || value == "true";
        }

        /// <summary>
        /// 获取上传图片的访问地址（指向公共处理器 ~/common/Download.ashx，带 inline=1 请求内联显示）。
        /// </summary>
        public static string GetImageUrl(string fileName)
        {
            return VirtualPathUtility.ToAbsolute("~/common/Download.ashx") + "?inline=1&file=" + HttpUtility.UrlEncode(fileName);
        }

        /// <summary>
        /// 获取上传文件的访问地址（同一个公共处理器，不带 inline，一律作为附件下载）。
        /// 供服务端代码生成下载链接时使用；WebUploader 示例的下载链接是在页面脚本里按行拼的
        /// （那时候文件名只在客户端有），拼法与本方法等价。
        /// </summary>
        public static string GetFileUrl(string fileName)
        {
            return VirtualPathUtility.ToAbsolute("~/common/Download.ashx") + "?file=" + HttpUtility.UrlEncode(fileName);
        }
    }
}
