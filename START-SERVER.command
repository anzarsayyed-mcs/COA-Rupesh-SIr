#!/bin/bash

# Navigate to the script's directory
cd "$(dirname "$0")"

echo "========================================="
echo "  COA GENERATOR - STARTING SERVER"
echo "========================================="
echo ""
echo "Server will start on: http://localhost:8000"
echo ""
echo "INSTRUCTIONS:"
echo "1. Keep this window open"
echo "2. Open your browser"
echo "3. Go to: http://localhost:8000/login.html"
echo ""
echo "Login with: admin / ccpl@2024"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""
echo "========================================="
echo ""

# Start Python web server
python3 -m http.server 8000
