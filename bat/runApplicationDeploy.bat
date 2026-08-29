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
    call :set_destination_paths

    :: Starten der Anwendung
    call :run_jar_file

    exit /b

 :: ======================================
 :: Setzen der Zielpfade für die Anwendung
 :: ======================================
 :set_destination_paths

    :: Pfade zum Aufruf der Anwendung in der Zielumgebung
    set "destination_root=C:\Users\schmi\Daten\Java\Applications"
    set "app_dir=%destination_root%\application"
    set "application_jar_file=%app_dir%\application.jar"
    set "properties_dir=%app_dir%\properties"

    :: Setzen der Log4j2-Konfigurationsdatei für die Anwendung
    set "assignment_log4j2_xml_file=\"log4j.configurationFile=file:///%properties_dir%/log4j2.xml\""

    exit /b

:: =========================
:: Starten der Anwendung
:: =========================
:run_jar_file

    cd /d "%app_dir%"
    java -Dfile.encoding=UTF-8 -jar "%application_jar_file%" -D%assignment_log4j2_xml_file%

    echo run_jar_file...
    echo %application_jar_file%
    echo %assignment_log4j2_xml_file%

    exit /b
