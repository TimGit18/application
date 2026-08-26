package de.domain.application.control;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Die Klasse ControlService ist die Anwendungssteuerung. Sie wird von der Urladung aufgerufen und steuert den
 * Ablauf der Anwendung. Die Anwendungssteuerung ist in drei Phasen unterteilt: Starten, Verarbeiten und Beenden.
 * Jede Phase wird durch eine eigene Methode repräsentiert. Die Anwendungssteuerung protokolliert den Ablauf der
 * Anwendung mit Hilfe des Loggers.
 */

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


