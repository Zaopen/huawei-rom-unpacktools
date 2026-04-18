@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ==========================================
echo EROFS 镜像解包工具
echo ==========================================
echo.

if "%~1"=="" (
    echo 用法: extract-erofs.bat ^<镜像文件路径^>
    echo 示例: extract-erofs.bat C:\ROM\super_out\system.img
    echo 示例: extract-erofs.bat C:\ROM\super_out\vendor.img
    echo 示例: extract-erofs.bat C:\ROM\super_out\product.img
    echo.
    pause
    exit /b 1
)

set "IMG_FILE=%~1"
set "IMG_NAME=%~n1"
set "OUTPUT_DIR=%~dp1%IMG_NAME%_extracted"

if not exist "%IMG_FILE%" (
    echo 错误: 找不到文件 %IMG_FILE%
    pause
    exit /b 1
)

echo 输入文件: %IMG_FILE%
echo 输出目录: %OUTPUT_DIR%
echo.

set "TOOLS_DIR=%~dp0..\tools\unpackimg"

REM Extract EROFS image
echo 正在解包 EROFS 镜像...
"%TOOLS_DIR%\erofsUnpackRust.exe" "%IMG_FILE%"
if errorlevel 1 (
    echo 错误: EROFS 解包失败
    pause
    exit /b 1
)

echo.
echo ==========================================
echo EROFS 镜像解包完成！
echo ==========================================
pause
