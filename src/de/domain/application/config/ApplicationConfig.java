package de.domain.application.config;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;

public class ApplicationConfig {

    // Schlüssel für die Konfigurationswerte
    private static final String KEY_ERROR_HOST = "error.host";
    private static final String KEY_LOG_PATH_META = "logpath.meta";
    private static final String KEY_LOG_PATH_PRIVAT = "logpath.privat";
    private static final String KEY_LOG_PATH_SCHMI = "logpath.schmi";
    private static final String KEY_LOG_PATH_TEST = "logpath.test";
    private static final String KEY_META_PC = "meta.pc";
    private static final String KEY_PRIVAT_PC = "privat.pc";
    private static final String KEY_SCHMI_PC = "schmi.pc";
    private static final String KEY_TEST_PC = "test.pc";

    // Private Instanzvariablen
    private final String errorHost;
    private final String logPathMeta;
    private final String logPathPrivat;
    private final String logPathSchmi;
    private final String logPathTest;
    private final String metaPC;
    private final String privatPC;
    private final String schmiPC;
    private final String testPC;


    /**
     * Konstruktor der Klasse ApplicationConfig. Er lädt die Konfiguration aus der Datei application.properties und
     * initialisiert die Instanzvariablen.
     * @param properties Eigenschaften-Datei
     */
    private ApplicationConfig(Properties properties) {
        this.errorHost = properties.getProperty(KEY_ERROR_HOST);
        this.logPathMeta = getRequired(properties, KEY_LOG_PATH_META);
        this.logPathPrivat = getRequired(properties, KEY_LOG_PATH_PRIVAT);
        this.logPathSchmi = getRequired(properties, KEY_LOG_PATH_SCHMI);
        this.logPathTest = getRequired(properties, KEY_LOG_PATH_TEST);
        this.metaPC = getRequired(properties, KEY_META_PC);
        this.privatPC = getRequired(properties, KEY_PRIVAT_PC);
        this.schmiPC = getRequired(properties, KEY_SCHMI_PC);
        this.testPC = getRequired(properties, KEY_TEST_PC);
    }

    /**
     * Getter für die Klasse ApplicationConfig. Die Funktionen geben den Wert des entsprechenden Properties zurück.
     * Die Werte wurden bereits beim Aufruf des Konstruktors befüllt.
     * @return eigentliche Properties
     */
    public String getErrorHost()   {
        return errorHost;
    }

    public String getLogPathMeta() {
        return logPathMeta;
    }

    public String getLogPathPrivat() {
        return logPathPrivat;
    }

    public String getLogPathSchmi() {
        return logPathSchmi;
    }

    public String getLogPathTest() {
        return logPathTest;
    }

    public String getMetaPC() {
        return metaPC;
    }

    public String getPrivatPC() {
        return privatPC;
    }

    public String getSchmiPC() {
        return schmiPC;
    }

    public String getTestPC() {
        return testPC;
    }

    /**
     * Die Methode getRequired() ermittelt zu einem übergebenen Key den entsprechenden Value aus der übergebenen
     * Properties-Datei. Sollte der Key nicht vorhanden sein oder der Value leer sein, wird eine IllegalStateException
     * geworfen.
     * @param properties Properties-Objekt, aus dem der Wert ermittelt werden soll
     * @param key Key zum Auslesen
     * @return  Der Wert zum übergebenen Key, falls vorhanden und nicht leer
     */
    private static String getRequired(Properties properties, String key) {
        String value = properties.getProperty(key);
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalStateException("Pflicht-Property fehlt oder ist leer: " + key);
        }
        return value.trim();
    }

    /**
     * Die Methode load() lädt die Konfiguration aus der übergebenen Datei und gibt eine Instanz von ApplicationConfig
     * zurück. Sollte die Datei nicht gefunden werden oder ein Fehler beim Laden auftreten, wird eine
     * IllegalStateException geworfen.
     * @param propertiesPath Pfad zur Properties-Datei
     * @return ApplicationConfig
     */
    public static ApplicationConfig load(Path propertiesPath) {
        Properties properties = new Properties();

        try (InputStream inputStream = Files.newInputStream(propertiesPath)) {
            properties.load(inputStream);
        } catch (IOException ioException) {
            throw new IllegalStateException("Konnte Konfiguration nicht laden: " + propertiesPath, ioException);
        }

        return new ApplicationConfig(properties);
    }

    /**
     * Die Methode loadDefault() lädt eine komplette ApplicationConfiguration aus der Standarddatei application.properties im
     * Verzeichnis properties des aktuellen Arbeitsverzeichnisses. Sollte die Datei nicht gefunden werden oder ein
     * Fehler beim Laden auftreten, wird eine IllegalStateException (siehe Methode load()) geworfen.
     * @return ApplicationConfig
     */
    public static ApplicationConfig loadDefault() {
        Path defaultPath = Paths.get(System.getProperty("user.dir"), "properties", "application.properties");
        return load(defaultPath);
    }


}
