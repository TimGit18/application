package de.domain.application.config;

import static org.junit.jupiter.api.Assertions.assertEquals;

// Notwendig wegen JUnit 5
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;


public class ApplicationConfigTest {

    private static ApplicationConfig config;

    @BeforeAll
    public static void setUp() throws Exception {
        // Lade die Konfiguration aus der Datei application.properties
        config = ApplicationConfig.load(Paths.get(System.getProperty("user.dir"), "properties", "application.properties"));
    }

    @Test
    public void testGetErrorHost() {
        assertEquals("Kein Computername definiert", config.getErrorHost());
    }

    @Test
    public void testGetLogPathMeta() {
        assertEquals("C:\\Users\\TSZ\\Daten\\Java\\Applications\\application\\logs", config.getLogPathMeta());
    }

    @Test
    public void testGetLogPathPrivat() {
        assertEquals("C:\\Users\\Privat\\Daten\\Java\\Applications\\application\\logs", config.getLogPathPrivat());
    }

    @Test
    public void testGetLogPathSchmi() {
        assertEquals("C:\\Users\\schmi\\Daten\\Java\\Applications\\application\\logs", config.getLogPathSchmi());
    }

    @Test
    public void testGetLogPathTest() {
        assertEquals("C:\\Users\\test\\Daten\\Java\\Applications\\application\\logs", config.getLogPathTest());
    }

    @Test
    public void testGetMetaPC() {
        assertEquals("22H0566", config.getMetaPC());
    }

    @Test
    public void testGetPrivatPC() {
        assertEquals("DESKTOP-3NCAR95", config.getPrivatPC());
    }

    @Test
    public void testGetSchmiPC() {
        assertEquals("DESKTOP-Q6O0UGB", config.getSchmiPC());
    }

    @Test
    public void testGetTestPC() {
        assertEquals("DESKTOP-LERLCJ6", config.getTestPC());
    }
}
