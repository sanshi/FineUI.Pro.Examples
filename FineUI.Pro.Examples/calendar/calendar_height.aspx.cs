using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_height : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.MinDate = DateTime.Now;
                Calendar1.MaxDate = DateTime.Now.AddDays(20);
                Calendar1.SelectedDate = DateTime.Now.AddDays(10);

                Button1.Text = String.Format("选中{0}", DateTime.Now.AddDays(2).ToString(Calendar1.DateFormatString));
            }
        }

        private void UpdateResult()
        {
            Alert.Show(String.Format("选择的日期：{0}", Calendar1.SelectedDate.Value.ToString(Calendar1.DateFormatString)));
        }

        protected void Calendar1_DateSelect(object sender, EventArgs e)
        {
            UpdateResult();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Calendar1.SelectedDate = DateTime.Now.AddDays(2);

            // 即使客户端翻到其他月份，也能回到当前设置的日期
            string selectedDateStr = DateTime.Now.AddDays(2).ToString(Calendar1.DateFormatString);
            PageContext.RegisterStartupScript(String.Format("F('{0}').setValue('{1}');", Calendar1.ClientID, selectedDateStr));
        }
    }
}
