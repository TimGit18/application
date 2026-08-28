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

        :: Arbeitsverzeichnis auf application setzen
        cd /d "%app_dir%"

        :: Ausführen der Testklassen
        call :run_test_class
        exit /b

    :: ===================
    :: Projektpfade setzen
    :: ===================
    :set_project_paths

        set "project_root=C:\Users\schmi\Daten\Java\Projects"
        set "app_dir=%project_root%\application"
        set "build_dir=%app_dir%\build"
        set "build_production_dir=%build_dir%\production"
        set "build_test_dir=%build_dir%\test"
        set "test_output=%build_test_dir%\test-output"

        echo set_project_paths...
        echo %project_root%
        echo %app_dir%
        echo %build_dir%
        echo %build_production_dir%
        echo %build_test_dir%

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

    :: =========================
    :: Ausführen der Testklassen
    :: =========================
    :run_test_class

        java -jar "%junit_console_standalone_api_jar%" ^
            -cp "%build_production_dir%;%build_test_dir%" ^
            --scan-class-path ^
            --reports-dir="%test_output%"

        exit /b

