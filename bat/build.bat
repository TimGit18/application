@echo off

rem ==============
rem Programmablauf
rem ==============
call :main
    exit /b

rem ============
rem Hauptroutine
rem ============
:main
    call :set_project_paths
    call :set_source_code_paths
    exit /b

rem ============
rem Projektpfade
rem ============
:set_project_paths
    set "projects_root=C:\Users\schmi\Daten\Java\Projects"
    set "app_dir=%projects_root%\application"
    set "build_dir=%app_dir%\build"
    set "build_logs_dir=%app_dir%\build_logs"

    echo set_project_paths...
    echo %projects_root%
    echo %app_dir%
    echo %build_dir%
    echo %build_logs_dir%

    exit /b

rem ===============
rem Quellcode-Pfade
rem ===============
:set_source_code_paths
    set "source_root=%app_dir%\src\de\domain\application"
    set "bootstrap_dir=%source_root%\bootstrap"
    set "config_dir=%source_root%\config"
    set "core_dir=%source_root%\core"
    set "logging_dir=%source_root%\logging"

    echo set_source_code_paths...
    echo %source_root%
    echo %bootstrap_dir%
    echo %config_dir%
    echo %core_dir%
    echo %logging_dir%

    exit /b
    
