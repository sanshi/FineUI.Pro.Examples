using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_changeconfirm : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

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
