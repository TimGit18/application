package de.domain.application.bootstrap;

import de.domain.application.config.ApplicationConfig;
import de.domain.application.core.ControlService;
import de.domain.application.logging.LogPathResolver;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Die Klasse ApplicationBootstrap ist die Urladung der Anwendung. Sie initiiert den Umgebungskontext und löst aus
 * diesem den Host-Namen und den Logging-Pfad auf. Beide Resolver sind private Felder der Urladung und werden durch
 * den Konstruktor initialisiert.
 */
public class ApplicationBootstrap {

    // Resolver als private Felder der Urladung
    private final HostNameResolver hostNameResolver;
    private final LogPathResolver logPathResolver;

    // Konstruktor der Urladung initialisiert die Urladung
    public ApplicationBootstrap() {
        this(new HostNameResolver(), new LogPathResolver());
    }

    // Initialisierung der Felder
    ApplicationBootstrap(HostNameResolver hostNameResolver, LogPathResolver logPathResolver) {
        this.hostNameResolver = hostNameResolver;
        this.logPathResolver = logPathResolver;
    }

    /**
     * Die parameterlose Methode run() lädt die Anwendungskonfiguration und den Host-Namen und bestimmt hieraus den
     * Logging-Pfad der Anwendung. Anschließend ruft die Methode den so instanziierten Logger auf und übergibt die
     * Anwendungssteuerung an den Control-Service.
     */
    public void run() {
        // Laden der Anwendungskonfiguration
        System.out.println("Hello Application - ApplicationBootstrap");
        ApplicationConfig config = ApplicationConfig.loadDefault();

        // Ermitteln von Host-Namen und Logging-Pfad
        String computerName = hostNameResolver.resolve();
        String logPath = logPathResolver.resolve(computerName, config);

        // Instanziierung des Loggers
        System.setProperty("log.path", logPath);
        Logger LOG = LogManager.getLogger(ApplicationBootstrap.class);
        LOG.trace("LogPath: {}", logPath);

        // Übergabe der Anwendungssteuerung an den Control-Service
        ControlService controlService = new ControlService();
        controlService.run();
    }
}

