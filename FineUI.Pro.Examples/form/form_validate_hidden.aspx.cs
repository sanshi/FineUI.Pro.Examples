using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.form
{
    public partial class form_validate_hidden : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        
        private static readonly int MAX_FAIL_COUNT = 3;

        #region LoginFailCount

        private int GetLoginFailCount()
        {
            object count = Session["LoginFailCount"];
            if (count == null)
            {
                count = Session["LoginFailCount"] = 0;
            }

            return Convert.ToInt32(count);
        }

        private void PlusLoginFailCount()
        {
            int count = GetLoginFailCount();

            Session["LoginFailCount"] = count + 1;
        }

        private void ClearLoginFailCount()
        {
            Session["LoginFailCount"] = 0;
        } 

        #endregion

        private void LoadData()
        {
            if (GetLoginFailCount() >= MAX_FAIL_COUNT)
            {
                panelCaptcha.Hidden = false;
                InitCaptchaCode();
            }
            else
            {
                panelCaptcha.Hidden = true;
            }
        }

        /// <summary>
        /// 初始化验证码
        /// </summary>
        private void InitCaptchaCode()
        {
            // 创建一个 6 位的随机数并保存在 Session 对象中
            Session["CaptchaImageText"] = GenerateRandomCode();

            imgCaptcha.Text = String.Format("<img src=\"{0}\" />", PageContext.ResolveUrl("~/basic/captcha/captcha.ashx?w=100&h=26&t=" + DateTime.Now.Ticks));
        }

        /// <summary>
        /// 创建一个 6 位的随机数
        /// </summary>
        /// <returns></returns>
        private string GenerateRandomCode()
        {
            string s = String.Empty;
            Random random = new Random();
            for (int i = 0; i < 6; i++)
            {
                s += random.Next(10).ToString();
            }
            return s;
        }

        protected void imgCaptcha_Click(object sender, EventArgs e)
        {
            InitCaptchaCode();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Session数据判断是否应该验证码
            int failCount = GetLoginFailCount();
            if (failCount >= MAX_FAIL_COUNT)
            {
                if (tbxCaptcha.Text != Session["CaptchaImageText"].ToString())
                {
                    ShowNotify("验证码错误！");
                    return;
                }
            }

            if (tbxUserName.Text == "admin" && tbxPassword.Text == "admin")
            {
                ClearLoginFailCount();
                LoadData();
                ShowNotify("成功登录！");
            }
            else
            {
                PlusLoginFailCount();
                LoadData();
                ShowNotify(String.Format("用户名或密码错误！ - （第 {0} 次）", failCount + 1), MessageBoxIcon.Error);
            }
        }

    }
}
