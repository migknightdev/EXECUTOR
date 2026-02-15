@echo off
title executor
color 0A

:: ===============================
:: CONFIGURACAO BASE
:: ===============================
set "baseDir=C:\Users\Pichau\OneDrive\Documents"

:boot
cls
echo ==========================================
echo              EXECUTOR v1.0
echo ==========================================
timeout /t 1 >nul
echo CRIADO POR: SysKore
timeout /t 1 >nul
echo FEITO COM: .bat
timeout /t 1 >nul
echo VERSAO: 1.0
timeout /t 1 >nul
echo APROVEITE...
timeout /t 1 >nul

cls
title EXECUTOR - Terminal Seguro
echo ===================================================
echo             TERMINAL DE ARQUIVOS
echo ===================================================
echo.
echo Diretorio raiz:
echo %baseDir%
echo.
echo Pastas disponiveis:
echo ---------------------------------------
dir "%baseDir%" /ad /b
echo ---------------------------------------
echo.

set /p pasta=Digite o nome da pasta para acessar: 

cd /d "%baseDir%\%pasta%" 2>nul

if errorlevel 1 (
    echo.
    echo ERRO: Diretorio nao encontrado.
    echo Acesso negado.
    timeout /t 2 >nul
    pause
    goto boot
)

:: ===============================
:: MENU ARQUIVOS
:: ===============================
:menuArquivos
cls
title EXECUTOR - %pasta%

echo ===================================================
echo        CONEXAO ESTABELECIDA COM:
echo                %pasta%
echo ===================================================
echo.
echo Caminho atual:
echo %cd%
echo.
echo Banco de dados ONLINE.
echo.
echo Arquivos encontrados:
echo ---------------------------------------

setlocal enabledelayedexpansion
set count=0

for %%f in (*) do (
    set /a count+=1
    set "file!count!=%%f"
    echo !count! - %%f
)

if !count! EQU 0 (
    echo Nenhum arquivo encontrado.
    pause
    endlocal
    goto menuArquivos
)

echo ---------------------------------------
echo.
set /p escolha=Digite o numero do arquivo: 

set "arquivoSelecionado=!file%escolha%!"

if "!arquivoSelecionado!"=="" (
    echo Arquivo invalido.
    timeout /t 2 >nul
    endlocal
    goto menuArquivos
)

:: ===============================
:: MENU COMANDOS
:: ===============================
:menuComandos
cls
echo ===================================================
echo Arquivo selecionado: !arquivoSelecionado!
echo ===================================================
echo.
echo Comandos disponiveis:
echo 1 - Executar com Node
echo 2 - Editar com VSC
echo 3 - Deletar [PROTEGIDO]
echo 4 - Voltar
echo.
set /p cmdEscolha=Digite o numero do comando: 


if "%cmdEscolha%"=="1" (
    node "!arquivoSelecionado!"
    pause
    goto menuComandos
)

if "%cmdEscolha%"=="2" (
    code "!arquivoSelecionado!"
    goto menuComandos
)

if "%cmdEscolha%"=="3" (
    echo.
    set /p senha=Digite a senha administrativa: 
    if "%senha%"=="101578" (
        del "!arquivoSelecionado!"
        echo Arquivo deletado com sucesso.
    ) else (
        echo SENHA INCORRETA. Acesso negado.
    )
    timeout /t 2 >nul
    endlocal
    goto menuArquivos
)

if "%cmdEscolha%"=="4" (
    endlocal
    goto menuArquivos
)

goto menuComandos

