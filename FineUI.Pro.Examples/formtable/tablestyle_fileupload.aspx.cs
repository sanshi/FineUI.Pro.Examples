using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class tablestyle_fileupload : UploadPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 启用大字体模式
                if (PageManager1.EnableLargeMode ||
                    PageManager1.DisplayMode == DisplayMode.Large ||
                    PageManager1.DisplayMode == DisplayMode.LargeSpace)
                {
                    SimpleForm1.LabelWidth = (Unit)120;
                }
            }
        }

        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (filePhoto.HasFile)
            {
                string originalName = filePhoto.ShortFileName;

                // 校验：扩展名白名单 + 文件大小
                if (!ValidateUploadFile(filePhoto, out string error))
                {
                    ShowNotify(error);
                    return;
                }

                // 保存到不可直接访问的目录，图片地址指向公共处理器（~/common/Download.ashx，带 inline=1 内联显示）
                string savedName = SaveUploadFile(filePhoto);

                labResult.Text = "<p>文件路径：" + HtmlEncode(originalName) + "</p>" +
                    "<p>用户名：" + tbxUserName.Text + "</p>" +
                    "<p>头像：<br /><img src=\"" + GetImageUrl(savedName) + "\" /></p>";

                //// 清空表单字段（第一种方法）
                //tbxUserName.Reset();
                //filePhoto.Reset();

                // 清空表单字段（清空上传控件，否则提交表单时会再次上传！）
                SimpleForm1.Reset();

            }
        }

    }
}