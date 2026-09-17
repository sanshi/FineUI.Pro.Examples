using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class fileupload_tool : UploadPageBase
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
                imgPhoto.ImageUrl = GetImageUrl(savedName);

                // 清空上传控件（清空上传控件，否则提交表单时会再次上传！）
                filePhoto.Reset();
            }

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (imgPhoto.ImageUrl.EndsWith("blank.png"))
            {
                filePhoto.MarkInvalid("请先上传个人头像！");

                ShowNotify("请先上传个人头像！");

                return;
            }

            labResult.Text = "用户名：" + tbxUserName.Text + "<br/>" +
                    "邮箱：" + tbxEmail.Text + "<br/>" +
                    "<p>头像：<br /><img src=\"" + PageContext.ResolveUrl(imgPhoto.ImageUrl) + "\" /></p>";

            // 清空表单字段（清空上传控件，否则提交表单时会再次上传！）
            imgPhoto.ImageUrl = "~/res/images/blank.png";
            filePhoto.Reset();
            tbxEmail.Reset();
            tbxUserName.Reset();

        }

    }
}