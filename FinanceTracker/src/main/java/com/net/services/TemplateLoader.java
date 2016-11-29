package main.java.com.net.services;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 * Created by Max on 27.11.2016.
 */
public class TemplateLoader {

    private static final String EMPTY_STRING = "";
    private static final String TEMPLATE_FORMAT = ".tpl";
    private static final String TEMPLATES_PATH = "G:\\IdeaProjects\\FinanceTracker\\web\\pages\\templates\\";

    public static String loadTemplate(String filename) {
        StringBuilder result = new StringBuilder(EMPTY_STRING);
        try (BufferedReader reader = new BufferedReader(new FileReader(TEMPLATES_PATH + filename + TEMPLATE_FORMAT))) {
            String tmpString;
            while ( (tmpString = reader.readLine()) != null ) {
                result.append(tmpString);
            }
        }
        catch (IOException exception) {
            exception.printStackTrace();
        }
        catch (Exception exception) {
            exception.printStackTrace();
        }

        return result.toString();
    }

}
