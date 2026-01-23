This is a [Next.js](https://nextjs.org) project for the Hackathon Todo Application with Hugging Face backend integration.

## Getting Started

First, run the development server:

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Backend Integration

This frontend is configured to connect with the Hugging Face backend:
- **Backend URL**: https://jkeqkc-hackthon-backend.hf.space
- **API Base**: `/api/v1`

All API calls automatically include JWT authentication headers.

## Environment Variables

Create a `.env.local` file:

```bash
NEXT_PUBLIC_API_URL=https://jkeqkc-hackthon-backend.hf.space
```

## Deployment

### Quick Deploy to Vercel

1. **Install Vercel CLI**:
   ```bash
   npm install -g vercel
   ```

2. **Login**:
   ```bash
   vercel login
   ```

3. **Deploy**:
   ```bash
   vercel --prod
   ```

Or use the deployment scripts:
- **Linux/Mac**: `bash deploy.sh`
- **Windows**: `deploy.bat`

### Configuration

After deployment, set environment variables in Vercel Dashboard:
- `NEXT_PUBLIC_API_URL`: https://jkeqkc-hackthon-backend.hf.space

See [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md) for detailed instructions.

## Features

- ✅ Task Management (Create, Read, Update, Delete)
- ✅ User Authentication with JWT
- ✅ Responsive UI with Tailwind CSS
- ✅ TypeScript for type safety
- ✅ React Hook Form for form handling
- ✅ Better Auth integration

## Project Structure

```
frontend/
├── app/              # Next.js app directory
├── components/       # React components
├── hooks/           # Custom React hooks
├── lib/             # Utilities (API client, auth)
├── public/          # Static assets
├── types/           # TypeScript type definitions
└── styles/          # Global styles
```

## Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm start` - Start production server
- `npm run lint` - Run ESLint

## Links

- [Deployment Guide](./DEPLOYMENT_GUIDE.md)
- [Deployment Checklist](./DEPLOYMENT_CHECKLIST.md)
- [Backend API Docs](../backend/README.md)
- [Vercel Platform](https://vercel.com)
- [Hugging Face Spaces](https://huggingface.co/spaces/jkeqkc/hackthon-backend)

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs)
- [Learn Next.js](https://nextjs.org/learn)

Check out the [Next.js GitHub repository](https://github.com/vercel/next.js) for feedback and contributions!
