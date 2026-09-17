using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;

using FineUI.Pro;
using AspNet = System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;

namespace FineUI.Pro.Examples
{
    public class PageBase : System.Web.UI.Page
    {
        #region HtmlEncode / EncodeJson

        /// <summary>
        /// HTML 编码：把用户输入/可控数据安全地输出到页面，防止 XSS。
        /// </summary>
        protected string HtmlEncode(string text)
        {
            return HttpUtility.HtmlEncode(text);
        }

        /// <summary>
        /// 将 JSON 数据（如 Grid 的 ModifiedData/FilteredData/MergedData）格式化为缩进字符串并 HTML 编码，
        /// 安全输出到页面。典型用法：String.Format("用户修改的数据：<pre>{0}</pre>", EncodeJson(Grid1.GetModifiedData()))
        /// </summary>
        protected string EncodeJson(Newtonsoft.Json.Linq.JToken data)
        {
            return HtmlEncode(data == null ? "" : data.ToString(Newtonsoft.Json.Formatting.Indented));
        }

        /// <summary>
        /// 将任意对象序列化为缩进 JSON 字符串并 HTML 编码，安全输出到页面。
        /// 典型用法：String.Format("用户提交的数据：<pre>{0}</pre>", EncodeJson(TheModel))
        /// </summary>
        protected string EncodeJson(object data)
        {
            return HtmlEncode(Newtonsoft.Json.JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented));
        }

        #endregion

        #region OnInit

        private bool IsSystemTheme(string themeName)
        {
            themeName = themeName.ToLower();
            string[] themes = Enum.GetNames(typeof(Theme));
            foreach (string theme in themes)
            {
                if (theme.ToLower() == themeName)
                {
                    return true;
                }
            }
            return false;
        }

        protected override void OnInit(EventArgs e)
        {
            var pm = PageManager.Instance;
            if (pm != null)
            {
                HttpCookie themeCookie = Request.Cookies["Theme"];
                if (themeCookie != null)
                {
                    string themeValue = themeCookie.Value;

                    // 是否为内置主题
                    if (IsSystemTheme(themeValue))
                    {
                        pm.CustomTheme = String.Empty;
                        pm.Theme = (Theme)Enum.Parse(typeof(Theme), themeValue, true);
                    }
                    else
                    {
                        pm.CustomTheme = themeValue;
                    }
                }

                HttpCookie langCookie = Request.Cookies["Language"];
                if (langCookie != null)
                {
                    string langValue = langCookie.Value;
                    try
                    {
                        // 是否为内置语言
                        pm.Language = (Language)Enum.Parse(typeof(Language), langValue, true);
                    }
                    catch (Exception)
                    {
                        pm.CustomLanguage = langValue;
                    }
                }

                // 1. 仅显示社区版示例， 2. 社区版 
                // 上述两种情况都要禁用EnableAnimation、MobileAdaption
                bool showOnlyCommunity = false;
                HttpCookie menuShowOnlyCommunity = Request.Cookies["ShowOnlyCommunity"];
                if (menuShowOnlyCommunity != null)
                {
                    showOnlyCommunity = Convert.ToBoolean(menuShowOnlyCommunity.Value);
                }

                if (showOnlyCommunity || Constants.IS_COMMUNITY_EDITION)
                {
                    pm.EnableAnimation = false;
                    pm.MobileAdaption = false;
                }

                HttpCookie modeCookie = Request.Cookies["DisplayMode"];
                if (modeCookie != null)
                {
                    string modeValue = modeCookie.Value;
                    try
                    {
                        pm.DisplayMode = (DisplayMode)Enum.Parse(typeof(DisplayMode), modeValue, true);
                    }
                    catch (Exception)
                    {
                        pm.DisplayMode = DisplayMode.Normal;
                    }
                }

                // GIF加载动画
                HttpCookie loadingCookie = Request.Cookies["Loading"];
                if (loadingCookie != null)
                {
                    int loadingNumber = Convert.ToInt32(loadingCookie.Value);
                    pm.LoadingImageNumber = loadingNumber;
                    // 使用GIF加载动画时，需要先禁用页面加载动画（CSS）
                    pm.LoadingCSSNumber = 0;
                }
                // 优先使用页面加载动画（CSS）
                HttpCookie loadingCSSCookie = Request.Cookies["Loading_CSS"];
                if (loadingCSSCookie != null)
                {
                    int LoadingCSSNumber = Convert.ToInt32(loadingCSSCookie.Value);
                    pm.LoadingCSSNumber = LoadingCSSNumber;
                }

                // 为所有页面添加公共CSS：<link rel="stylesheet" type="text/css" href="res/css/common.css" />
                Literal commonCSSLink = new Literal();
                commonCSSLink.Text = String.Format("<link href=\"{0}\" rel=\"stylesheet\" type=\"text/css\"/>", PageContext.ResolveUrl("~/res/css/common.css?v" + GlobalConfig.ProductVersion));
                var styleCSSIndex = GetHeadStyleCSSIndex();
                if (styleCSSIndex >= 0)
                {
                    Page.Header.Controls.AddAt(styleCSSIndex, commonCSSLink);
                }
                else
                {
                    Page.Header.Controls.Add(commonCSSLink);
                }

                // 为所有页面添加公共JS：<script type="text/css" href="res/js/common.js"></script>
                var commonJSPath = String.Format("<script type=\"text/javascript\" src=\"{0}\"></script>", PageContext.ResolveUrl("~/res/js/common.js?v" + GlobalConfig.ProductVersion));
                PageContext.RegisterPostStartupScript("FineUIPro_Examples_common_js", commonJSPath, false);

                //var jqueryMigrateJSPath = String.Format("<script type=\"text/javascript\" src=\"{0}\"></script>", ResolveClientUrl("~/res/js/jquery-migrate-3.0.1.js?v" + GlobalConfig.ProductVersion));
                //PageContext.RegisterPreStartupScript("FineUIPro_Examples_jquery-migrate_js", jqueryMigrateJSPath, false);

            }

            base.OnInit(e);
        }

        /// <summary>
        /// 初始化多语言资源
        /// </summary>
        protected override void InitializeCulture()
        {
            // https://learn.microsoft.com/en-us/previous-versions/aspnet/bz9tc508(v=vs.100)
            HttpCookie langCookie = Request.Cookies["Language"];
            // 默认为中文
            var langName = "zh-CN";
            if (langCookie != null)
            {
                // 简单的转换：zh_CN -> zh-CN
                langName = langCookie.Value.Replace("_", "-");
                if (langName == "en")
                {
                    langName = "en-US";
                }
            }
            // 设置语言
            var cultureInfo = CultureInfo.CreateSpecificCulture(langName);
            Thread.CurrentThread.CurrentCulture = cultureInfo;
            Thread.CurrentThread.CurrentUICulture = cultureInfo;

            base.InitializeCulture();
        }

        private int GetHeadStyleCSSIndex()
        {
            var theIndex = -1;
            for (var i = 0; i < Header.Controls.Count; i++)
            {
                var ctrl = Header.Controls[i];
                if (ctrl is LiteralControl)
                {
                    if ((ctrl as LiteralControl).Text.Trim().ToLower().StartsWith("<style"))
                    {
                        theIndex = i;
                        break;
                    }
                }
                else if (ctrl is System.Web.UI.HtmlControls.HtmlLink)
                {
                    var theCtrl = ctrl as System.Web.UI.HtmlControls.HtmlLink;
                    if (theCtrl.TagName == "link")
                    {
                        var typeAttr = theCtrl.Attributes["type"];
                        var relAttr = theCtrl.Attributes["rel"];
                        if ((typeAttr != null && typeAttr.ToLower() == "text/css")
                            || (relAttr != null && relAttr.ToLower() == "stylesheet"))
                        {
                            theIndex = i;
                            break;
                        }
                    }
                }
            }
            return theIndex;
        }

        #endregion

        #region ASPX 数据绑定中调用的格式化函数

        /// <param name="gender"></param>
        /// <returns></returns>
        protected string GetGender(object gender)
        {
            if (Convert.ToInt32(gender) == 1)
            {
                return Resources.SharedResources.Male; //"男";
            }
            else
            {
                return Resources.SharedResources.Female; //"女";
            }
        }

        #endregion

        #region 实用函数

        /// <summary>
        /// 显示通知对话框
        /// </summary>
        /// <param name="message"></param>
        public virtual void ShowNotify(string message)
        {
            ShowNotify(message, MessageBoxIcon.Information);
        }

        /// <summary>
        /// 显示通知对话框（普通文本，HTML 转义）
        /// </summary>
        /// <param name="message"></param>
        /// <param name="messageIcon"></param>
        public virtual void ShowNotify(string message, MessageBoxIcon messageIcon)
        {
            Notify n = CreateNotify(messageIcon);
            n.Message = message;
            n.Show();
        }

        /// <summary>
        /// 显示通知对话框（可信 HTML，原样输出不转义）
        /// </summary>
        /// <param name="message"></param>
        public virtual void ShowNotify(RawHtml message)
        {
            ShowNotify(message, MessageBoxIcon.Information);
        }

        /// <summary>
        /// 显示通知对话框（可信 HTML，原样输出不转义）
        /// </summary>
        /// <param name="message"></param>
        /// <param name="messageIcon"></param>
        public virtual void ShowNotify(RawHtml message, MessageBoxIcon messageIcon)
        {
            Notify n = CreateNotify(messageIcon);
            n.MessageRawHtml = message;
            n.Show();
        }

        // 构建统一配置的通知框（消息由调用方分别按普通文本 / 可信 HTML 设置）
        private Notify CreateNotify(MessageBoxIcon messageIcon)
        {
            Notify n = new Notify();
            n.Target = Target.Top;
            n.MessageBoxIcon = messageIcon;
            n.PositionX = Position.Center;
            n.PositionY = Position.Top;
            n.DisplayMilliseconds = 3000;
            n.ShowHeader = false;

            return n;
        }

        #endregion

        #region 表格的网址数据源

        private JArray _cachedSelectedRowData;

        /// <summary>
        /// 获取选中的行数据（来自于客户端）
        /// </summary>
        /// <param name="paramRowId"></param>
        /// <returns></returns>
        protected JObject GetDataUrlSelectedRowValue(string paramRowId)
        {
            if (_cachedSelectedRowData == null)
            {
                _cachedSelectedRowData = JArray.Parse(Request.Form["DataUrl_Grid_SelectedRowData"]);
            }

            foreach (JObject row in _cachedSelectedRowData)
            {
                string rowId = row.Value<string>("id");

                if (rowId == paramRowId)
                {
                    return row.Value<JObject>("values");
                }
            }

            return null;
        }

        #endregion

        #region 表格数据行的增删改

        /// <summary>
        /// 把一个单元格的新值写进数据行（单元格编辑保存时使用）
        /// </summary>
        /// <param name="columnName">列名</param>
        /// <param name="rowDict">本行改动过的单元格（键是列名）</param>
        /// <param name="rowData">要更新的数据行</param>
        protected void UpdateDataRow(string columnName, Dictionary<string, object> rowDict, DataRow rowData)
        {
            if (rowDict.ContainsKey(columnName))
            {
                object value = rowDict[columnName];

                // 客户端把清空的单元格发成空字符串；列不是字符串类型时直接写会抛异常，存 DBNull 表示空值
                if ("".Equals(value) && rowData.Table.Columns[columnName].DataType != typeof(string))
                {
                    rowData[columnName] = DBNull.Value;
                }
                else
                {
                    rowData[columnName] = value;
                }
            }
        }

        /// <summary>
        /// 按行标识在数据表里找到对应的数据行，找不到返回 null
        /// </summary>
        protected DataRow FindRowByID(DataTable table, int rowId)
        {
            foreach (DataRow row in table.Rows)
            {
                if (Convert.ToInt32(row["Id"]) == rowId)
                {
                    return row;
                }
            }
            return null;
        }

        /// <summary>
        /// 按行标识删除数据表里的一行（找不到就什么也不做）
        /// </summary>
        protected void DeleteRowByID(DataTable table, int rowID)
        {
            DataRow found = FindRowByID(table, rowID);
            if (found != null)
            {
                table.Rows.Remove(found);
            }
        }

        /// <summary>
        /// 取下一个可用的行标识（模拟数据库的自增长列：当前最大值 + 1）
        /// </summary>
        protected int GetNextRowID(DataTable table)
        {
            int maxID = 0;
            foreach (DataRow row in table.Rows)
            {
                int currentRowID = Convert.ToInt32(row["Id"]);
                if (currentRowID > maxID)
                {
                    maxID = currentRowID;
                }
            }
            return maxID + 1;
        }

        #endregion

    }

}
