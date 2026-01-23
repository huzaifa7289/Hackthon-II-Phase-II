@echo off
REM Vercel Deployment Script for Hackathon Frontend (Windows)
REM This script builds and deploys the frontend to Vercel

setlocal enabledelayedexpansion

echo.
echo 🚀 Starting Vercel Deployment...
echo.

REM Check if Vercel CLI is installed
where vercel >nul 2>nul
if errorlevel 1 (
    echo ❌ Vercel CLI is not installed. Installing...
    call npm install -g vercel
)

echo 📦 Installing dependencies...
call npm install

echo 🔨 Building the project...
call npm run build

echo 🚀 Deploying to Vercel...
call vercel --prod

echo.
echo ✅ Deployment successful!
echo.
echo 📋 Next Steps:
echo 1. Go to https://vercel.com/dashboard to view your deployment
echo 2. Set environment variables in Vercel dashboard:
echo    - NEXT_PUBLIC_API_URL=https://jkeqkc-hackthon-backend.hf.space
echo 3. Test the deployed application
echo.
echo 🔗 Backend Integration:
echo    API URL: https://jkeqkc-hackthon-backend.hf.space
echo    Status: Check the /health endpoint
echo.

endlocal
