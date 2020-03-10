<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-10 col-lg-1 order-2 order-lg-1 my-lg-5 mx-auto ml-lg-auto mr-lg-0">
            <div class="fakeimg-thumb mb-4 ml-auto ml-lg-0 px-2 d-inline-block" style="padding-top: 30px;">[ Zdjęcie ]</div>
            <div class="fakeimg-thumb my-4 mx-2 px-2 mx-lg-0 d-inline-block" style="padding-top: 30px;">[ Zdjęcie ]</div>
            <div class="fakeimg-thumb mt-4 mr-auto px-2 mr-lg-0 d-inline-block" style="padding-top: 30px;">[ Zdjęcie ]</div>
        </div>
        <div class="col-10 col-lg-3 order-1 order-lg-2 my-lg-5 mx-auto mx-lg-0">
            <div class="fakeimg" style="height: 350px">[ Zdjęcie ]<br><?php echo $img_main ?></div>
        </div>
        <div class="col-10 col-lg-6 order-3 my-lg-5 mx-auto mx-lg-0">
            <p class="desc-name pl-4 pb-1 text-center"><?php echo $name ?></p>
            <p class="desc-text"><?php echo $desc_full ?></p>
            <p class="desc-const">Jak długo będę je nosić? : <span class="desc-text ml-2">do uzupełnienia</span></p>
            <p class="desc-const">Ile trwa zakładanie? : <span class="desc-text ml-2">do uzupełnienia</span></p>
            <p class="desc-const">Rodzaj włosów : <span class="desc-text ml-2">do uzupełnienia</span></p>
            <p class="desc-const">Ilość potrzebnych paczek : <span class="desc-text ml-2">do uzupełnienia</span></p>
            <p class="desc-const">Jak wygląda zakładanie? : <div class="desc-text ml-2">do uzupełnienia</div></p>
            <p class="desc-const">Jak o nie dbać? : <div class="desc-text ml-2">do uzupełnienia</div></p>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>