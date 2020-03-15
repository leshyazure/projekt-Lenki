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
<p class="text-center reservation-title">Zarezerwuj termin wizyty
</p>
    <div class="row">
        <form class="form-inline" action="EmailSendingServlet" method="POST">
            <div class="col-12 col-lg-4 my-1 text-center form-group">
                <input id="name" class="input--style-3" type="text" placeholder="Imię i nazwisko" name="name">
                <input class="input--style-3" type="text" placeholder="Email" name="email">
                <input class="input--style-3" type="text" placeholder="Telefon" name="phone">
                <div class="my-2 mx-auto mx-lg-0 select-service" style="width:80%;">
                    <select name="serviceType">
                        <option disabled="disabled" selected="selected">Wybierz usługę</option>
                        <option>Warkocze</option>
                        <option>Dredy</option>
                        <option>Dreadloki</option>
                        <option>Afroloki</option>
                        <option>Cornrows</option>
                        <option>Boxbraids</option>
                        <option>Kuce</option>
                    </select>
                </div>
            </div>
            <div class="dates">
                <p class="range-text">Wybierz zakres od i do:</p>

                <div class="date-range">
                    <div class="date-from-picker col-12 col-lg-4 my-lg-1 d-lg-inline-block mx-5 px-5 px-lg-0 ml-lg-0 mr-lg-5"></div>
                    <div class="date-to-picker col-12 col-lg-4 my-lg-1 d-lg-inline-block mx-5 my-4 mx-lg-5 px-5 px-lg-0"></div>
                </div>
                <p>
                    <a class="button" href="#" role="button">
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
        beforeShowDay: function (date) {
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
        beforeShowDay: function (date) {
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


    let x, i, j, selElmnt, a, b, c;
    /* Look for any elements with the class "custom-select": */
    x = document.getElementsByClassName("select-service");
    for (i = 0; i < x.length; i++) {
        selElmnt = x[i].getElementsByTagName("select")[0];
        /* For each element, create a new DIV that will act as the selected item: */
        a = document.createElement("DIV");
        a.setAttribute("class", "select-selected");
        a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
        x[i].appendChild(a);
        /* For each element, create a new DIV that will contain the option list: */
        b = document.createElement("DIV");
        b.setAttribute("class", "select-items select-hide");
        for (j = 1; j < selElmnt.length; j++) {
            /* For each option in the original select element,
            create a new DIV that will act as an option item: */
            c = document.createElement("DIV");
            c.innerHTML = selElmnt.options[j].innerHTML;
            c.addEventListener("click", function (e) {
                /* When an item is clicked, update the original select box,
                and the selected item: */
                var y, i, k, s, h;
                s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                h = this.parentNode.previousSibling;
                for (i = 0; i < s.length; i++) {
                    if (s.options[i].innerHTML == this.innerHTML) {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        y = this.parentNode.getElementsByClassName("same-as-selected");
                        for (k = 0; k < y.length; k++) {
                            y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");
                        break;
                    }
                }
                h.click();
            });
            b.appendChild(c);
        }
        x[i].appendChild(b);
        a.addEventListener("click", function (e) {
            /* When the select box is clicked, close any other select boxes,
            and open/close the current select box: */
            e.stopPropagation();
            closeAllSelect(this);
            let element = document.getElementsByClassName("select-service");
            element[0].classList.toggle("expanded");
            this.nextSibling.classList.toggle("select-hide");
            this.classList.toggle("select-arrow-active");
        });
    }

    function closeAllSelect(elmnt) {
        /* A function that will close all select boxes in the document,
        except the current select box: */
        var x, y, i, arrNo = [];
        x = document.getElementsByClassName("select-items");
        y = document.getElementsByClassName("select-selected");
        for (i = 0; i < y.length; i++) {
            if (elmnt == y[i]) {
                arrNo.push(i)
            } else {
                y[i].classList.remove("select-arrow-active");
            }
        }
        for (i = 0; i < x.length; i++) {
            if (arrNo.indexOf(i)) {
                x[i].classList.add("select-hide");
            }
        }
    }

    /* If the user clicks anywhere outside the select box,
    then close all select boxes: */
    document.addEventListener("click", closeAllSelect);

    // Reset class to plain "select-service" when click out of select box
    // This should repair styling errors on lost focus
    $(window).click(function() {
        let element = document.getElementsByClassName("select-service");
        if (element[0].classList.contains("expanded")) {
            element[0].classList.remove("expanded");
        }
    });
</script>
<jsp:include page="footer.jsp"/>