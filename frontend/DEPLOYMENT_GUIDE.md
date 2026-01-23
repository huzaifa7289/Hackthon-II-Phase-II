# DEPLOYMENT_GUIDE.md

# Hackathon Frontend Deployment Guide

## Quick Start Deployment

### Option 1: Deploy to Vercel (Recommended)

#### Prerequisites
- Node.js 16+ and npm installed
- Vercel account (free at https://vercel.com)
- Git repository pushed to GitHub

#### Step 1: Login to Vercel
```bash
npm install -g vercel
vercel login
```

#### Step 2: Deploy
```bash
cd frontend
vercel --prod
```

Or use the deployment scripts:
- **Linux/Mac**: `bash deploy.sh`
- **Windows**: `deploy.bat`

#### Step 3: Configure Environment Variables
After deployment, set environment variables in Vercel dashboard:
1. Go to your project settings
2. Add environment variable:
   - Key: `NEXT_PUBLIC_API_URL`
   - Value: `https://jkeqkc-hackthon-backend.hf.space`
3. Redeploy

### Option 2: Deploy via Git Integration (Automatic)

1. **Connect Repository**:
   - Go to https://vercel.com/new
   - Import your GitHub repository
   - Select `Hackthon-II-Phase-II` project

2. **Configure**:
   - Root Directory: `frontend`
   - Build Command: `npm run build`
   - Install Command: `npm install`

3. **Environment Variables**:
   - Add `NEXT_PUBLIC_API_URL=https://jkeqkc-hackthon-backend.hf.space`

4. **Deploy**: Click "Deploy"

---

## Backend Integration

### Hugging Face Backend Configuration

**Backend URL**: https://jkeqkc-hackthon-backend.hf.space

#### Supported Endpoints

The frontend is configured to call:

```
GET  /api/v1/tasks              - Get all tasks
POST /api/v1/tasks              - Create a task
GET  /api/v1/tasks/{id}         - Get a specific task
PUT  /api/v1/tasks/{id}         - Update a task
DELETE /api/v1/tasks/{id}       - Delete a task
```

#### CORS Configuration

Ensure the Hugging Face backend allows requests from your Vercel domain:

```python
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "https://your-vercel-app.vercel.app"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

#### Authentication

All API calls include JWT Bearer token:
```
Authorization: Bearer {jwt_token}
```

---

## Verification Steps

### 1. Health Check
```bash
curl https://jkeqkc-hackthon-backend.hf.space/health
```

### 2. Test API Connection
Visit your deployed app and check browser console for:
```
API connection established: https://jkeqkc-hackthon-backend.hf.space
```

### 3. Manual Testing
- Create a task in the UI
- Check Network tab shows requests to correct backend URL
- Verify response data appears in the app

---

## Troubleshooting

### Build Fails on Vercel
**Issue**: TypeScript compilation error
**Solution**:
1. Check that `tsconfig.json` is correct
2. Run locally: `npm run build`
3. Fix errors before deploying

### CORS Errors
**Issue**: Browser shows "Access to XMLHttpRequest blocked by CORS policy"
**Solution**:
1. Verify backend includes correct `allow_origins`
2. Add your Vercel domain to backend CORS configuration
3. Backend must return proper `Access-Control-*` headers

### API Returns 401/403
**Issue**: Unauthorized or Forbidden errors
**Solution**:
1. Check JWT token is stored in localStorage
2. Verify token format: `Bearer {token}`
3. Ensure user authentication is working

### Blank Page After Deploy
**Issue**: Page loads but no content
**Solution**:
1. Check browser console for errors
2. Verify API_BASE_URL is correct
3. Check Network tab for failed requests
4. Test API endpoint directly: `curl {API_URL}/api/v1/tasks`

---

## Post-Deployment

### 1. Update Documentation
- Note the Vercel deployment URL
- Update README.md with deployment link

### 2. Enable Analytics (Optional)
- Enable Vercel Analytics for performance monitoring
- Monitor Core Web Vitals

### 3. CI/CD Integration
- Enable automatic deployments on git push
- Set up preview deployments for PRs

### 4. Custom Domain (Optional)
- Add custom domain in Vercel settings
- Configure DNS records

---

## Environment Variables Reference

| Variable | Value | Required | Notes |
|----------|-------|----------|-------|
| `NEXT_PUBLIC_API_URL` | `https://jkeqkc-hackthon-backend.hf.space` | Yes | Backend API endpoint |
| `NODE_ENV` | `production` | No | Set automatically by Vercel |

---

## Links

- **Vercel Dashboard**: https://vercel.com/dashboard
- **Hugging Face Backend**: https://huggingface.co/spaces/jkeqkc/hackthon-backend
- **Next.js Deployment Docs**: https://nextjs.org/docs/deployment

---

## Support

For issues:
1. Check Vercel logs: `vercel logs`
2. Review build configuration
3. Check backend API status
4. Test API endpoint manually
