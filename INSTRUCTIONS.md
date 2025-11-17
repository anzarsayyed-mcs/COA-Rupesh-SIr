# COA Generator - Quick Start Instructions

## ✅ Status: Ready to Use!

Your COA Generator has:
- ✅ 3 Raw Material products (from RM folder)
- ✅ 11 Finish Goods products (from FG folder)
- ✅ All specifications extracted from original Word documents
- ✅ Login system (5 users)
- ✅ Responsive design

---

## 🚀 How to Start (3 Steps)

### Step 1: Start the Server

**Option A - Easy (Double-Click):**
```
Double-click: START-SERVER.command
```

**Option B - Terminal:**
```bash
cd "/Users/rupimac/Downloads/COA GENERATOR 17 NOV"
python3 -m http.server 8000
```

### Step 2: Open Browser

Go to: **http://localhost:8000/login.html**

### Step 3: Login

```
Username: admin
Password: ccpl@2024
```

---

## 📋 Testing the Dropdowns

### Raw Material Test
1. Click "Raw Material Test"
2. You should see dropdown with **3 products**:
   - Methanol (CH3OH) (RM2506001)
   - Methylene Chloride (CH2Cl2) (RM2506002)
   - Acetone ((CH3)2CO) (RM2506004)

### Finish Goods Test
1. Click "Finish Goods Test"
2. Type in the search box
3. You should see **11 products**:
   - F2504001 - Acetone - Meets EP/BP Chemical Specifications
   - F2504001M - Acetone - Meets NF and EP/BP Specifications
   - F2508003 - Acetone - Meets NF Requirements
   - F2506002M - MDC - Meets NF and EP/BP Specifications
   - F2506002 - MDC - Meets NF Requirements
   - F2507002 - MDC - Meets EP/BP Specifications
   - F2509003 - Methanol - Meets NF Requirements
   - F2510002 - Methanol - Normal Duty
   - RM2509004 - Methanol - HPLC Grade
   - RM2509007 - Methanol - Meets EP/BP Specifications
   - RM2509007M - Methanol - Meets NF and EP/BP Specifications

---

## 🧪 Test If Data Loads

Go to: **http://localhost:8000/test-data-load.html**

You should see:
```
✓ SUCCESS!

RM Products (3):
  - RM2506001: Methanol (CH3OH)
  - RM2506002: Methylene Chloride (CH2Cl2)
  - RM2506004: Acetone ((CH3)2CO)

FG Products (11):
  - [All 11 products listed]
```

---

## ❌ Troubleshooting

### Problem: Dropdowns are empty / No products showing

**Cause:** You opened the HTML file directly (file:// protocol)

**Solution:**
1. Start the web server (see Step 1 above)
2. Access via http://localhost:8000/login.html
3. Do NOT open login.html directly from Finder

### Problem: "Connection refused"

**Cause:** Server not running

**Solution:**
1. Make sure Terminal shows: "Serving HTTP on 0.0.0.0 port 8000"
2. If not, start the server again

### Problem: Still no dropdowns

**Solution:**
1. Open browser console (Press F12)
2. Look for errors in red
3. Go to http://localhost:8000/test-data-load.html
4. If you see errors about CORS or fetch, make sure you're using http://localhost:8000 and NOT file://

---

## 📊 Product Data Summary

All data extracted from your Word documents in RM and FG folders:

**Raw Materials:**
- RM2506001_Methanol.doc → 11 test parameters
- RM2506002_Methylene Chloride.doc → 6 test parameters
- RM2506004_Acetone.doc → 7 test parameters

**Finish Goods:**
- 11 .docx files → 175 test parameters total

**Grand Total:** 199 test parameters across 14 products

---

## 🔐 All Login Accounts

| Username | Password | Role |
|----------|----------|------|
| admin | ccpl@2024 | Administrator |
| qc_manager | qcmanager123 | QC Manager |
| qc_analyst1 | analyst001 | QC Analyst 1 |
| qc_analyst2 | analyst002 | QC Analyst 2 |
| lab_tech | labtech2024 | Lab Technician |

---

## ✨ Key Features Working

- ✅ Login authentication
- ✅ Raw Material dropdown (3 chemicals)
- ✅ Finish Goods search dropdown (11 products)
- ✅ Auto-expiry calculation (3 years)
- ✅ Real-time validation (Green=pass, Red=fail)
- ✅ PDF generation
- ✅ Mobile responsive
- ✅ Exact specifications from your documents

---

## 📁 Important Files

- **START-SERVER.command** - Double-click to start
- **login.html** - Login page (access via http://localhost:8000/login.html)
- **index.html** - Main application
- **data/rm-products.json** - 3 RM products
- **data/fg-products.json** - 11 FG products
- **HOW-TO-START.txt** - Detailed startup instructions
- **DEPLOYMENT_GUIDE.md** - How to deploy to Vercel

---

## 🌐 Deploy to Vercel (When Ready)

See **DEPLOYMENT_GUIDE.md** for complete instructions.

Quick version:
1. Go to https://vercel.com
2. Sign up/login
3. Drag and drop this entire folder
4. Click "Deploy"
5. Your site will be live!

---

## ✅ Checklist

- [ ] Server started (Terminal shows "Serving HTTP on port 8000")
- [ ] Browser opened to http://localhost:8000/login.html
- [ ] Logged in with admin / ccpl@2024
- [ ] Tested Raw Material dropdown - saw 3 products
- [ ] Tested Finish Goods search - saw 11 products
- [ ] Entered sample data and saw validation (green/red)
- [ ] Generated PDF successfully
- [ ] Ready to deploy to Vercel!

---

**Everything is ready! Just start the server and access via http://localhost:8000/login.html**
