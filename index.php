<?php
include 'functions.php';
?>
<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="etuncer.com">
    <meta name="theme-color" content="#7952b3">
    <title>Telegram Maç Bildirim Botu</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" type="application/javascript"></script>
    <style>
        body {
            background-image: linear-gradient(180deg, #eee, #fff 100px, #fff);
            background-repeat: no-repeat;
        }

        .container {
            max-width: 960px;
        }

        .pricing-header {
            max-width: 700px;
        }
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


</head>
<body>

<div class="container py-3">
    <header>
        <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center text-dark text-decoration-none">
                <span class="fs-4">Telegram Maç Bildirim Botu</span>
            </a>

            <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
                <a class="py-2 text-dark text-decoration-none">
                    <?php

                    if ($_COOKIE['giris']==md5("giris-basarili-ok")){
                        echo "Hoş Geldin {$_SESSION['username']}!,&nbsp;<a href='cikis.php' class='py-2 text-danger text-decoration-none'>Çıkış Yap</a>";
                    }else{
                    ?>
                    <script async src="https://telegram.org/js/telegram-widget.js?15" data-telegram-login="<?=BOT_USERNAME;?>" data-size="large" data-auth-url="kontrol.php" data-request-access="write"></script>
                    <?php } ?>
                </a>
            </nav>
        </div>

        <div class="pricing-header p-3 pb-md-6 mx-auto text-center">
            <h2 class="display-6 text-center mb-6">bot hakkında</h2>
            <p class="fs-6 text-muted">bu telegram botunu kullanarak sisteme giriş yapabilirsiniz. Sevdiğiniz ya da takip etmek istediğiniz takımların maç saatini, sizin belirleyeceğiniz  (30 dk. - 1 saat  gibi) zamanda telegram aracılığıyla mesaj gönderir. </p>
        </div>
    </header>

    <main>
        <?php
            if ($_COOKIE['giris']==md5("giris-basarili-ok")){
        ?>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <script>
                        $(document).ready(function(){
                            $("input[name=takimlar]").on("change",function(){
                                let loading  = '<div class="spinner-border text-primary spinner-border-sm" role="status"><span class="visually-hidden">Loading...</span></div>'
                                let id = $(this).attr("id");

                                if ($('input#'+id).is(":checked")){
                                    let deger = $(this).val();
                                    $.ajax({
                                        type: 'POST',
                                        url: 'ajax.php',
                                        data: 'id='+deger+'&islem=ekle&username=<?=$_SESSION["username"]?>',
                                        beforeSend: function() {
                                            $(".kayit"+deger).append(loading);
                                        },
                                        success:function(cevap){
                                            if ($.trim(cevap) == 'ok'){
                                                $(".kayit"+deger).find("div").remove();
                                                $(".kayit"+deger).find("span").remove();
                                                $(".kayit"+deger).append("<span class='badge bg-success'>Kaydedildi!</span>").fadeIn("slow");
                                            }else{
                                                $('input#'+id).prop( "checked", false );
                                                $(".kayit"+deger).find("div").remove();
                                                $(".kayit"+deger).find("div").remove();
                                                $(".kayit"+deger).append("<span class='badge bg-danger'>SorunVar!</span>").fadeIn("slow");
                                            }
                                        }
                                    });

                                }else  {
                                    let deger = $(this).val();
                                    $.ajax({
                                        type: 'POST',
                                        url: 'ajax.php',
                                        data: 'id='+deger+'&islem=sil&username=<?=$_SESSION["username"]?>',
                                        beforeSend: function() {
                                            $(".kayit"+deger).append(loading);
                                        },
                                        success:function(cevap){
                                            if ($.trim(cevap) == 'ok'){
                                                $(".kayit"+deger).find("div").remove();
                                                $(".kayit"+deger).find("span").remove();
                                                $(".kayit"+deger).append("<span class='badge bg-danger'>Silindi!</span>").fadeIn("slow");
                                            }else{
                                                $('input#'+id).prop( "checked", false );
                                                $(".kayit"+deger).find("div").remove();
                                                $(".kayit"+deger).append("<span class='badge bg-danger'>SorunVar!</span>").fadeIn("slow");
                                            }
                                        }
                                    });

                                }

                            });

                            $("button[name=Kaydet]").click(function (e){

                                let kaydet = '<button class="btn btn-primary" type="button" disabled><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Kaydediliyor...</button>'
                                let kaydetok = '<button class="btn btn-primary" name="Kaydet" type="button">Kaydet</button>'
                                $(this).hide();

                                if($("input[name=Ayarlar]").is(":checked")){
                                    let deger = $("input[name=Ayarlar]:checked").val();

                                    $.ajax({
                                        type: 'POST',
                                        url: 'ajax.php',
                                        data: 'dakika='+deger+'&islem=ayarkaydet&username=<?=$_SESSION["username"]?>',
                                        beforeSend: function() {
                                            $("li#kaydet").append(kaydet);
                                        },
                                        success:function(cevap){
                                            if ($.trim(cevap) == 'ok'){
                                                $("li#kaydet").find("button:disabled").remove();
                                                $("button[name=Kaydet]").show();
                                                $("li#kaydet").append("<span class='badge bg-success'>Kaydedildi!</span>").fadeIn("slow");
                                                $("li#kaydet").find("span").fadeOut(3000,function (){$(this).remove()});

                                            }
                                        }
                                    });

                                }

                            });

                        });
                    </script>
                    <div class="list-group mx-0">
                        <li class="list-group-item list-group-item-success" aria-current="true">Süper Lig - Takım Seç</li>
                        <?php
                        $takim = $db->query("select * from takimlar");
                        $kid = KidBul($_SESSION['username']);
                        if($kid==0){header('Location: cikis.php');exit();}
                        while($tgetir=$takim->fetch(PDO::FETCH_ASSOC)){
                            $takim_id = $tgetir['id'];
                            $csql = $db->prepare("select * from takip_edenler where takim_id = :takim_id and kullanici_id = :kid");
                            $csql->execute(array(
                                    "takim_id" => $takim_id,
                                    "kid" => $kid
                            ));
                            $cgetir = $csql->fetch(PDO::FETCH_ASSOC);
                            $takip_takim_id = @$cgetir['takim_id'];
                        ?>

                        <label class="list-group-item d-flex gap-2 form-switch" id="takimlar" for="flexSwitchCheckDefault<?=$takim_id;?>">
                            <input class="form-check-input flex-shrink-0" name="takimlar" style="margin-left: 1px;" type="checkbox" role="switch" id="flexSwitchCheckDefault<?=$takim_id;?>" value="<?=$takim_id;?>" <?php echo ($takim_id==$takip_takim_id)? 'checked' : ''; ?>>
                            <img src="logolar/<?=$tgetir['logo'];?>" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
                            <span><?=$tgetir['ad'];?></span>
                            <div style="display: none;" class="kayit<?=$takim_id;?>"></div>
                        </label>

                        <?php
                        }
                        ?>
                    </div>

                </div>
                <div class="col-md-6">
                        <?php
                        $asql = $db->prepare("select * from kullanicilar where tg_username = :uname");
                        $asql->execute(array(
                                "uname" => $_SESSION['username']
                        ));
                        $agetir = $asql->fetch(PDO::FETCH_ASSOC);
                        $zaman = $agetir['zaman'];
                        ?>
                    <div class="list-group mx-0">
                        <li class="list-group-item list-group-item-warning" aria-current="true">Mesaj Gönderim Ayarı</li>
                        <label class="list-group-item d-flex gap-2">
                            <input class="form-check-input flex-shrink-0" type="radio" name="Ayarlar" value="0" <?=($zaman==0) ? 'checked':'';?>>
                            <span>
                                <b>Kapat</b>
                                <i><small class="d-block text-muted">Bildirim göndermeyi kapat</small></i>
                            </span>
                        </label>
                        <label class="list-group-item d-flex gap-2">
                            <input class="form-check-input flex-shrink-0" type="radio" name="Ayarlar" value="30" <?=($zaman==30) ? 'checked':'';?>>
                            <span>
                                <b>30 dakika</b>
                                <i><small class="d-block text-muted">Maçın başlamasına 30 dakika  kala mesaj gönderir</small></i>
                            </span>
                        </label>
                        <label class="list-group-item d-flex gap-2">
                            <input class="form-check-input flex-shrink-0" type="radio" name="Ayarlar" value="60" <?=($zaman==60) ? 'checked':'';?>>
                            <span>
                                <b>1 saat</b>
                                <i><small class="d-block text-muted">Maçın başlamasına 1 saat kala mesaj gönderir</small></i>
                            </span>
                        </label>
                        <label class="list-group-item d-flex gap-2">
                            <input class="form-check-input flex-shrink-0" type="radio" name="Ayarlar" value="120" <?=($zaman==120) ? 'checked':'';?>>
                            <span>
                                <b> 2 saat </b>
                                <i><small class="d-block text-muted">Maçın başlamasına 2 saat kala mesaj gönderir</small></i>
                            </span>
                        </label>
                        <li class="list-group-item d-flex gap-2" id="kaydet">
                            <button class="btn btn-primary" name="Kaydet" type="button">Kaydet</button>
                        </li>

                    </div>
                </div>
            </div>
        </div>
        <?php
            }
        ?>
    </main>

    <footer class="pt-4 my-md-5 pt-md-5 border-top">
        <div class="row">
            <div class="col-12 col-md">
                <small class="d-block mb-3 text-muted">&copy; <?=date('Y');?></small>
            </div>
        </div>
    </footer>
</div>

</body>
</html>
<?$db=null;?>