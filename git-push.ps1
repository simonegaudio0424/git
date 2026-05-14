param (
    [Parameter(Mandatory=$false)]
    [string]$Message
)

# Se il messaggio non viene fornito come argomento, chiedilo all'utente
if (-not $Message) {
    $Message = Read-Host "Inserisci il messaggio del commit"
}

# Se il messaggio è ancora vuoto, usa un default
if (-not $Message) {
    $Message = "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}

Write-Host "--- Inizio procedura Git ---" -ForegroundColor Cyan

# 1. Add
Write-Host "Aggiunta file..."
git add .

# 2. Commit
Write-Host "Esecuzione commit con messaggio: '$Message'..."
git commit -m $Message

# 3. Push
Write-Host "Invio al repository remoto..."
git push

Write-Host "--- Operazione completata! ---" -ForegroundColor Green
