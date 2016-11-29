package main.java.com.net.finance_tracker.servlet;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Max on 26.11.2016.
 */
public class SiteServlet extends HttpServlet {

    //Курс валют
    //https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+"USDRUB,EURRUB"&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
    //Насдак
    //http://finance.google.com/finance/info?client=ig&q=NASDAQ:FB

    private void openPage(String URI, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (request.getRequestURL() != null) {
                if (URI != null) {
                    getServletContext().getRequestDispatcher("/pages/" + URI + ".jsp").forward(request, response);
                } else {
                    getServletContext().getRequestDispatcher("index" + ".jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("/pages/error.html");
            }
        }
        catch (ServletException exception) {
            exception.getStackTrace();
        }
        catch (IOException exception) {
            exception.getStackTrace();
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("button") != null) {
            //openPage(request.getRequestURI(),request,response);
        }
        else {
            openPage(request.getRequestURI(),request,response);
        }

        //response.sendRedirect("/pages/error.html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException{

    }


}
