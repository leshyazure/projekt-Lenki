import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.Events;
import lombok.SneakyThrows;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@WebServlet("/CheckAvailability")
public class FindAvailableDates extends HttpServlet {

    CalendarConnection api = new CalendarConnection();

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String replyTo = request.getParameter("email");
        String phone = request.getParameter("phone");
        String serviceType = request.getParameter("serviceType");
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");
        String additionalMessage = request.getParameter("message");


        final PrintWriter writer = response.getWriter();
        // Build a new authorized API client service.
        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        Calendar service = new Calendar.Builder(HTTP_TRANSPORT, api.JSON_FACTORY, api.getCredentials(HTTP_TRANSPORT))
                .setApplicationName(api.APPLICATION_NAME)
                .build();


        DateTime from = new DateTime(dateFrom);
        DateTime to = new DateTime(dateTo);

        Events events = service.events().list("primary")
                .setMaxResults(10)
                .setTimeMin(from)
                .setTimeMax(to)
                .setOrderBy("startTime")
                .setSingleEvents(true)
                .execute();
        List<Event> items = events.getItems();
        if (items.isEmpty()) {
            writer.println("No upcoming events found.");
        } else {
            writer.println("Upcoming events");
            for (Event event : items) {
                DateTime start = event.getStart().getDateTime();
                if (start == null) {
                    start = event.getStart().getDate();
                }
                writer.printf("%s (%s)\n", event.getSummary(), start);
            }
        }

    }



}
