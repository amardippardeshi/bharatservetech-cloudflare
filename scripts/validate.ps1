Write-Host ""
Write-Host "================================="
Write-Host "BHARAT SERVE TECH VALIDATOR v2"
Write-Host "================================="

$totalErrors = 0

# ONLY VALIDATE STAGED HTML FILES (IMPORTANT FIX)
$files = git diff --cached --name-only | Where-Object { $_ -like "*.html" }

foreach ($file in $files) {

    Write-Host ""
    Write-Host "Checking: $file"

    if (!(Test-Path $file)) {
        Write-Host "SKIP (file not found locally)"
        continue
    }

    $content = Get-Content $file -Raw

    $fileErrors = 0

    # TITLE CHECK
    if ($content -notmatch "<title>") {
        Write-Host "ERROR Missing TITLE"
        $fileErrors++
    }

    # CANONICAL CHECK
    if ($content -notmatch "canonical") {
        Write-Host "ERROR Missing CANONICAL"
        $fileErrors++
    }

    # NAVIGATION CHECK
    if ($content -notmatch 'aria-label="Primary Navigation"') {
        Write-Host "ERROR Missing NAVIGATION"
        $fileErrors++
    }

    # MAIN CHECK
    if ($content -notmatch "<main>") {
        Write-Host "ERROR Missing MAIN"
        $fileErrors++
    }

    # FOOTER CHECK
    if ($content -notmatch "<footer>") {
        Write-Host "ERROR Missing FOOTER"
        $fileErrors++
    }

    # PLACEHOLDER CHECK
    if ($content -match "PAGE CONTENT|page-url.html") {
        Write-Host "ERROR Placeholder content exists"
        $fileErrors++
    }

    # ENCODING CHECK
    if ($content -match "Â©") {
        Write-Host "ERROR Encoding corruption detected"
        $fileErrors++
    }

    if ($fileErrors -eq 0) {
        Write-Host "PASS Structure Valid"
    }

    $totalErrors += $fileErrors
}

Write-Host ""
Write-Host "================================="

if ($totalErrors -eq 0) {
    Write-Host "ALL VALIDATIONS PASSED"
    exit 0
}
else {
    Write-Host "VALIDATION FAILED"
    exit 1
}

Write-Host "================================="