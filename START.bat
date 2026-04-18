@echo off
chcp 65001 >nul
echo ==========================================
echo 华为 ROM 解包工具套装
echo Huawei ROM Extractor Toolkit
echo ==========================================
echo.
echo 本工具集用于解包华为 HarmonyOS/Android ROM 更新包
echo 支持 HMOS 4 / Android 12 及以上版本测试通过
echo.
echo 【使用步骤】
echo.
echo 第一步：使用 HuaweiUpdateExtractor 提取 ROM 内容
echo   工具位置：tools\HuaweiUpdateExtractor\HuaweiUpdateExtractor.exe
echo   操作：将 UPDATE.APP 或 UPDATE.zip 拖入程序窗口
echo.
echo 第二步：解包 SUPER.img（如果存在）
echo   运行：scripts\extract-super.bat ^<SUPER.img路径^>
echo.
echo 第三步：解包 system.img 等分区镜像
echo   运行：scripts\extract-erofs.bat ^<system.img路径^>
echo.
echo ==========================================
echo.
pause
