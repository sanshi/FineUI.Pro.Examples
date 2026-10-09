using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_changeconfirm_beforeunload : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 说明文字内含图片链接，在服务端补全应用地址，避免在控件属性中写入 ASPX 表达式。
                Label2.Text = String.Format(Label2.Text, PageContext.ResolveUrl("~/res/images/formchangeconfirm.png"));


            }


        }


        protected void btnClosePostBack_Click(object sender, EventArgs e)
        {
            ShowNotify("表单提交成功！");

            // 保存数据后，清空面板内表单字段的改变状态
            SimpleForm1.ClearDirty();
        }
    }
}
