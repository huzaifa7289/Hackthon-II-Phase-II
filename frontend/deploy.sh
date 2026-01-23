#!/bin/bash

# Vercel Deployment Script for Hackathon Frontend
# This script builds and deploys the frontend to Vercel

set -e

echo "🚀 Starting Vercel Deployment..."
echo ""

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI is not installed. Installing..."
    npm install -g vercel
fi

echo "📦 Installing dependencies..."
npm install

echo "🔨 Building the project..."
npm run build

echo "🚀 Deploying to Vercel..."
vercel --prod

echo ""
echo "✅ Deployment successful!"
echo ""
echo "📋 Next Steps:"
echo "1. Go to https://vercel.com/dashboard to view your deployment"
echo "2. Set environment variables in Vercel dashboard:"
echo "   - NEXT_PUBLIC_API_URL=https://jkeqkc-hackthon-backend.hf.space"
echo "3. Test the deployed application"
echo ""
echo "🔗 Backend Integration:"
echo "   API URL: https://jkeqkc-hackthon-backend.hf.space"
echo "   Status: Check the /health endpoint"
