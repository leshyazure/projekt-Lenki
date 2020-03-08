import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient = "tkteam@interia.pl";

        String name = request.getParameter("name");
        String replyTo = request.getParameter("email");
        String phone = request.getParameter("phone");
        String serviceType = request.getParameter("serviceType");
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");
        String additionalMessage = request.getParameter("message");

        String subject = "Rezerwacja [" + serviceType + "] " + name + " " + dateFrom + " - " + dateTo;

        String content = "<html><head><meta charset=\"utf-8\\\"></head>\n" +
                "<body style=\"background-color: #1d2124; color: white; font-family: Candara; min-height: 100%\">\n" +
                "<div style=\"margin-left: 20px; margin-top: 20px; font-size: 16px;\">\n" +
                "<p style=\"font-size: 18px;\"><b> " + name + " </b></p>\n" +
                "<p style=\"font-size: 14px; color: aquamarine;\">email:  " + replyTo + "</p>\n" +
                "<p>tel. <a style=\"font-family: Arial; text-decoration-line: none; font-weight: normal; " +
                "color: aquamarine;\" href=\"tel:" + phone + "\"><span style=\"font-size: 20px;\">" + phone +
                "</span></a></p>\n<p>usługa:  " + serviceType + "  </p>\n<p>termin od  " +
                "<span style=\"font-size: 20px; color: aquamarine;\">" + dateFrom + "</span>  do\n" +
                "<span style=\"font-size: 20px; color: aquamarine;\">"  + dateTo + "</span></p>\n" +
                "<p>wiadomość: " + additionalMessage + "</p></div></body></html>";

        String resultMessage = "";

        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, replyTo, name, subject,
                    content);
            resultMessage = "Wiadomość została wysłana";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "Błąd wysyłania: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/Result.jsp").forward(
                    request, response);
        }
    }
}