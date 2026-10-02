# upload-secrets.ps1
# Script para subir secretos a GitHub Actions para el repositorio ByronMoreno/lilifigurin

$REPO = "ByronMoreno/lilifigurin"
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Configuración de Secretos de GitHub Actions para: $REPO" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# Verificar si GitHub CLI está instalado
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Warning "El comando 'gh' (GitHub CLI) no se encuentra instalado en este equipo."
    Write-Host "Puedes instalarlo ejecutando en PowerShell como Administrador:" -ForegroundColor Yellow
    Write-Host "  winget install --id GitHub.cli" -ForegroundColor Green
    Write-Host "`nO también puedes agregar manualmente estos secretos en GitHub:" -ForegroundColor Yellow
    Write-Host "  https://github.com/$REPO/settings/secrets/actions" -ForegroundColor Cyan
    Write-Host "`nSecretos necesarios:"
    Write-Host "  - VPS_HOST:     161.97.140.245"
    Write-Host "  - VPS_USER:     1803980844"
    Write-Host "  - VPS_SSH_PORT: 1987"
    Write-Host "  - VPS_SSH_KEY:  [Tu contraseña o clave privada SSH]"
    Write-Host "  - GHCR_PATH:    [Tu GitHub Personal Access Token con permiso write:packages]"
    exit 0
}

# Solicitar interactivamente los datos sensibles para no exponerlos en el código de Git
$GHCR_PATH = Read-Host -Prompt "Ingresa tu GitHub Personal Access Token (GHCR_PATH)"
$VPS_SSH_KEY = Read-Host -Prompt "Ingresa la contraseña/llave de tu VPS (VPS_SSH_KEY)"

if (-not $GHCR_PATH -or -not $VPS_SSH_KEY) {
    Write-Error "El token GHCR_PATH y la clave VPS_SSH_KEY son obligatorios para continuar."
    exit 1
}

# 1. Subir variables del VPS al repositorio
Write-Host "`nSubiendo VPS_HOST..." -ForegroundColor Gray
gh secret set VPS_HOST --body "161.97.140.245" -R $REPO

Write-Host "Subiendo VPS_USER..." -ForegroundColor Gray
gh secret set VPS_USER --body "1803980844" -R $REPO

Write-Host "Subiendo VPS_SSH_KEY..." -ForegroundColor Gray
gh secret set VPS_SSH_KEY --body $VPS_SSH_KEY -R $REPO

Write-Host "Subiendo VPS_SSH_PORT..." -ForegroundColor Gray
gh secret set VPS_SSH_PORT --body "1987" -R $REPO

# 2. Subir Token de GitHub para GHCR
Write-Host "Subiendo GHCR_PATH..." -ForegroundColor Gray
gh secret set GHCR_PATH --body $GHCR_PATH -R $REPO

Write-Host "`n¡Proceso de carga de secretos completado con éxito para $REPO!" -ForegroundColor Green
