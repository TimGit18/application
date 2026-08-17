package de.domain.application.bootstrap;

/**
 * Die Klasse ApplicationStart ist die Startklasse der Anwendung. Sie fungiert als Wrapper im Paket Bootstrap, das
 * die Urlaudung der Anwendung vornimmt.
 */
public class ApplicationStart {

    // Hauptmethode der Startklasse
    public static void main(String[] args) {
        System.out.println("Hello Application - ApplicationStart");
        new ApplicationBootstrap().run();
    }
}
