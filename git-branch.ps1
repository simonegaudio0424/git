param (
    [Parameter(Mandatory=$false)]
    [string]$BranchName
)

# Se il nome del branch non viene fornito, chiedilo
if (-not $BranchName) {
    $BranchName = Read-Host "Inserisci il nome del nuovo branch"
}

# Se è ancora vuoto, esci
if (-not $BranchName) {
    Write-Host "Errore: Devi specificare un nome per il branch." -ForegroundColor Red
    exit
}

Write-Host "--- Creazione Branch ---" -ForegroundColor Cyan

# 1. Creazione e switch al nuovo branch
Write-Host "Creazione del branch '$BranchName'..."
git checkout -b $BranchName

# 2. Push del branch sul remoto per tracciarlo
Write-Host "Pubblicazione del branch sul remoto..."
git push -u origin $BranchName

Write-Host "--- Branch '$BranchName' creato e sincronizzato! ---" -ForegroundColor Green
