using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Xml;
using System.IO;
using System.Reflection;

namespace FineUI.Pro.Examples.toolbar
{
    public partial class toolbar_icontop : UploadPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void filePhoto_FileSelected(object sender, EventArgs e)
        {
            if (filePhoto.HasFile)
            {
                string fileName = filePhoto.ShortFileName;

                // 校验：扩展名白名单 + 文件大小
                if (!ValidateUploadFile(filePhoto, out string error))
                {
                    // 清空上传控件（清空上传控件，否则提交表单时会再次上传！）
                    filePhoto.Reset();

                    ShowNotify(error);
                    return;
                }


                // 保存到不可直接访问的目录，图片地址指向公共处理器（~/common/Download.ashx，带 inline=1 内联显示）
                string savedName = SaveUploadFile(filePhoto);
                (Panel1.FindControl("imgPhoto") as Image).ImageUrl = GetImageUrl(savedName);

                // 清空上传控件（清空上传控件，否则提交表单时会再次上传！）
                filePhoto.Reset();
            }

        }

    }
}
