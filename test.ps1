# Define the raw GitHub URL and destination path
$url = "https://raw.githubusercontent.com/Jake1427/Powershell-test/refs/heads/main/test.bat"
$outputPath = "$env:TEMP\test.bat"

Write-Host "Downloading batch file from GitHub..." -ForegroundColor Cyan

try {
    # Download the file using modern .NET web client / Invoke-WebRequest
    Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing
    Write-Host "Download complete! Saved to: $outputPath" -ForegroundColor Green
    
    Write-Host "Launching batch file..." -ForegroundColor Yellow
    # Start the batch file in a new command prompt window
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$outputPath`"" -Wait
    
    Write-Host "Batch execution finished." -ForegroundColor Green
}
catch {
    Write-Host "An error occurred during download or execution: $_" -ForegroundColor Red
}
