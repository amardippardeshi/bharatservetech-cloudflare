Write-Host ""
Write-Host "================================="
Write-Host "BHARAT SERVE TECH VALIDATOR"
Write-Host "================================="

$totalErrors = 0

Get-ChildItem ../*.html | ForEach-Object {

    $file = $_.FullName
    $name = $_.Name

    Write-Host ""
    Write-Host "Checking: $name"

    $content = Get-Content $file -Raw

    $fileErrors = 0

    if ($content -notmatch "<title>") {
        Write-Host "ERROR Missing TITLE"
        $fileErrors++
    }

    if ($content -notmatch "canonical") {
        Write-Host "ERROR Missing CANONICAL"
        $fileErrors++
    }

    if ($content -notmatch 'aria-label="Primary Navigation"') {
        Write-Host "ERROR Missing NAVIGATION"
        $fileErrors++
    }

    if ($content -notmatch "<main>") {
        Write-Host "ERROR Missing MAIN"
        $fileErrors++
    }

    if ($content -notmatch "<footer>") {
        Write-Host "ERROR Missing FOOTER"
        $fileErrors++
    }

    if ($content -match "PAGE CONTENT|page-url.html") {
        Write-Host "ERROR Placeholder content exists"
        $fileErrors++
    }

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

}
else {

    Write-Host "VALIDATION FAILED"

}

Write-Host "================================="
