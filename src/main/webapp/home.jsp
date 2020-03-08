<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 08.03.2020
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container mt-5 mt-lg-5">
    <div class="row">
        <div class="col-9 col-sm-6 col-md-4 col-lg-3 col-xl-2 mx-auto mx-lg-3 my-1 text-center hair-list">
            <a href="index.php?id=warkoczyki">
                <div class="fakeimg-home">[ Zdjęcie ]</div>
                <p class="hair-list">Warkoczyki <br>afrykańskie
                </p></a>
        </div>
        <div class="col-9 col-sm-6 col-md-4 col-lg-3 col-xl-2 mx-auto mx-lg-3 my-1 text-center hair-list">
            <a href="index.php?id=dready">
                <div class="fakeimg-home">[ Zdjęcie ]</div>
                <p class="hair-list">Dready / <br>Dreadloki</p></a>
        </div>
        <div class="col-9 col-sm-6 col-md-4 col-lg-3 col-xl-2 mx-auto mx-lg-3 my-1 text-center hair-list">
            <a href="index.php?id=afroloki">
                <div class="fakeimg-home">[ Zdjęcie ]</div>
                <p class="hair-list">Afroloki</p></a>
        </div>
        <div class="col-9 col-sm-6 col-md-4 col-lg-3 col-xl-2 mx-auto mx-lg-3 my-1 text-center hair-list">
            <a href="index.php?id=cornrows">
                <div class="fakeimg-home">[ Zdjęcie ]</div>
                <p class="hair-list">Cornrows</p></a>
        </div>
        <div class="col-9 col-sm-6 col-md-4 col-lg-3 col-xl-2 mx-auto mx-lg-3 my-1 text-center hair-list">
            <a href="index.php?id=boxbraids">
                <div class="fakeimg-home">[ Zdjęcie ]</div>
                <p class="hair-list">Boxbraids /<br>kuce</p></a>
        </div>
    </div>
    <p class="info text-center">[tylko miniatury, cała dostępna po klinknięciu w napis lub dowolne zdjęcie]</p>
    <div href="gallery"><p class="text-center"> Galeria: <br></p>
        <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
            <div class="carousel-inner w-100" role="listbox">
                <div class="carousel-item row no-gutters active">
                    <div class="col-2 float-left"><img class="img-fluid" src="img/1.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/2.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/3.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/4.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/5.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/8.jpg"></div>
                </div>
                <div class="carousel-item row no-gutters">
                    <div class="col-2 float-left"><img class="img-fluid" src="img/6.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/7.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/2.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/8.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/9.jpg"></div>
                    <div class="col-2 float-left"><img class="img-fluid" src="img/10.jpg"></div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#recipeCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#recipeCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a></div>
</div>
<div class="col-12 text-center my-5">
    <p class="info">[Kliknięcie w numer na smartphonie spowoduje automatyczne wybranie numeru]</p>
    <a class="btn" href="tel:+48513151432"><p class="phone"><i class="fa fa-phone mx-lg-4 mx-2"></i>513-151-432</p></a>
</div>
</div>
<script>
    $('.carousel').carousel({
        interval: 5000
    })
</script>
