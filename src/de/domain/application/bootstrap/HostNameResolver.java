package de.domain.application.bootstrap;

import java.io.IOException;
import java.net.InetAddress;
import java.util.Objects;

/**
 * Die Klasse HostNameRespolver löst den Host-Namen aus der IP-Adresse der Plattform aus. Dazu löst sie zunächst die
 * lokale Host-Adresse aus der IP-Adresse und ermittelt dann über ein Funtkonales Interface den Host-Namen aus der
 * lokalen Host-Adresse.
 */

public class HostNameResolver {

    // Funktinales Interface als privates Feld
    private final LocalHostProvider localHostProvider;

    // Konstruktor HostNameResolver initialilsiert den Host-Kontext
    public HostNameResolver() {
        this(InetAddress::getLocalHost);
    }

    // Initialisierung des funktionalen Interface localHostProvider
    HostNameResolver(LocalHostProvider localHostProvider) {
        this.localHostProvider = Objects.requireNonNull(localHostProvider, "localHostProvider");
    }

    /**
     * Die Methode resolve() löst den Host-Namen aus dem Interface localHostProvider.
     * @return hostNamen
     */
    public String resolve() {
        try {
            return localHostProvider.getLocalHost().getHostName();
        } catch (IOException ioException) {
            throw new IllegalStateException("Konnte lokalen Hostnamen nicht ermitteln", ioException);
        }
    }

    /**
     * Die funktionale Schnittstelle LocalHostProvider enthält genau eine abstrakte Methode getLocalHost() vom
     * Typ InetAdress.
     */
    @FunctionalInterface
    interface LocalHostProvider {
        InetAddress getLocalHost() throws IOException;
    }
}
