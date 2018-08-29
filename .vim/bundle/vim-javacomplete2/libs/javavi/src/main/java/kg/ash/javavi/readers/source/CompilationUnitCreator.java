package kg.ash.javavi.readers.source;

import com.github.javaparser.JavaParser;
import com.github.javaparser.TokenMgrException;
import com.github.javaparser.ast.CompilationUnit;
import kg.ash.javavi.apache.logging.log4j.LogManager;
import kg.ash.javavi.apache.logging.log4j.Logger;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.StringReader;

public class CompilationUnitCreator {

    public static final Logger logger = LogManager.getLogger();

    public static CompilationUnit createFromFile(String fileName) {
        try {
            return JavaParser.parse(new FileReader(fileName));
        } catch (TokenMgrException | FileNotFoundException e) {
            logger.error(e, e);
            return null;
        }
    }

    public static CompilationUnit createFromContent(String content) {
        try {
            return JavaParser.parse(new StringReader(content));
        } catch (TokenMgrException e) {
            logger.error(e, e);
            return null;
        }
    }

}
