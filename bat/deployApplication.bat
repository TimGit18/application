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
    call :set_destination_paths

    :: Kopieren der Build-Dateien in die Zielumgebung
    call :copy_files

    :: Erzeugen der JAR-Datei der Anwendung in der Zielumgebung
    call :create_jar_file

    exit /b

:: ===================
:: Projektpfade setzen
:: ===================
:set_project_paths

    :: Pfade zum Build der Anwendung in der Projektumgebung
    set "projects_root=C:\Users\schmi\Daten\Java\Projects"
    set "app_dir=%projects_root%\application"
    set "build_dir=%app_dir%\build"
    set "build_production_dir=%build_dir%\production"

    :: Properties-Pfade
    set "properties_dir=%app_dir%\properties"
    set "log4j2_xml_file=%properties_dir%\log4j2.xml"
    set "application_properties_file=%properties_dir%\application.properties"

    :: Meta-Pfad
    set "meta_dir=%app_dir%\META-INF"
    set "manifest_file=%meta_dir%\MANIFEST.MF"

    echo set_project_paths...
    echo %projects_root%
    echo %app_dir%
    echo %build_dir%
    echo %build_production_dir%
    echo %properties_dir%
    echo %log4j2_xml_file%
    echo %application_properties_file%
    echo %meta_dir%
    echo %manifest_file%

    exit /b

:: ================
:: Zielpfade setzen
:: ================
:set_destination_paths

    :: Pfade zum Build der Anwendung in der Zielumgebung
    set "dest_root=C:\Users\schmi\Daten\Java\Applications"
    set "dest_app_dir=%dest_root%\application"
    set "dest_app_jar_file=%dest_app_dir%\application.jar"
    set "dest_build_dir=%dest_app_dir%\build"

    :: Properties-Pfade und Meta-Pfade in der Zielumgebung
    set "dest_properties_dir=%dest_app_dir%\properties"
    set "dest_meta_dir=%dest_app_dir%\META-INF"
    set "dest_manifest_file=%dest_meta_dir%\MANIFEST.MF"

    echo set_destination_paths...
    echo %dest_root%
    echo %dest_app_dir%
    echo %dest_app_jar_file%
    echo %dest_build_dir%
    echo %dest_properties_dir%
    echo %dest_meta_dir%
    echo %dest_manifest_file%

    exit /b

:: =================
:: Dateien kopieren
:: =================
:copy_files

    :: Kopieren der Build-Dateien in die Zielumgebung
    xcopy "%build_production_dir%\*" "%dest_build_dir%\" /s /y /i

    :: Kopieren der Properties-Dateien in die Zielumgebung
    xcopy "%properties_dir%\*" "%dest_properties_dir%\" /s /y /i

    :: Kopieren der Meta-Dateien in die Zielumgebung
    xcopy "%meta_dir%\*" "%dest_meta_dir%\" /s /y /i

    echo copy_files...
    echo %build_production_dir%
    echo %dest_build_dir%
    echo %properties_dir%
    echo %dest_properties_dir%
    echo %meta_dir%
    echo %dest_meta_dir%

    exit /b

:: ==============================================
:: Erzeugen der Archive-Datei (JAR) der Anwendung
:: ==============================================
:create_jar_file

    :: Erzeugen der JAR-Datei der Anwendung in der Zielumgebung
    jar cfm "%dest_app_jar_file%" "%dest_manifest_file%" -C "%dest_build_dir%" .

    echo create_jar_file...
    echo %dest_app_jar_file%
    echo %dest_manifest_file%
    echo %dest_build_dir%

    exit /b

