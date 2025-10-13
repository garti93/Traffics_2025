@echo off
title 🚀 DouiRom GitHub Uploader
color 0A

:: إعداد المسار الحالي
cd /d "%~dp0"

echo ================================================
echo    DouiRom GitHub Auto Push Script
echo ================================================

:: التحقق من وجود git
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Git غير مثبت على هذا النظام.
    echo ➜ يرجى تثبيت Git من https://git-scm.com/download/win
    pause
    exit /b
)

:: تهيئة المستودع إذا لم يكن مهيأ
if not exist ".git" (
    echo 🧩 Initializing new git repository...
    git init
)

:: إعداد الفرع الرئيسي
git branch -M main

:: إضافة جميع الملفات
echo ➕ Adding all files...
git add .

:: إنشاء commit جديد
echo 📝 Committing changes...
git commit -m "Auto upload from DouiRom tool"

:: تعيين الريموت (عدل الرابط أدناه باسم المستخدم والمستودع)
set REPO=https://github.com/Garti93/Traffics_2025.git
git remote remove origin >nul 2>&1
git remote add origin %REPO%

:: رفع الملفات
echo 🚀 Pushing to GitHub...
git push -u origin main

if %errorlevel%==0 (
    echo ✅ Upload completed successfully!
) else (
    echo ❌ حدث خطأ أثناء الرفع، تحقق من اتصال الإنترنت أو صلاحيات GitHub.
)

echo ================================================
pause
