package de.domain.application.config;

import static org.junit.jupiter.api.Assertions.assertEquals;

// Notwendig wegen JUnit 5
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.nio.file.Path;
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

    /**
    @Test
    public void testGetLogPathMeta() {
        assertEquals("/path/to/meta/logs", config.getLogPathMeta());
    }

    @Test
    public void testGetLogPathPrivat() {
        assertEquals("/path/to/privat/logs", config.getLogPathPrivat());
    }

    @Test
    public void testGetLogPathSchmi() {
        assertEquals("/path/to/schmi/logs", config.getLogPathSchmi());
    }

    @Test
    public void testGetLogPathTest() {
        assertEquals("/path/to/test/logs", config.getLogPathTest());
    }

    @Test
    public void testGetMetaPC() {
        assertEquals("metaPCValue", config.getMetaPC());
    }

    @Test
    public void testGetPrivatPC() {
        assertEquals("privatPCValue", config.getPrivatPC());
    }

    @Test
    public void testGetSchmiPC() {
        assertEquals("schmiPCValue", config.getSchmiPC());
    }

    @Test
    public void testGetTestPC() {
        assertEquals("testPCValue", config.getTestPC());
    }*/



}
