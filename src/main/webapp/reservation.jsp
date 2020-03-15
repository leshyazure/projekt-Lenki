<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Koltuneria Artystyczna - Studio alternatywnych fryzur</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-social.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="css/override.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="locales/bootstrap-datepicker.pl.min.js"></script>
</head>
<body>
<div class="logo">
    <div class="mr-5 float-right" style="margin-top: 200px"><a href="reservation.jsp"
                                                               class="btn btn-lg btn-primary d-inline">
        <i class="fa fa-calendar-check-o"></i> Rezerwuj</a></div>
</div>
<div class="container mt-5">
    <div class="row">
        <div class="col-12 mx-auto mx-lg-3 my-1 text-center"><h2 class="title">Rezerwuj wizytę</h2></div>
    </div>
    <div class="row">
        <form class="form-inline" action="EmailSendingServlet" method="POST">
            <div class="col-9 col-lg-3 my-1 text-center form-group">
                <input id="name" class="input--style-3" type="text" placeholder="Imię i nazwisko" name="name">
                <input class="input--style-3" type="text" placeholder="Email" name="email">
                <input class="input--style-3" type="text" placeholder="Telefon" name="phone">
                <select name="serviceType">
                    <option disabled="disabled" selected="selected">Wybierz usługę</option>
                    <option>Warkocze</option>
                    <option>Dredy, dreadloki</option>
                    <option>Afroloki</option>
                    <option>Cornrows</option>
                    <option>Boxbraids, kuce</option>
                </select>
            </div>
            <div class="dates">
                <h1>Wybierz zakres od i do:</h1>
                <div class="date-range">
                    <div class="date-from-picker"></div>
                    <div class="date-to-picker"></div>
                </div>
                <p>
                    <a class="btn btn-success" href="#" role="button">
                        Szukaj wolnych terminów od <span id="display-date-from"></span>
                        do <span id="display-check-to"></span>
                    </a>
                </p>
            </div>
        </form>
    </div>
</div>
<script>
    let date_from, date_from_div, date_from_dp,
        date_to, date_to_div, date_to_dp;

    // function for udpating displayed date in button
    function update() {
        if (date_from !== undefined) {
            $('#display-date-from').html(date_from.toLocaleDateString());
        }
        if (date_to !== undefined) {
            $('#display-check-to').html(date_to.toLocaleDateString());
        }
    }

    // create checkin datepicker
    date_from_div = $('.date-from-picker').datepicker({
        language: "pl",
        todayHighlight: true,
        daysOfWeekDisabled: "0,6",
        autoclose: false,
        beforeShowDay: function(date) {
            if (date_to !== undefined) {
                // disabled date selection for day after checkout date
                if (date > date_to) {
                    return false;
                }
                // display checkout date in checkin datepicker
                if (date.getDate() === date_to.getDate() &&
                    date.getMonth() === date_to.getMonth() &&
                    date.getFullYear() === date_to.getFullYear()) {
                    return {
                        classes: 'is-selected'
                    };
                }
            }
            // display range dates in checkin datepicker
            if (date_from !== undefined && date_to !== undefined) {
                if (date > date_from && date < date_to) {
                    return {
                        classes: 'is-between'
                    };
                }
            }
            // display checkin date
            if (date_from !== undefined) {
                if (date.getDate() === date_from.getDate() &&
                    date.getMonth() === date_from.getMonth() &&
                    date.getFullYear() === date_from.getFullYear()) {
                    return {
                        classes: 'active'
                    };
                }
            }
            return true;
        }
    });

    // save checkin datepicker for later
    date_from_dp = date_from_div.data('datepicker');

    // update datepickers on checkin date change
    date_from_div.on('changeDate', (event) => {
        // save checkin date
        date_from = event.date;
        // update checkout datepicker so range dates are displayed
        date_to_dp.update();
        date_from_dp.update();
        update();
    });

    // create checkout datepicker
    date_to_div = $('.date-to-picker').datepicker({
        language: "pl",
        todayHighlight: true,
        daysOfWeekDisabled: "0,6",
        autoclose: false,
        beforeShowDay: function(date) {
            if (date_from !== undefined) {
                // disabled date selection for day before checkin date
                if (date < date_from) {
                    return false;
                }
                // display checkin date in checkout datepicker
                if (date.getDate() === date_from.getDate() &&
                    date.getMonth() === date_from.getMonth() &&
                    date.getFullYear() === date_from.getFullYear()) {
                    return {
                        classes: 'is-selected'
                    };
                }
            }
            // display range dates in checkout datepicker
            if (date_from !== undefined && date_to !== undefined) {
                if (date > date_from && date < date_to) {
                    return {
                        classes: 'is-between'
                    };
                }
            }
            // display checkout date
            if (date_to !== undefined) {
                if (date.getDate() === date_to.getDate() &&
                    date.getMonth() === date_to.getMonth() &&
                    date.getFullYear() === date_to.getFullYear()) {
                    return {
                        classes: 'active'
                    };
                }
            }
            return true;
        }
    });

    // save checkout datepicker for later
    date_to_dp = date_to_div.data('datepicker');

    // update datepickers on checkout date change
    date_to_div.on('changeDate', (event) => {
        // save checkout date
        date_to = event.date;
        // update checkin datepicker so range dates are displayed
        date_from_dp.update();
        date_to_dp.update();
        update();
    });

</script>
<jsp:include page="footer.jsp"/>