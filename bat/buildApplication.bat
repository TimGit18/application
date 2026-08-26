@echo off

:: ==============================================
:: Programmablauf steuert die einzelnen Routinen
:: ==============================================
call :main

    exit /b

:: ============================================
:: Hauptroutine ruft die einzelnen Routinen auf
:: ============================================
:main

    :: Vorbereitung der Build-Umgebung
    call :set_project_paths
    call :set_source_code_paths
    call :set_library_paths
    call :set_cleanup_build

    :: Kompilierung der Klassen
    call :compile_config
    call :compile_logging
    call :compile_control
    call :compile_bootstrap
    call :compile_core

    exit /b

:: ===================
:: Projektpfade setzen
:: ===================
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

:: ======================
:: Quellcode-Pfade setzen
:: ======================
:set_source_code_paths

    set "source_root=%app_dir%\src\de\domain\application"
    set "bootstrap_dir=%source_root%\bootstrap"
    set "config_dir=%source_root%\config"
    set "core_dir=%source_root%\core"
    set "control_dir=%source_root%\control"
    set "logging_dir=%source_root%\logging"

    echo set_source_code_paths...
    echo %source_root%
    echo %bootstrap_dir%
    echo %config_dir%
    echo %control_dir%
    echo %logging_dir%

    exit /b
    
:: ====================
:: Library-Pfade setzen
:: ====================
:set_library_paths

    set "libs_root=C:\Users\schmi\Daten\Java\Libraries"
    set "log4j_dir=%libs_root%\apache-log4j-2.25.3-bin"
    set "log4j_api_jar=%log4j_dir%\log4j-api-2.25.3.jar"
    set "log4j_core_jar=%log4j_dir%\log4j-core-2.25.3.jar"

    echo set_library_paths...
    echo %libs_root%
    echo %log4j_dir%
    echo %log4j_api_jar%
    echo %log4j_core_jar%

    exit /b

:: ==============================
:: Build-Verzeichnis neu aufbauen
:: ==============================
 :set_cleanup_build

     :: Build-Verzeichnis löschen und neu erstellen
     echo set_cleanup_build...
     rmdir /s /q %build_dir%
     if not exist "%build_dir%" (
         mkdir "%build_dir%"
     )

     echo %build_dir%
     exit /b

:: ============================================================================================================
:: Config-Verzeichnis kompilieren
:: Log4J-Bibiliotheken werden hier noch nicht benötigt, da die Config-Klassen keine Log4J-Klassen referenzieren
:: ============================================================================================================
:compile_config
    echo compile_config...
    javac -verbose -encoding utf8 %config_dir%\*java -d %build_dir% -cp %build_dir%

    echo %config_dir%
    exit /b

:: ============================================================================================================
:: Logging-Verzeichnis kompilieren
:: Log4J-Bibiliotheken werden hier benötigt, da die Logging-Klassen Log4J-Klassen referenzieren
:: ============================================================================================================
:compile_logging
    echo compile_logging...
    javac -verbose -encoding utf8 %logging_dir%\*java -d %build_dir% -cp %build_dir%;%log4j_api_jar%;%log4j_core_jar%

    echo %logging_dir%
    exit /b

:: ============================================================================================================
:: Control-Verzeichnis kompilieren
:: Log4J-Bibiliotheken werden hier benötigt, da die Control-Klassen Log4J-Klassen referenzieren
:: ============================================================================================================
:compile_control
    echo compile_control...
    javac -verbose -encoding utf8 %control_dir%\*java -d %build_dir% -cp %build_dir%;%log4j_api_jar%;%log4j_core_jar%

    echo %control_dir%
    exit /b

:: ============================================================================================================
:: Bootstrap-Verzeichnis kompilieren
:: Log4J-Bibiliotheken werden hier benötigt, da die Bootstrap-Klassen Log4J-Klassen referenzieren
:: ============================================================================================================
:compile_bootstrap
    echo compile_bootstrap...
    javac -verbose -encoding utf8 %bootstrap_dir%\*java -d %build_dir% -cp %build_dir%;%log4j_api_jar%;%log4j_core_jar%

    echo %bootstrap_dir%
    exit /b

:: ============================================================================================================
:: Core-Verzeichnis kompilieren
:: Log4J-Bibiliotheken werden hier benötigt, da die Core-Klassen Log4J-Klassen referenzieren
:: ============================================================================================================
 :compile_core
    echo compile_core...
    javac -verbose -encoding utf8 %core_dir%\*java -d %build_dir% -cp %build_dir%;%log4j_api_jar%;%log4j_core_jar%

    echo %core_dir%
    exit /b
