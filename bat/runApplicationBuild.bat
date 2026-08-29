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

    :: Vorbereitung der Run-Umgebung
    call :set_project_paths
    call :set_library_paths

    :: Starten der Anwendung
    call :run_main_class
    exit /b

:: ===================
:: Projektpfade setzen
:: ===================
:set_project_paths

    set "project_root=C:\Users\schmi\Daten\Java\Projects"
    set "app_dir=%project_root%\application"
    set "properties_dir=%app_dir%\properties"
    set "build_dir=%app_dir%\build"
    set "build_production_dir=%build_dir%\production"

    echo set_project_paths...
    echo %project_root%
    echo %app_dir%
    echo %properties_dir%
    echo %build_dir%
    echo %build_production_dir%

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

:: =================
:: Run Application
:: =================
:run_main_class

    echo run_main_class...
    cd %app_dir%
    java -cp %build_production_dir%;%properties_dir%;%log4j_api_jar%;%log4j_core_jar% de.domain.application.core.ApplicationMain

    exit /b