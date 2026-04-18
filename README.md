# Huawei ROM Extractor Toolkit

华为 ROM 解包工具套装 - 支持 HarmonyOS 4 / Android 12+

[English](#english) | [中文](#中文)

---

## 中文

### 📋 简介

本工具集用于解包华为 HarmonyOS/Android 官方 ROM 更新包，支持提取和解析各类分区镜像。

**测试环境：**
- HarmonyOS 4
- Android 12

### 🛠️ 包含工具

| 工具 | 用途 | 来源 |
|------|------|------|
| HuaweiUpdateExtractor | 提取 UPDATE.APP/UPDATE.zip 中的分区镜像 | 社区开源工具 |
| simg2img | 将 sparse 镜像转换为 ext4 格式 | AOSP |
| lpunpack | 解包 SUPER 动态分区 | AOSP |
| erofsUnpackRust | 解包 EROFS 文件系统镜像 | 开源实现 |

### 📦 目录结构

```
huawei-rom-tools/
├── START.bat                    # 入门指南
├── tools/
│   ├── HuaweiUpdateExtractor/   # ROM 提取工具
│   └── unpackimg/               # 镜像解包工具
├── scripts/
│   ├── extract-super.bat        # SUPER 分区解包脚本
│   └── extract-erofs.bat        # EROFS 镜像解包脚本
└── docs/                        # 文档
```

### 🚀 快速开始

#### 方式一：使用 START.bat

双击运行 `START.bat`，查看使用指南。

#### 方式二：命令行操作

**Step 1: 提取 ROM 内容**

运行 `tools/HuaweiUpdateExtractor/HuaweiUpdateExtractor.exe`，将 UPDATE.APP 或 UPDATE.zip 拖入程序窗口提取分区镜像。

**Step 2: 解包 SUPER.img（如果存在）**

```batch
scripts\extract-super.bat C:\路径\SUPER.img
```

这会生成 `SUPER.ext4.img` 并在 `super_out` 目录中输出各个分区镜像（system.img、vendor.img 等）。

**Step 3: 解包 EROFS 镜像**

```batch
scripts\extract-erofs.bat C:\路径\super_out\system.img
```

### ⚠️ 注意事项

1. 需要 Windows 系统（已测试 Windows 10/11）
2. 确保有足够的磁盘空间（建议预留 ROM 大小的 3-5 倍空间）
3. 部分工具依赖 Visual C++ Redistributable

### 📜 许可证

各工具遵循其原始许可证：
- HuaweiUpdateExtractor: 开源社区工具
- AOSP 工具 (simg2img, lpunpack): Apache 2.0
- erofsUnpackRust: 开源实现

---

## English

### 📋 Introduction

A toolkit for extracting and unpacking Huawei HarmonyOS/Android official ROM update packages.

**Tested on:**
- HarmonyOS 4
- Android 12

### 🛠️ Included Tools

| Tool | Purpose | Source |
|------|---------|--------|
| HuaweiUpdateExtractor | Extract partition images from UPDATE.APP/UPDATE.zip | Community open source |
| simg2img | Convert sparse images to ext4 format | AOSP |
| lpunpack | Unpack SUPER dynamic partitions | AOSP |
| erofsUnpackRust | Unpack EROFS filesystem images | Open source implementation |

### 📦 Directory Structure

```
huawei-rom-tools/
├── START.bat                    # Getting started guide
├── tools/
│   ├── HuaweiUpdateExtractor/   # ROM extraction tool
│   └── unpackimg/               # Image unpacking tools
├── scripts/
│   ├── extract-super.bat        # SUPER partition unpack script
│   └── extract-erofs.bat        # EROFS image unpack script
└── docs/                        # Documentation
```

### 🚀 Quick Start

#### Option 1: Use START.bat

Double-click `START.bat` to see the usage guide.

#### Option 2: Command Line

**Step 1: Extract ROM contents**

Run `tools/HuaweiUpdateExtractor/HuaweiUpdateExtractor.exe` and drag UPDATE.APP or UPDATE.zip into the window.

**Step 2: Unpack SUPER.img (if present)**

```batch
scripts\extract-super.bat C:\path\SUPER.img
```

This generates `SUPER.ext4.img` and outputs partition images to `super_out` directory.

**Step 3: Unpack EROFS images**

```batch
scripts\extract-erofs.bat C:\path\super_out\system.img
```

### ⚠️ Notes

1. Windows system required (tested on Windows 10/11)
2. Ensure sufficient disk space (recommend 3-5x ROM size)
3. Some tools require Visual C++ Redistributable

### 📜 License

Tools are under their respective original licenses:
- HuaweiUpdateExtractor: Community open source tool
- AOSP tools (simg2img, lpunpack): Apache 2.0
- erofsUnpackRust: Open source implementation

---

## 致谢 / Credits

- HuaweiUpdateExtractor 作者和社区贡献者
- AOSP 开源项目
- erofsUnpackRust 开发者
