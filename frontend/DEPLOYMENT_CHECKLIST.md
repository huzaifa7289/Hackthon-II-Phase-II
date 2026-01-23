# Deployment Checklist for Vercel + Hugging Face Integration

## Pre-Deployment Setup ✓

- [x] API client configured with Hugging Face backend URL
- [x] Environment variables created (.env.local, .env.production)
- [x] Vercel configuration updated (vercel.json)
- [x] Deployment scripts created (deploy.sh, deploy.bat)
- [x] Documentation complete (DEPLOYMENT_GUIDE.md)

## Pre-Deployment Verification

- [ ] Run locally: `npm run dev`
- [ ] Verify API calls work: Open DevTools → Network tab
- [ ] Check Auth functionality
- [ ] Test task creation/reading/updating/deleting
- [ ] Verify no console errors
- [ ] Test responsive design on mobile

## Deployment Steps

### 1. Install Vercel CLI
```bash
npm install -g vercel
```

### 2. Authenticate
```bash
vercel login
```

### 3. Deploy
```bash
cd frontend
vercel --prod
```

### 4. Set Environment Variables in Vercel Dashboard
- Go to: https://vercel.com/dashboard
- Select your project
- Settings → Environment Variables
- Add: `NEXT_PUBLIC_API_URL` = `https://jkeqkc-hackthon-backend.hf.space`
- Trigger a redeployment

### 5. Verify Deployment
- [ ] App loads without errors
- [ ] API calls succeed
- [ ] Auth works
- [ ] Tasks can be created
- [ ] Network shows requests to correct backend

## Post-Deployment Configuration

### Backend CORS Setup
Update Hugging Face backend `main.py`:

```python
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "https://your-vercel-domain.vercel.app"  # Update with your actual domain
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

## Deployment Verification Checklist

- [ ] **Landing Page**: App loads successfully
- [ ] **API Connection**: Network requests go to correct backend URL
- [ ] **Authentication**: Login/Signup works
- [ ] **Task Management**:
  - [ ] Can create a task
  - [ ] Can read/list tasks
  - [ ] Can update a task
  - [ ] Can delete a task
- [ ] **Error Handling**: Appropriate error messages shown
- [ ] **Performance**: Page loads quickly
- [ ] **Mobile**: Responsive on all devices
- [ ] **Browser Console**: No errors or warnings
- [ ] **Network Requests**: All showing 200/201 status codes

## Troubleshooting During Deployment

### If Build Fails
```bash
# Test locally first
npm run build

# Check for TypeScript errors
npm run lint
```

### If API Calls Fail (CORS/404)
1. Verify backend is running
2. Check `NEXT_PUBLIC_API_URL` is correct in Vercel dashboard
3. Verify backend CORS includes your Vercel domain
4. Test endpoint with curl:
   ```bash
   curl https://jkeqkc-hackthon-backend.hf.space/health
   ```

### If Auth Fails
1. Check JWT token storage (localStorage)
2. Verify token format: `Bearer {token}`
3. Check auth endpoint is working
4. Review network requests in DevTools

## Final Steps

1. **Documentation**
   - [ ] Update README with deployed URL
   - [ ] Document any custom configurations
   - [ ] Add deployment date and version

2. **Monitoring**
   - [ ] Enable Vercel Analytics
   - [ ] Set up error tracking
   - [ ] Monitor performance metrics

3. **Maintenance**
   - [ ] Set up automatic deployments from main branch
   - [ ] Enable preview deployments for PRs
   - [ ] Configure domain (if needed)

## Deployment Complete! 🎉

Your frontend is now deployed to Vercel and connected to the Hugging Face backend at:
- **Frontend**: `https://your-app.vercel.app` (provided by Vercel)
- **Backend**: `https://jkeqkc-hackthon-backend.hf.space`

## Useful Commands

```bash
# View deployment logs
vercel logs --follow

# See recent deployments
vercel list

# Remove old deployment
vercel remove

# Link to existing Vercel project
vercel link

# Deploy specific branch
vercel deploy --prod --git-branch=main
```

## Support Resources

- Vercel Docs: https://vercel.com/docs
- Next.js Deployment: https://nextjs.org/docs/deployment
- Hugging Face Spaces: https://huggingface.co/spaces
- API Documentation: See backend README.md
