$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "C:\Users\sarem\Desktop\Смирнов\МДК 05.02\Практики\HTML CSS\ПЗ 01\repo"
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

$action = {
    cd "C:\Users\sarem\Desktop\Смирнов\МДК 05.02\Практики\HTML CSS\ПЗ 01\repo"
    git add .
    git commit -m "Auto-commit: файл сохранён в $(Get-Date -Format 'HH:mm:ss')"
    git push
    Write-Host "✅ Залито на GitHub в $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Green
}

Register-ObjectEvent $watcher "Changed" -Action $action
Register-ObjectEvent $watcher "Created" -Action $action
Register-ObjectEvent $watcher "Deleted" -Action $action

Write-Host "🔍 Отслеживаю изменения. Нажми Ctrl+C для остановки." -ForegroundColor Yellow
while ($true) { Start-Sleep -Seconds 1 }