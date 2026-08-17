package de.domain.application.core;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ControlService {

    private final Logger log;

    public ControlService() {
        this.log = LogManager.getLogger(ControlService.class);
    }

    // Hauptmethode der Anwendungssteuerung
    public void run() {
        start();
        process();
        complete();
    }

    // Starten
    public void start() {
        log.trace("Starten der Anwendungssteuerung");
    }

    // Verarbeiten
    public void process() {
        log.trace("Verarbeiten der Anwendungssteuerung");
        log.trace("Aktueller Benutzer: "+ System.getProperty("user.name"));
    }

    // Beenden
    public void complete() {
        log.trace("Beenden der Anwendungssteuerung");
    }
}


