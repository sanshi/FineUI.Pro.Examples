using System;
using System.Collections.Generic;
using System.Web;

namespace FineUI.Pro.Examples.form
{
    public partial class fileupload_dragdrop : UploadPageBase
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            labPhotoResult.Text = "单张图片：" + FormatUploadedFiles(filePhoto.PostedFiles);
            labPhotosResult.Text = "多张图片：" + FormatUploadedFiles(filePhotos.PostedFiles);
            SimpleForm1.Reset();
        }

        private static string FormatUploadedFiles(IEnumerable<HttpPostedFile> files)
        {
            var results = new List<string>();
            foreach (var file in files)
            {
                string error;
                results.Add(ValidateUploadFile(file, out error) ? file.FileName : file.FileName + "（" + error + "）");
            }

            return results.Count == 0 ? "未选择文件" : string.Join("、", results.ToArray());
        }
    }
}
