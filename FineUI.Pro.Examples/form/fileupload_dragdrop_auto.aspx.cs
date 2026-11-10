using System;
using System.Linq;

namespace FineUI.Pro.Examples.form
{
    public partial class fileupload_dragdrop_auto : UploadPageBase
    {
        protected void filePhotos_FileSelected(object sender, EventArgs e)
        {
            var files = filePhotos.PostedFiles;
            // 先校验整批。例如第二张图片超过 2 MB 时保留两张图片，让用户重新选择。
            foreach (var file in files)
            {
                string error;
                if (!ValidateUploadFile(file, out error))
                {
                    filePhotos.MarkInvalid(file.FileName + "（" + error + "）");
                    return;
                }
            }

            labResult.Text = "服务器收到：" + string.Join("、", files.Select(file => file.FileName).ToArray());
            filePhotos.Reset();
        }
    }
}
