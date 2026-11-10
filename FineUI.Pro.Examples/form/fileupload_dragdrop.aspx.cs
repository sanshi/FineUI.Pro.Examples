using System;
using System.Collections.Generic;
using System.Linq;

namespace FineUI.Pro.Examples.form
{
    public partial class fileupload_dragdrop : UploadPageBase
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var results = new List<string>();
            foreach (var file in filePhoto.PostedFiles.Concat(filePhotos.PostedFiles))
            {
                string error;
                results.Add(ValidateUploadFile(file, out error) ? file.FileName : file.FileName + "（" + error + "）");
            }

            labResult.Text = results.Count == 0 ? "请选择图片。" : "服务器收到：" + string.Join("、", results.ToArray());
            SimpleForm1.Reset();
        }
    }
}
