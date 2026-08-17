package de.domain.application.core;

/**
 * Die Klasse ApplicationMain ist die Hauptklasse der Anwendung. Sie wird nur einmalig beim Ausführen der
 * Anwendung aufgerufen und lädt die Startklasse ApplicationStart.
 */
public class ApplicationMain {

    // Hauptmethode der Anwendung
    public static void main(String[] args) {
        System.out.println("Hello Application - Main");
        de.domain.application.bootstrap.ApplicationStart.main(args);
    }

}
