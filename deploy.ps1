# GitHub Pages deploy script
# Create empty repo first: https://github.com/new  ->  ylhu07262-tech.github.io

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

Write-Host "=== Fudan Atmos Portfolio Deploy ===" -ForegroundColor Cyan

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw "Git not found. Install Git for Windows first."
}

Write-Host "Checking network (github.com)..." -ForegroundColor Gray
try {
  $null = Resolve-DnsName github.com -ErrorAction Stop
  Write-Host "DNS OK" -ForegroundColor Green
} catch {
  Write-Host ""
  Write-Host "[ERROR] Cannot resolve github.com (DNS/network issue)." -ForegroundColor Red
  Write-Host "Try these fixes, then run this script again:" -ForegroundColor Yellow
  Write-Host "  1. Open https://github.com in your browser. If it fails, fix network/VPN first."
  Write-Host "  2. Change DNS to 223.5.5.5 or 8.8.8.8 (Settings -> Network -> DNS)."
  Write-Host "  3. If you use a proxy/VPN, enable it and run: git config --global http.proxy http://127.0.0.1:PORT"
  Write-Host "  4. Or upload files manually on GitHub (see README.md)."
  Write-Host ""
  exit 1
}

$remote = "https://github.com/ylhu07262-tech/ylhu07262-tech.github.io.git"

if (-not (git rev-parse --is-inside-work-tree 2>$null)) {
  git init
  git branch -M main
}

git add .
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) {
  git -c user.email="27230227@njnu.edu.cn" -c user.name="Yalan Hu" commit -m "Update portfolio site"
}

git remote remove origin 2>$null
git remote add origin $remote

Write-Host "Pushing to GitHub (browser login may appear on first push)..." -ForegroundColor Yellow
git push -u origin main

Write-Host ""
Write-Host "Done. Visit:" -ForegroundColor Green
Write-Host "https://ylhu07262-tech.github.io/" -ForegroundColor Green
Write-Host ""
Write-Host "If site is blank: repo Settings -> Pages -> Deploy from branch -> main / root" -ForegroundColor Yellow
