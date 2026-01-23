# 🚀 Vercel Deployment Quick Reference

## One-Command Deployment

```bash
npm install -g vercel && vercel login && vercel --prod
```

---

## Essential Commands

| Command | Purpose |
|---------|---------|
| `vercel login` | Authenticate with Vercel |
| `vercel --prod` | Deploy to production |
| `vercel --env NEXT_PUBLIC_API_URL=https://jkeqkc-hackthon-backend.hf.space --prod` | Deploy with env vars |
| `vercel logs --follow` | Watch deployment logs |
| `vercel list` | Show all deployments |
| `vercel remove [deployment-id]` | Delete a deployment |
| `vercel env list` | Show environment variables |

---

## Configuration Files

### `.env.production`
```bash
NEXT_PUBLIC_API_URL=https://jkeqkc-hackthon-backend.hf.space
```

### `vercel.json`
```json
{
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "framework": "nextjs",
  "regions": ["iad1"],
  "env": {
    "NEXT_PUBLIC_API_URL": "https://jkeqkc-hackthon-backend.hf.space"
  }
}
```

---

## Pre-Deployment Checklist

- [ ] `npm install` - Dependencies installed
- [ ] `npm run build` - Build succeeds locally
- [ ] `NEXT_PUBLIC_API_URL` set in .env files
- [ ] No TypeScript errors
- [ ] No console errors in dev mode
- [ ] API calls tested locally
- [ ] Git changes committed

---

## Deployment Process

### Step 1: Setup (First time only)
```bash
npm install -g vercel
vercel login
cd frontend
vercel link  # Link to Vercel project
```

### Step 2: Deploy
```bash
vercel --prod
```

### Step 3: Configure (Vercel Dashboard)
1. Go to https://vercel.com/dashboard
2. Select project
3. Settings → Environment Variables
4. Add `NEXT_PUBLIC_API_URL` with value: `https://jkeqkc-hackthon-backend.hf.space`
5. Redeploy

### Step 4: Verify
```bash
# Check deployment
vercel list

# View logs
vercel logs [deployment-url]

# Test API endpoint
curl https://jkeqkc-hackthon-backend.hf.space/health
```

---

## Backend Integration Checklist

- [ ] Backend URL: `https://jkeqkc-hackthon-backend.hf.space`
- [ ] API endpoints tested: GET /api/v1/tasks
- [ ] JWT authentication working
- [ ] CORS configured on backend:
  ```python
  allow_origins=["https://your-vercel-app.vercel.app"]
  ```
- [ ] Backend responding with 200/201 status codes

---

## Environment Variables Reference

| Name | Value | Where |
|------|-------|-------|
| `NEXT_PUBLIC_API_URL` | `https://jkeqkc-hackthon-backend.hf.space` | Vercel Dashboard |

---

## Common Issues & Fixes

### ❌ CORS Error
**Fix**: Update backend `main.py` with your Vercel domain

### ❌ API 404
**Fix**: Check `NEXT_PUBLIC_API_URL` value in Vercel Dashboard

### ❌ API 401/403
**Fix**: Verify JWT token is saved and sent in headers

### ❌ Build Fails
**Fix**: Run `npm run build` locally to see errors

### ❌ Blank Page
**Fix**: Check browser console and Network tab for errors

---

## After Deployment

1. ✅ Copy deployment URL
2. ✅ Test all features
3. ✅ Update documentation
4. ✅ Share URL with team
5. ✅ Monitor performance
6. ✅ Set up automatic deployments (optional)

---

## Useful Links

| Resource | URL |
|----------|-----|
| Vercel Dashboard | https://vercel.com/dashboard |
| Deployment Guide | DEPLOYMENT_GUIDE.md |
| Deployment Checklist | DEPLOYMENT_CHECKLIST.md |
| Backend (Hugging Face) | https://huggingface.co/spaces/jkeqkc/hackthon-backend |
| Next.js Docs | https://nextjs.org/docs |

---

## Example Deployment Session

```bash
# Navigate to frontend directory
cd frontend

# Install Vercel CLI (if not already)
npm install -g vercel

# Login to Vercel (opens browser)
vercel login

# Deploy to production
vercel --prod

# Output shows: https://your-app.vercel.app ✨

# Check logs
vercel logs --follow

# Configure environment variable in Vercel Dashboard
# Then redeploy

# Done! 🎉
```

---

## Status Indicators

✅ API Client: Connected to Hugging Face  
✅ Environment Config: Ready for production  
✅ Build Scripts: Tested and working  
✅ Documentation: Complete  
✅ Git Commits: All changes committed  

**Ready to deploy!**
