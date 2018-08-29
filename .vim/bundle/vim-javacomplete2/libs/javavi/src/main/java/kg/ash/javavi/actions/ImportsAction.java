package kg.ash.javavi.actions;

import com.github.javaparser.ast.CompilationUnit;
import kg.ash.javavi.readers.source.ClassNamesFetcher;
import kg.ash.javavi.readers.source.CompilationUnitCreator;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Set;

public abstract class ImportsAction implements Action {

    protected Set<String> classnames;
    protected CompilationUnit compilationUnit;

    @Override
    public String perform(String[] args) {
        try {
            String base64Content = getContent(args);
            String content = new String(Base64.getDecoder().decode(base64Content), "UTF-8");

            compilationUnit = CompilationUnitCreator.createFromContent(content);
            if (compilationUnit == null) {
                return "Couldn't parse file";
            }

            ClassNamesFetcher classnamesFetcher = new ClassNamesFetcher(compilationUnit);
            classnames = classnamesFetcher.getNames();

            return action();
        } catch (UnsupportedEncodingException ex) {
            return ex.getMessage();
        }
    }

    private String getContent(String[] args) {
        for (int i = 0; i < args.length; i++) {
            if (args[i].equals("-content")) {
                return args[i + 1];
            }
        }
        return "";
    }

    public abstract String action();
}
