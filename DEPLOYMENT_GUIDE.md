# Deployment Guide - COA Generator CCPL

## Quick Deployment to Vercel

### Prerequisites
- Vercel account (free) - Sign up at https://vercel.com
- All files in the "COA GENERATOR 17 NOV" folder

### Method 1: Vercel Web Interface (Easiest - No Technical Skills Required)

1. **Create Vercel Account**
   - Go to https://vercel.com
   - Click "Sign Up"
   - Sign up with GitHub, GitLab, or email

2. **Deploy via Web Interface**
   - Login to Vercel dashboard
   - Click "Add New..." → "Project"
   - Click "Continue with GitHub" or "Import Git Repository"
   - OR drag and drop the entire folder into the upload area

3. **Configure Project**
   - Project Name: `coa-generator-ccpl` (or your preferred name)
   - Framework Preset: "Other"
   - Root Directory: `./`
   - Build Command: (leave empty)
   - Output Directory: (leave empty)

4. **Deploy**
   - Click "Deploy"
   - Wait 30-60 seconds
   - Your site will be live at: `https://coa-generator-ccpl.vercel.app`

### Method 2: Vercel CLI (For Technical Users)

1. **Install Node.js**
   - Download from https://nodejs.org (LTS version)
   - Install on your computer

2. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

3. **Login to Vercel**
   ```bash
   vercel login
   ```
   - Enter your email
   - Click the verification link sent to your email

4. **Navigate to Project Folder**
   ```bash
   cd "/Users/rupimac/Downloads/COA GENERATOR 17 NOV"
   ```

5. **Deploy**
   ```bash
   vercel
   ```

   Answer the prompts:
   - Set up and deploy? **Y**
   - Which scope? **(Select your account)**
   - Link to existing project? **N**
   - What's your project's name? **coa-generator-ccpl**
   - In which directory is your code located? **./**
   - Want to override settings? **N**

6. **Production Deployment**
   ```bash
   vercel --prod
   ```

### Method 3: Deploy from GitHub

1. **Create GitHub Repository**
   - Go to https://github.com/new
   - Create a new repository: `coa-generator-ccpl`
   - Don't initialize with README

2. **Upload Files to GitHub**
   - Option A: Use GitHub web interface (drag and drop)
   - Option B: Use Git command line:
     ```bash
     cd "/Users/rupimac/Downloads/COA GENERATOR 17 NOV"
     git init
     git add .
     git commit -m "Initial commit"
     git branch -M main
     git remote add origin https://github.com/YOUR_USERNAME/coa-generator-ccpl.git
     git push -u origin main
     ```

3. **Connect to Vercel**
   - Go to Vercel dashboard
   - Click "Add New..." → "Project"
   - Click "Import Git Repository"
   - Select your GitHub repository
   - Click "Import"
   - Click "Deploy"

## After Deployment

### Your Live URLs
- **Production URL**: `https://coa-generator-ccpl.vercel.app`
- **Login Page**: `https://coa-generator-ccpl.vercel.app/login.html`
- **Main App**: `https://coa-generator-ccpl.vercel.app/index.html`

### Test the Deployment

1. Open the production URL in a browser
2. Try logging in with test credentials:
   - Username: `admin`
   - Password: `ccpl@2024`
3. Test creating a COA for a product
4. Verify PDF download works

### Custom Domain (Optional)

1. **In Vercel Dashboard**
   - Go to your project
   - Click "Settings" → "Domains"
   - Add your custom domain (e.g., `coa.cognizantchemical.com`)

2. **Update DNS Records**
   - Add CNAME record in your domain registrar:
     - Name: `coa` (or your subdomain)
     - Value: `cname.vercel-dns.com`

3. **Wait for Verification**
   - Vercel will automatically configure SSL certificate
   - Your site will be live on custom domain in ~1-2 hours

## Updating the Application

### Via Vercel Web Interface
1. Make changes to files locally
2. Go to Vercel dashboard → Your project
3. Click "Deployments" → "..." → "Redeploy"
4. Upload changed files

### Via Vercel CLI
```bash
cd "/Users/rupimac/Downloads/COA GENERATOR 17 NOV"
vercel --prod
```

### Via GitHub (if connected)
```bash
git add .
git commit -m "Updated products/features"
git push
```
(Vercel automatically deploys on push)

## Adding New Products

### For Raw Materials

1. **Edit File**: `data/rm-products.json`
2. **Add New Product** to the `products` array
3. **Redeploy** using one of the methods above

Example:
```json
{
  "code": "RM2506005",
  "name": "Ethanol",
  "chemicalName": "Ethanol (C2H5OH)",
  "category": "raw-material",
  "tests": [...]
}
```

### For Finish Goods

1. **Edit File**: `data/fg-products.json`
2. **Add New Product** to the `products` array
3. **Redeploy**

## Environment Configuration

### Development (Local Testing)
- Open `login.html` directly in browser
- Uses local JSON files
- No server required

### Production (Vercel)
- Served via Vercel CDN
- Automatic HTTPS
- Global edge network
- 99.99% uptime

## Security Considerations

### Current Setup (Client-Side Only)
- ✅ Suitable for internal company use
- ✅ Basic authentication
- ⚠️ Passwords in localStorage (client-side)
- ⚠️ No server-side validation

### For Enhanced Security (Future)
Consider adding:
- Backend API (Node.js/Express)
- Database (PostgreSQL/MongoDB)
- JWT authentication
- Password hashing (bcrypt)
- Rate limiting
- Audit logs

## Monitoring and Analytics

### Vercel Analytics (Free Tier)
1. Go to Vercel dashboard
2. Select your project
3. Click "Analytics"
4. View traffic, performance, and usage

### Google Analytics (Optional)
Add to `index.html` before `</head>`:
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## Troubleshooting Deployment

### Error: "No index.html found"
- Solution: Ensure `vercel.json` is in root directory
- Check that routes point to `login.html` as default

### Error: "JSON files not loading"
- Solution: Verify `data/` folder is included in deployment
- Check file paths are relative (not absolute)
- Ensure JSON files have correct MIME type

### Error: "404 on refresh"
- Solution: Update `vercel.json` with proper routing
- Add SPA configuration

### Error: "Session not persisting"
- Solution: Check browser cookies/storage are enabled
- Verify sessionStorage is supported

## Backup and Version Control

### Recommended Workflow

1. **Keep Local Backup**
   ```bash
   cp -r "/Users/rupimac/Downloads/COA GENERATOR 17 NOV" ~/Backups/COA_Backup_$(date +%Y%m%d)
   ```

2. **Use Git for Version Control**
   ```bash
   git init
   git add .
   git commit -m "Backup $(date +%Y-%m-%d)"
   ```

3. **Regular Exports**
   - Export JSON files weekly
   - Download from Vercel dashboard monthly
   - Store in company cloud storage

## Performance Optimization

### Already Implemented
- ✅ Minimal dependencies (only jsPDF)
- ✅ No heavy frameworks
- ✅ Optimized CSS
- ✅ Efficient JavaScript
- ✅ Responsive images

### Future Optimizations
- Compress images
- Minify CSS/JS
- Add service worker for offline support
- Implement lazy loading

## Support Contacts

### Vercel Support
- Documentation: https://vercel.com/docs
- Community: https://github.com/vercel/vercel/discussions
- Email: support@vercel.com

### Application Support
- Refer to README.md for feature documentation
- Check LOGIN_CREDENTIALS.txt for access details

## Costs

### Vercel Free Tier Includes:
- Unlimited deployments
- 100GB bandwidth/month
- Automatic SSL certificates
- Custom domains
- Analytics
- 100 GB-hours serverless function execution

### Sufficient For:
- ✅ Small to medium teams (< 50 users)
- ✅ Internal company use
- ✅ Up to ~10,000 page views/month

### Upgrade to Pro ($20/month) If Needed For:
- Higher bandwidth
- More team members
- Priority support
- Advanced analytics

## Checklist Before Going Live

- [ ] Test all login credentials
- [ ] Verify all 3 RM products work
- [ ] Verify all 11 FG products work
- [ ] Test on mobile device
- [ ] Test on desktop browser
- [ ] Verify PDF generation works
- [ ] Test validation (both pass and fail cases)
- [ ] Check expiry date calculation (3 years)
- [ ] Verify logout works
- [ ] Test session persistence
- [ ] Share URL with test users
- [ ] Document any custom processes
- [ ] Train users on the system
- [ ] Set up backup schedule

## Quick Reference

| Task | Command/Action |
|------|----------------|
| Deploy | `vercel --prod` |
| View logs | Vercel dashboard → Deployments → View logs |
| Rollback | Vercel dashboard → Deployments → Promote to production |
| Custom domain | Settings → Domains → Add |
| Analytics | Dashboard → Analytics |
| Update code | Make changes → `vercel --prod` |

---

**Ready to Deploy?**

Choose Method 1 (Web Interface) for easiest deployment, or Method 2 (CLI) for more control.

Good luck with your deployment! 🚀
