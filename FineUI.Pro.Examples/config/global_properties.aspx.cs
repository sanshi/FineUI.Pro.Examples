using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace FineUI.Pro.Examples.config
{
    public partial class global_properties : PageBase
    {
        // 从空配置实例取初始值。例如示例站关闭了隐式回发，此处仍显示框架默认值 true。
        protected static readonly string CatalogJson = BuildCatalog();

        private static string BuildCatalog()
        {
            var defaults = new ConfigSection();
            var rows = new List<object>();
            string category;

            void Add(string name, string description, string options = null, object example = null, string note = null)
            {
                var property = typeof(ConfigSection).GetProperty(name);
                var initialValue = property.GetValue(defaults, null);
                var type = property.PropertyType;
                var valueType = "字符串";
                if (type == typeof(bool))
                {
                    valueType = "布尔值";
                }
                else if (type == typeof(int))
                {
                    valueType = "整数";
                }
                else if (type == typeof(string[]))
                {
                    valueType = "字符串数组";
                }

                rows.Add(new {
                    category, name, description, valueType, initialValue,
                    options = options ?? "true、false", example = example ?? initialValue, note,
                    obsolete = category == "已废弃配置"
                });
            }

            category = "主题与显示";
            Add("Theme", "选择页面使用的内置主题。",
                "Pure_Black、Pure_Blue、Pure_Green、Pure_Orange、Pure_Purple、Cupertino、Start、Dark_Hive、Flick、South_Street",
                example: "Pure_Blue",
                note: "设置 CustomTheme 后优先加载自定义主题。");
            Add("DisplayMode", "调整控件的字号和间距。",
                "Normal（标准）、Compact（紧凑）、Small（小字）、Large（大字）、LargeSpace（大间距）",
                example: "Large");
            Add("Language", "选择控件提示、按钮和分页栏使用的内置语言。",
                "zh_CN（简体中文）、zh_TW（繁体中文）、en（英语）",
                example: "en");
            Add("MobileAdaption", "为移动浏览器输出视口设置，让页面按设备宽度显示。",
                example: true);
            Add("EnableAnimation", "启用支持动画的控件过渡效果。",
                example: true);
            Add("TabStripAnimationType", "选择切换选项卡时的动画。",
                "SlideX（水平滑动）、SlideY（垂直滑动）、Fade（淡出）、Pop（弹出）、Flip（翻转）",
                example: "Fade",
                note: "配合 EnableAnimation 使用。Undefined 表示未指定动画类型。");
            Add("CustomScrollbar", "在支持的桌面浏览器中使用自定义滚动条样式。",
                example: true);
            Add("EnableDefaultCorner", "使用主题定义的控件圆角。",
                example: false);

            category = "应用与资源";
            Add("DebugMode", "在首次渲染时美化控件配置中的对象、数组和函数脚本，方便调试。",
                example: true);
            Add("BaseUrl", "指定解析应用相对地址时使用的根路径。",
                "应用根路径，例如 /portal/",
                example: "/portal/",
                note: "留空时使用当前 Web 应用的根路径，例如 /portal/。");
            Add("ContentUTF8", "在 HTML 页头声明 UTF-8 字符编码。",
                example: true);
            Add("JSLibrary", "选择是否随 FineUI 脚本一起加载 jQuery。",
                "All（内含 jQuery）、NoJQ（自行引入 jQuery）",
                example: "NoJQ",
                note: "选择 NoJQ 时须先加载 jQuery。旧枚举 JQv1 已废弃，当前使用与 All 相同的脚本。");
            Add("IconBasePath", "指定内置图标名称对应的图片根目录。",
                "图标目录路径",
                example: "~/res/icon/");
            Add("CustomTheme", "使用指定名称的自定义主题。",
                "主题目录名，例如 custom_default",
                example: "custom_default",
                note: "从 CustomThemeBasePath 下的同名目录加载 theme.css。留空时使用 Theme。");
            Add("CustomThemeBasePath", "指定存放自定义主题的根目录。",
                "主题根目录路径",
                example: "~/res/themes/");
            Add("CustomLanguage", "加载自定义语言脚本，覆盖内置语言资源选择。",
                "语言脚本的文件名，无需 .js 后缀",
                example: "my_language",
                note: "例如 my_language 对应 CustomLanguageBasePath 下的 my_language.js。");
            Add("CustomLanguageBasePath", "指定存放自定义语言脚本的根目录。",
                "语言文件目录路径",
                example: "~/res/languages/");
            Add("ServerIP", "指定企业版服务器授权优先使用的本机 IP 地址。",
                "本机有效的非回环 IP 地址，或空字符串",
                example: "10.200.16.116",
                note: "留空时由框架自动选择。填写地址时应使用服务器的非回环 IP。");
            Add("MAC2", "企业版服务器授权使用备用方法读取网卡 MAC 地址。",
                example: false);

            category = "表单与布局";
            Add("FormLabelAlign", "设置表单字段标签的位置。",
                "Left（左对齐）、Right（右对齐）、Top（位于上方）",
                example: "Right");
            Add("FormLabelWidth", "设置表单字段标签的宽度。",
                "整数，单位为像素",
                example: 120);
            Add("FormLabelSeparator", "设置字段标签文字与输入区域之间的分隔文本。",
                "字符串，可留空",
                example: "：");
            Add("FormRedStarPosition", "设置必填字段红色星号的位置。",
                "AfterText（文字后）、BeforeText（文字前）、AfterSeparator（分隔符后）",
                example: "BeforeText");
            Add("FormMessageTarget", "选择字段校验失败时显示提示的位置。",
                "Side（右侧图标）、Qtip（浮动提示）、Title（浏览器提示）、None（隐藏提示）",
                example: "Qtip",
                note: "Under 是保留枚举值，当前未实现字段下方提示。");
            Add("FormOffsetRight", "设置表单字段右侧预留的宽度。",
                "整数，单位为像素",
                example: 8);
            Add("FormRowItemSpace", "设置同一表单行中相邻控件的间距。",
                "整数，单位为像素",
                example: 12);
            Add("ToolbarItemSpace", "设置工具栏中相邻项目的间距。",
                "整数，单位为像素",
                example: 12);
            Add("TabStripTabSpace", "设置相邻选项卡标题之间的间距。",
                "整数，单位为像素",
                example: 8);
            Add("FormDotSeparator", "设置数字输入框在浏览器中显示的小数分隔符。",
                "分隔字符，例如 . 或 ,",
                example: ",",
                note: "数字输入框默认以点号（.）分隔整数和小数。");
            Add("FormCommaSeparator", "设置数字输入框在浏览器中显示的千分位分隔符。",
                "分隔字符，例如逗号或空格",
                example: " ",
                note: "数字输入框默认以逗号（,）分隔千分位。");
            Add("NumberBoxNoWheel", "禁止用鼠标滚轮改变数字输入框的值。",
                example: true);
            Add("EnableFormChangeConfirm", "在离开已修改的表单时请求确认，避免丢失输入。",
                example: true);
            Add("MessageBoxDisplayProgress", "显示通知对话框（Notify）自动关闭前的倒计时进度条。",
                example: false);

            category = "回发与加载提示";
            Add("AjaxTimeout", "设置浏览器等待 AJAX 请求完成的超时时间。",
                "正整数，单位为秒；0 表示不设置超时",
                example: 60);
            Add("EnableAjaxLoading", "发起 AJAX 回发时显示加载提示。",
                example: true);
            Add("AjaxLoadingType", "选择 AJAX 回发期间的提示样式。",
                "Default（页面顶部提示）、Mask（页面遮罩）",
                example: "Mask");
            Add("AjaxLoadingText", "设置页面顶部 AJAX 加载提示的文字。",
                "提示文字，空字符串使用当前语言的加载提示",
                example: "正在查询…");
            Add("ShowAjaxLoadingMaskText", "使用 Mask 提示时，在遮罩上显示加载文字。",
                example: true);
            Add("AjaxLoadingMaskText", "设置 AJAX 加载遮罩上的文字。",
                "提示文字，空字符串使用当前语言的加载提示",
                example: "正在保存…",
                note: "AjaxLoadingType 为 Mask 且 ShowAjaxLoadingMaskText 为 true 时可见。");
            Add("SimpleError", "服务器返回带标题的 HTML 错误页时，用简短提示显示错误。",
                example: true);
            Add("EnableIFrameLoading", "加载内嵌页面（IFrame）时显示加载提示。",
                example: true);
            Add("LoadingCSSNumber", "选择页面加载时使用的 CSS 动画。",
                "1～6 对应内置 CSS 动画；0 仅用于兼容旧版 GIF 配置",
                example: 3);
            Add("EnableAjax", "允许控件事件使用 AJAX 局部回发。",
                example: true);
            Add("EnableImplicitPostBack", "允许未设置回发属性、也未注册后台事件的动作控件自动回发。",
                example: false,
                note: "设为 false 后按控件显式设置或已注册的事件决定是否回发。");
            Add("EnableImplicitChangeEvents", "在其他控件发起回发时，允许顺带触发字段的后台变更事件。",
                example: false,
                note: "设为 false 后，显式声明的变更回发仍生效。");

            category = "表格与分页";
            Add("GridColumnWidth", "设置未单独指定宽度的表格列宽。",
                "整数，单位为像素",
                example: 160);
            Add("GridMinColumnWidth", "设置表格列的默认最小宽度。",
                "整数，单位为像素",
                example: 48);
            Add("GridHeaderSortIconVisible", "为可排序的列始终显示表头排序图标。",
                example: true);
            Add("GridHeaderFilterIconVisible", "为可筛选的列始终显示表头筛选图标。",
                example: true);
            Add("GridPagingToolbarVisible", "在未启用分页时也显示表格底部工具栏。",
                example: false);
            Add("GridPagingType", "选择分页栏使用的翻页控件。",
                "Arrow、NumberBox、ArrowNumberBox、NumberButton、ArrowNumberButton",
                example: "Arrow",
                note: "Arrow 表示翻页箭头，NumberBox 是页码输入框，NumberButton 是页码按钮。组合名称同时显示两种控件。");
            Add("GridPagerAlignRight", "将分页按钮放在工具栏的右侧。",
                example: false);
            Add("GridPagerAutoSimpleMode", "分页栏宽度不足时自动切换为简洁分页。",
                example: true,
                note: "简洁分页显示上一页、当前页和总页数、下一页。");
            Add("GridShowPagingMessage", "在表格工具栏显示当前分页信息。",
                example: true);
            Add("GridShowSelectionMessage", "在表格工具栏显示选中行的信息。",
                example: true);
            Add("GridTextSelection", "允许用户选中并复制表格单元格中的文字。",
                example: true);
            Add("GridShowEmptyIconText", "表格没有数据且未配置 EmptyText 时，显示内置空状态图标和文字。",
                example: true);
            Add("GridShowTooltipWhenTruncated", "仅在单元格文本被截断时显示浮动提示。",
                example: true,
                note: "适用于使用 Qtip 提示的列。");
            Add("GridStoreDateAsString", "将日期列的客户端数据保存为格式化字符串。",
                example: true,
                note: "用于 FieldType 为 Date 的列。");
            Add("GridStrictColumnIDValidation", "在客户端发现重复列标识符时抛出异常。",
                example: true,
                note: "默认只警告；开启后发现重复 ColumnID 时抛出配置异常。");

            category = "内容与脚本安全";
            Add("EncodeText", "对控件的普通文本进行 HTML 编码。",
                example: true);
            Add("AllowDangerousRawTag", "兼容旧字符串中的 <raw> 标记，将标记内容作为原始内容处理。",
                example: false,
                note: "新页面可使用控件的 RawHtml 属性明确声明可信 HTML。");
            Add("AllowDangerousScriptTag", "兼容旧字符串中的 <script> 标记，将标记内容作为脚本表达式处理。",
                example: false,
                note: "仅适用于可信的旧业务代码；严格脚本策略仍会限制表达式执行。");
            Add("CspScripts", "输出内容安全策略（CSP）的 script-src 响应头，限制脚本来源与执行方式。",
                example: true,
                note: "可配合同源、来源清单和 nonce 设置限制脚本来源。");
            Add("CspScriptsAllowSelf", "在脚本策略中允许加载与页面同源的脚本。",
                example: true);
            Add("CspScriptsAllowUrls", "在脚本策略中加入指定的脚本来源。",
                "用逗号分隔脚本来源，例如 cdn.example.com,assets.example.com",
                example: new[] { "https://cdn.example.com" });
            Add("CspScriptsAllowNonce", "允许执行带本次请求 nonce 的可信模板内联脚本。",
                example: true,
                note: "开启 CspScripts 后，可为可信内联脚本使用 PageManager 的本次请求 nonce。");
            Add("CspScriptsAllowUnsafeInline", "将 unsafe-inline 加入脚本策略，允许内联脚本。",
                example: false,
                note: "开启 CspScripts 时生效。可信模板内联脚本优先使用 nonce。");
            Add("EnableFStateValidation", "验证浏览器回传的 __FSTATE 签名，检测状态被篡改。",
                example: true,
                note: "需在 machineKey 中显式配置 validationKey。多服务器部署时各节点须使用相同的密钥。");

            category = "已废弃配置";
            Add("LoadingImageNumber", "选择旧版内置加载 GIF 的编号。",
                "1～30 的整数",
                note: "迁移时删除图片编号，将 LoadingCSSNumber 设为 1～6，选择 CSS 动画。");
            Add("LoadingImageUrl", "设置旧版加载图片的地址。",
                "图片 URL 或应用相对路径",
                note: "迁移时删除图片地址，将 LoadingCSSNumber 设为 1～6。留空时旧版配置按编号选择内置 GIF。");
            Add("CustomThemeEmbedLoadingImage", "设置自定义主题使用的旧版内置 GIF 配色文件。",
                "内置 GIF 文件名，例如 ffffff_444444.gif",
                note: "改用 LoadingCSSNumber（1～6）后即可删除此项，CSS 动画沿用主题颜色。");
            Add("EnableLargeMode", "启用大字模式的旧开关。",
                note: "大字模式请改用 DisplayMode=\"Large\"。旧开关仅在 DisplayMode 为 Normal 时生效，两个旧开关同时开启时优先使用大字模式。");
            Add("EnableCompactMode", "启用紧凑布局的旧开关。",
                note: "紧凑布局请改用 DisplayMode=\"Compact\"。旧开关仅在 DisplayMode 为 Normal 且未开启 EnableLargeMode 时生效。");
            Add("EnableShim", "旧版浏览器防止 ActiveX 或 Flash 遮挡弹窗的兼容开关。",
                note: "可以从配置文件中删除。");
            Add("IEEdge", "向旧版 Internet Explorer 声明 Edge 文档模式的开关。",
                note: "可以从配置文件中删除。");
            Add("ToolbarItemsSpace", "工具栏项目间距的旧名称。",
                "整数，单位为像素",
                note: "使用 ToolbarItemSpace。新配置取默认值时仍会读取旧配置。");
            Add("FormRowItemsSpace", "表单行项目间距的旧名称。",
                "整数，单位为像素",
                note: "使用 FormRowItemSpace。新配置取默认值时仍会读取旧配置。");
            Add("EnableFStateCompress", "旧版控件状态压缩开关。",
                note: "此项未实现压缩，可以从 Web.config 中删除。");

            // 字符串中的 <script> 只是配置说明，嵌入页面时转义尖括号，避免提前结束数据标签。
            return JsonConvert.SerializeObject(rows, new JsonSerializerSettings {
                StringEscapeHandling = StringEscapeHandling.EscapeHtml
            });
        }
    }
}
