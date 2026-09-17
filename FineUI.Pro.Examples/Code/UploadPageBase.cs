using System;
using System.Web;

namespace FineUI.Pro.Examples
{
    /// <summary>
    /// 含文件上传的示例页基类：在 <see cref="PageBase"/> 之上补「安全上传」便捷方法
    /// （校验、保存到不可直接访问的目录、生成公共下载地址），供上传类示例页复用。
    /// 具体实现都在 <see cref="UploadStorage"/> 里，本类只是页面侧的门面。
    /// </summary>
    public class UploadPageBase : PageBase
    {
        /// <summary>
        /// 对上传文件做校验：扩展名白名单 + 文件大小上限。
        /// 任一项不通过即返回 false，并通过 error 输出具体原因（可直接用于 ShowNotify）。
        /// </summary>
        protected static bool ValidateUploadFile(HttpPostedFile file, out string error)
        {
            if (file == null)
            {
                error = "文件为空！";
                return false;
            }
            return UploadStorage.Validate(file.FileName, file.ContentLength, out error);
        }

        /// <summary>
        /// 对 FineUI 上传控件中的文件做校验（单文件场景的便捷重载）。
        /// </summary>
        protected static bool ValidateUploadFile(FineUI.Pro.FileUpload fileUpload, out string error)
        {
            if (fileUpload == null || !fileUpload.HasFile)
            {
                error = "文件为空！";
                return false;
            }
            return ValidateUploadFile(fileUpload.PostedFile, out error);
        }

        /// <summary>
        /// 保存 FineUI 上传控件中的文件到上传目录，返回保存后的文件名。
        /// </summary>
        protected static string SaveUploadFile(FineUI.Pro.FileUpload fileUpload)
        {
            return UploadStorage.Save(fileUpload.ShortFileName, fileUpload.PostedFile.InputStream);
        }

        /// <summary>
        /// 保存 HttpPostedFile（多文件场景）到上传目录，返回保存后的文件名。
        /// </summary>
        protected static string SaveUploadFile(HttpPostedFile file)
        {
            return UploadStorage.Save(file.FileName, file.InputStream);
        }

        /// <summary>
        /// 获取上传图片的访问地址（带 inline=1 请求内联显示）。
        /// </summary>
        protected static string GetImageUrl(string fileName)
        {
            return UploadStorage.GetImageUrl(fileName);
        }

        /// <summary>
        /// 获取上传文件的访问地址（不带 inline，一律作为附件下载）。
        /// </summary>
        protected static string GetFileUrl(string fileName)
        {
            return UploadStorage.GetFileUrl(fileName);
        }
    }
}
