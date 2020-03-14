<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<div class="container mt-5">
    <div class="row">
        <div class="col-12 mx-auto mx-lg-3 my-1 text-center"><h2 class="title">Rezerwuj wizytę</h2></div>
    </div>
    <div class="row">
        <form class="form-inline" action="EmailSendingServlet" method="POST">
            <div class="col-9 col-lg-3 my-1 text-center form-group">
                <input id="name" class="input--style-3" type="text" placeholder="Imię i nazwisko" name="name">
                <input class="input--style-3" type="email" placeholder="Email" name="email">
                <input class="input--style-3" type="text" placeholder="Telefon" name="phone">
                <select name="serviceType">
                    <option disabled="disabled" selected="selected">Wybierz usługę</option>
                    <option>Warkocze</option>
                    <option>Dredy</option>
                    <option>Afroloki</option>
                </select>
            </div>
            <div class="col-9 col-lg-3 my-1 text-center form-group">
                <input class="input--style-3 js-datepicker" type="text" placeholder="Wybierz datę od:"
                       name="dateFrom">
                <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
            </div>
            <div class="col-9 col-lg-3 my-1 text-center form-group">
                <input class="input--style-3 js-datepicker" type="text" placeholder="Wybierz datę do:"
                       name="dateTo">
                <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>