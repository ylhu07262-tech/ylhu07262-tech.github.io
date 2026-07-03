# Personal Academic Portfolio

胡雅兰的静态个人科研主页，用于展示研究问题、证据整合流程、图表成果与联系方式。

**在线访问：** [https://ylhu07262-tech.github.io/](https://ylhu07262-tech.github.io/)

## 研究主题

- 颗粒物干沉降与观测证据整合
- 文献检索、元数据核查与参数标准化
- 向陆气相互作用、气候数据诊断方向拓展

## 本地预览

直接打开 `index.html`，或在项目目录启动本地服务器：

```powershell
python -m http.server 8000
```

浏览器访问 `http://localhost:8000`。

## 更新与部署

仓库已绑定 GitHub Pages。修改后推送至 `main` 分支即可自动更新站点。

```powershell
git add .
git commit -m "Update site"
git push
```

或使用一键脚本（需本机可访问 GitHub）：

```powershell
powershell -ExecutionPolicy Bypass -File .\deploy.ps1
```

首次部署请在仓库 **Settings → Pages** 中确认：Source 为 **Deploy from a branch**，Branch 为 **main / root**。

## 项目结构

| 文件 / 目录 | 说明 |
|-------------|------|
| `index.html` | 主页结构与内容 |
| `style.css` | 页面样式 |
| `script.js` | 滚动动画与导航高亮 |
| `assets/images/` | 研究图表 |
| `assets/docs/` | 自述等 PDF 材料 |
| `content_zh.md` | 中文文案整理 |
| `abstract_en.md` | 英文摘要 |
| `deploy.ps1` | 本地部署辅助脚本 |

## 联系方式

- Email: 27230227@njnu.edu.cn
- GitHub: [ylhu07262-tech](https://github.com/ylhu07262-tech)

## License

内容仅供学术交流与个人展示使用。
