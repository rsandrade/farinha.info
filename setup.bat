@echo off
setlocal

echo 📦 Clonando projeto...
if not exist "farinha" (
    git clone https://gitlab.com/yndexa/farinha/farinha.git
)
cd farinha

echo 🛠️  Verificando Docker...
where docker >nul 2>nul
if errorlevel 1 (
    echo ❌ Docker não está instalado. Instale o Docker Desktop antes de continuar.
    pause
    exit /b 1
)

echo 🚀 Rodando ambiente com run.bat...
call run.bat

endlocal
