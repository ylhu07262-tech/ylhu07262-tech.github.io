# Fudan Atmos Portfolio

这是一个可本地打开、也可直接部署到 GitHub Pages 的静态个人科研主页项目，面向复旦大学大气与海洋科学系暑期线上实习 / 科研训练申请场景。

## 本地打开

1. 直接双击 `index.html` 即可浏览。
2. 如果希望避免浏览器对本地文件的某些限制，也可以在项目目录启动一个简单静态服务器，例如：

```powershell
cd D:\fudan-atmos-portfolio
python -m http.server 8000
```

然后访问 `http://localhost:8000`。

## 部署到 GitHub Pages（获得 sunmoumou1.github.io 同类公开链接）

本地 `index.html` 只能在本机打开；要获得类似 `https://sunmoumou1.github.io/` 的公开网址，需要把项目推到 GitHub 并开启 Pages。

### 推荐方案 A：用户主页（根域名）

1. 在 GitHub 新建仓库，名称必须是 **`ylhu07262-tech.github.io`**（与你的 GitHub 用户名一致）。
2. 将 `D:\fudan-atmos-portfolio` 下所有文件上传到该仓库**根目录**。
3. 打开仓库 **Settings → Pages**，Source 选择 **Deploy from a branch**，Branch 选 **main / root**，保存。
4. 等待 1–3 分钟后访问：

```
https://ylhu07262-tech.github.io/
```

### 方案 B：项目主页（子路径）

1. 新建任意名称仓库，例如 **`fudan-atmos-portfolio`**。
2. 上传同样文件到根目录，开启 Pages（同上）。
3. 公开链接为：

```
https://ylhu07262-tech.github.io/fudan-atmos-portfolio/
```

### 首次上传命令（在项目目录 PowerShell 中执行）

```powershell
cd D:\fudan-atmos-portfolio
git init
git add .
git commit -m "Initial portfolio site"
git branch -M main
git remote add origin https://github.com/ylhu07262-tech/ylhu07262-tech.github.io.git
git push -u origin main
```

> 若使用方案 B，把 remote URL 换成对应仓库地址即可。

### 与 sunmoumou1.github.io 类似的“图形化叙事”做法

参考主页中的 **Visual Research Story** 模块：用 SVG 曲线连接节点、Tab 切换不同研究图板、图表占主视觉、文字只做标签。workflow 模块则是 6 步卡片流程 + 3 阶段成长路径，适合展示可复现科研流程。

## 当前已做的隐私处理

- 联系方式已按你提供的邮箱、电话、GitHub 填写；如需隐藏手机号，可在 `index.html` 的 `#contact` 中删除 Phone 一行。

## 项目结构

- `index.html`：主页结构与内容
- `style.css`：页面样式
- `script.js`：滚动显现与导航高亮
- `assets/images/`：研究图表素材
- `assets/docs/`：申请材料 PDF
- `content_zh.md`：中文网页文案整理版
- `abstract_en.md`：英文摘要版
- `email_snippet.txt`：可放入联系导师邮件中的网页说明文字
- `materials_checklist.md`：素材来源与待补充项

## 当前已做的隐私处理

- 没有自动公开手机号、邮箱、身份证、住址等敏感信息。
- 联系方式位置保留了待补充占位，建议在确认后手动替换。
- “Download Materials” 当前链接到 `academic-statement.pdf`，如果你有正式简历 PDF，建议后续替换。

## 建议后续手动补充

- 个人邮箱
- 手机号（如确需公开）
- GitHub 主页链接
- 正式 CV / 简历 PDF
- 未来新增的 ERA5 / CMIP6 图表
