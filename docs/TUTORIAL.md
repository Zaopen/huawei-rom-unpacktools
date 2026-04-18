# 详细使用教程

## 完整解包流程

### 1. 获取华为 ROM

从华为官方或可信渠道下载 ROM 更新包，通常文件名为 `UPDATE.APP` 或 `UPDATE.zip`。  
例如这里：[Users Submissions](https://ffusersubmission.byethost17.com/)，将ROM链接的后缀 `filelist.xml` 改为链接里 `package` 的文件后缀，即可下载。 

### 2. 提取分区镜像

**使用 HuaweiUpdateExtractor：**

1. 打开 `tools/HuaweiUpdateExtractor/HuaweiUpdateExtractor.exe`
2. 将 `UPDATE.APP` 或 `UPDATE.zip` 文件拖入程序窗口
3. 程序会自动识别并显示包含的分区
4. 选择需要的分区，点击提取

**提取的文件示例：**
- `boot.img` - 内核启动镜像
- `recovery.img` - 恢复模式镜像
- `SUPER.img` - 动态分区（包含 system、vendor、product 等）
- `cust.img` - 定制分区

### 3. 解包 SUPER 分区

如果提取到 `SUPER.img`，需要进一步解包：

```batch
scripts\extract-super.bat C:\ROM\SUPER.img
```

**流程说明：**
1. `simg2img` 将 sparse 格式的 SUPER.img 转换为标准 ext4 格式
2. `lpunpack` 将 SUPER 分区解包为各个子分区

**输出文件：**
```
super_out/
├── system.img
├── vendor.img
├── product.img
├── system_ext.img
└── odm.img
```

### 4. 解包 EROFS 镜像

华为 HMOS 4 / Android 12+ 使用 EROFS 文件系统，需要特殊工具解包：

```batch
scripts\extract-erofs.bat C:\ROM\super_out\system.img
```

解包后的文件会输出到 `system.img` 所在目录的文件夹中。

### 5. 查看解包内容

解包后的目录结构示例：
```
system/
├── app/           # 系统应用
├── bin/           # 可执行程序
├── etc/           # 配置文件
├── framework/     # 框架文件
├── lib/           # 库文件
├── priv-app/      # 特权应用
├── usr/           # 用户数据
└── ...
```

## 常见问题

### Q: 提示缺少 DLL 文件？
A: 安装 [Visual C++ Redistributable](https://aka.ms/vs/17/release/vc_redist.x64.exe)

### Q: SUPER.img 解包失败？
A: 确保 SUPER.img 是完整的 sparse 格式，不是已经转换过的 ext4

### Q: EROFS 解包后文件损坏？
A: 确保使用与 ROM 版本匹配的工具版本

### Q: 如何重新打包？
A: 本工具集仅用于解包，重新打包需要其他工具

## 技术参考

- [EROFS 文件系统](https://docs.kernel.org/filesystems/erofs.html)
- [Android 动态分区](https://source.android.com/docs/core/ota/dynamic_partitions)
- [Sparse 镜像格式](https://android.googlesource.com/platform/system/core/+/master/libsparse/sparse_format.h)
