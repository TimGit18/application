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
    call :set_test_code_paths
    call :set_library_paths

    :: Kompilierung der Klassen
    call :compile_config_test

    exit /b

:: ===================
:: Projektpfade setzen
:: ===================
:set_project_paths

    set "projects_root=C:\Users\schmi\Daten\Java\Projects"
    set "app_dir=%projects_root%\application"
    set "build_dir=%app_dir%\build"
    set "build_production_dir=%build_dir%\production"
    set "build_test_dir=%build_dir%\test"

    echo set_project_paths...
    echo %projects_root%
    echo %app_dir%
    echo %build_dir%
    echo %build_production_dir%
    echo %build_test_dir%

    exit /b

:: ======================
:: Testcode-Pfade setzen
:: ======================
:set_test_code_paths
    set "test_root=%app_dir%\test\de\domain\application"
    set "config_test_dir=%test_root%\config"

    echo set_test_code_paths...
    echo %test_root%
    echo %config_test_dir%

    exit /b

 :: ====================
 :: Library-Pfade setzen
 :: ====================
 :set_library_paths

    set "libs_root=C:\Users\schmi\Daten\Java\Libraries"
    set "junit5_dir=%libs_root%\junit-5"
    set "junit_jupiter_api_jar=%junit5_dir%\junit-jupiter-api-5.6.1.jar"
    set "junit_console_standalone_api_jar=%junit5_dir%\junit-platform-console-standalone-1.7.0-all.jar"

    echo set_library_paths...
    echo %libs_root%
    echo %junit5_dir%
    echo %junit_jupiter_api_jar%
    echo %junit_console_standalone_api_jar%

    exit /b

:: ==================
:: Compile Config Test
:: ==================
:compile_config_test

    javac -verbose -encoding utf8 %config_test_dir%\*java -d %build_test_dir% ^
         -cp %build_production_dir%;%junit_jupiter_api_jar%;%junit_console_standalone_api_jar%

    echo compile_config_test...
    echo %config_test_dir%
    exit /b
