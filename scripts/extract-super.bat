@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ==========================================
echo SUPER 镜像解包工具
echo ==========================================
echo.

if "%~1"=="" (
    echo 用法: extract-super.bat ^<SUPER.img 路径^>
    echo 示例: extract-super.bat C:\ROM\SUPER.img
    echo.
    pause
    exit /b 1
)

set "SUPER_IMG=%~1"
set "OUTPUT_DIR=%~dp1super_out"

if not exist "%SUPER_IMG%" (
    echo 错误: 找不到文件 %SUPER_IMG%
    pause
    exit /b 1
)

echo 输入文件: %SUPER_IMG%
echo 输出目录: %OUTPUT_DIR%
echo.

set "TOOLS_DIR=%~dp0..\tools\unpackimg"

REM Step 1: Convert sparse image to ext4
echo [1/2] 转换 sparse 镜像为 ext4...
"%TOOLS_DIR%\simg2img.exe" "%SUPER_IMG%" "%~dp1SUPER.ext4.img"
if errorlevel 1 (
    echo 错误: simg2img 转换失败
    pause
    exit /b 1
)
echo 完成: SUPER.ext4.img 已生成
echo.

REM Step 2: Unpack super partition
echo [2/2] 解包 SUPER 分区...
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"
"%TOOLS_DIR%\lpunpack.exe" "%~dp1SUPER.ext4.img" "%OUTPUT_DIR%"
if errorlevel 1 (
    echo 错误: lpunpack 解包失败
    pause
    exit /b 1
)
echo 完成: 分区已解包到 %OUTPUT_DIR%
echo.

echo ==========================================
echo SUPER 镜像解包完成！
echo 输出位置: %OUTPUT_DIR%
echo ==========================================
pause
