package de.domain.application.logging;

import de.domain.application.config.ApplicationConfig;
import java.nio.file.InvalidPathException;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Die Klasse LogPathResolver ermittelt den Logging-Pfad in Abhängigkeit zu dem Hostnamen. Die Zuordnung erfolgt
 * aufgrund der bis dahin ermittelten Werte aus der Anwendungskonfiguration.
 */
public class LogPathResolver {

    /**
     * Die Methode resolve() ermittelt aus Hostnamen und Konfiguration den Logging-Pfad.
     * @param computerName übergebener Hostname
     * @param config übergebene Anwendungskonfiguration
     * @return Logging-Pfad
     */
    public String resolve(String computerName, ApplicationConfig config) {
        if (config.getMetaPC().equals(computerName)) {
            return normalize(config.getLogPathMeta());
        }
        if (config.getPrivatPC().equals(computerName)) {
            return normalize(config.getLogPathPrivat());
        }
        if (config.getSchmiPC().equals(computerName)) {
            return normalize(config.getLogPathSchmi());
        }
        if (config.getTestPC().equals(computerName)) {
            return normalize(config.getLogPathTest());
        }
        throw new IllegalStateException(config.getErrorHost() + ": " + computerName);
    }

    /**
     *  Die Methode normaliz() benutzt Path.normalize(), um einen neuen Pfad ohne redundante Namens-Elemente zu
     *  ermitteln.
     */
    private String normalize(String rawPath) {
        try {
            Path path = Paths.get(rawPath).normalize();
            return path.toString();
        } catch (InvalidPathException invalidPathException) {
            throw new IllegalStateException("Ungueltiger Log-Pfad in der Konfiguration: " + rawPath, invalidPathException);
        }
    }
}

