package kg.ash.javavi.cache;

import kg.ash.javavi.Javavi;
import kg.ash.javavi.apache.logging.log4j.LogManager;
import kg.ash.javavi.apache.logging.log4j.Logger;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Map;

public class CacheSerializator {

    public static final Logger logger = LogManager.getLogger();

    private String base = null;
    private String project = null;

    public CacheSerializator() {
        if (Javavi.system.containsKey("base")) {
            Map<String, String> system = Javavi.system;

            base = system.get("base");
            project = "default";

            if (system.containsKey("project")) {
                project = Javavi.system.get("project");
            }

            File cacheFile = new File(base + File.separator + "cache");
            if (!cacheFile.exists()) {
                cacheFile.mkdir();
            }
        }
    }

    public void saveCache(String name, Object data) {
        if (base != null) {
            try (FileOutputStream fout = new FileOutputStream(
                base + File.separator + "cache" + File.separator + name + "_" + project + ".dat");
                 ObjectOutputStream oos = new ObjectOutputStream(fout)) {
                oos.writeObject(data);
            } catch (Throwable e) {
                logger.error(e);
            }
        }
    }

    public Object loadCache(String name) {
        if (base != null) {
            try (FileInputStream fin = new FileInputStream(
                base + File.separator + "cache" + File.separator + name + "_" + project + ".dat");
                 ObjectInputStream ois = new ObjectInputStream(fin)) {
                return ois.readObject();
            } catch (Throwable e) {
                logger.warn("Couldn't load cache");
            }
        }
        return null;
    }
}
