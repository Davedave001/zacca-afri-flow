# Deploy Zacca.ai to VPS with Coolify

This guide walks you through deploying this React (Vite) app to **zacca.ai** using Coolify on your VPS.

## Prerequisites

- Coolify installed on your VPS
- Domain **zacca.ai** pointed to your VPS IP (A record)
- Code pushed to a Git repository (GitHub, GitLab, etc.)

---

## Step 1: Push Code to Git

Ensure your project is in a Git repository and push all changes:

```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

---

## Step 2: Create New Application in Coolify

1. Open your Coolify dashboard
2. Select your project (or create one)
3. Click **"Create New Resource"** → **"Application"**

---

## Step 3: Connect Your Repository

1. Choose your Git source:
   - **Public Repository**: Paste `https://github.com/YOUR_USERNAME/zacca-afri-flow` (or your repo URL)
   - **Private**: Use GitHub App or Deploy Key

2. Select the correct branch (e.g. `main` or `master`)

---

## Step 4: Configure Build Settings

| Setting | Value |
|---------|-------|
| **Build Pack** | `Nixpacks` |
| **Publish Directory** | `dist` |
| **Is it a static site?** | ✅ **Yes** |

Nixpacks will automatically:
- Run `npm install`
- Run `npm run build` (Vite build)
- Output files to `dist/`

---

## Step 5: Domain Configuration

1. In **Domains**, add: **zacca.ai** and **www.zacca.ai** (if desired)
2. Coolify will automatically provision SSL (Let's Encrypt) for HTTPS

---

## Step 6: SPA Routing (Important)

This app uses React Router with `BrowserRouter`. For client-side routes to work (e.g. `/solutions/dynamic-credit-scoring`, `/industry`), the server must serve `index.html` for all routes.

**In Coolify:**
1. Go to your application → **Configuration** → **Web Server**
2. Click **Generate** to load defaults, then ensure Nginx has this `location` block:

```nginx
location / {
    try_files $uri $uri/ /index.html;
}
```

If the default config doesn't include this, add it inside the `server` block. This makes Nginx fall back to `index.html` for any path, enabling React Router to handle routing.

---

## Step 7: Deploy

1. Click **Deploy**
2. Wait for the build to complete (typically 1–2 minutes)
3. Visit **https://zacca.ai** to verify

---

## Step 8: Auto-Deploy on Push (Optional)

1. In Coolify, enable **Webhooks** or **GitHub App** integration
2. Each push to your main branch will trigger a new deployment

---

## Environment Variables

If you add environment variables later (e.g. API keys), set them in Coolify under **Environment Variables**. For Vite, prefix with `VITE_` (e.g. `VITE_API_URL`).

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| 404 on page refresh | Ensure Nginx has `try_files $uri $uri/ /index.html` |
| Build fails | Check Coolify build logs; ensure `package.json` has a valid `build` script |
| Mixed content (HTTP/HTTPS) | Ensure assets use relative paths; Vite does this by default |
| Favicon not showing | Clear browser cache; favicon is at `/favicon.png` |
