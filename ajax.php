<?php
include 'functions.php';

if (!empty($_SESSION['username'])) {

    $islem = @htmlspecialchars($_POST['islem']);

    if ($islem == 'ekle') {

        $tid = htmlspecialchars($_POST['id']);
        $kid = KidBul(htmlspecialchars($_POST['username']));

        if ($kid > 0) {

            if ($tid != null or $kid != null or $tid != '' or $kid != '') {

                $ekle = $db->prepare("insert into takip_edenler (takim_id, kullanici_id, kayit_tarih) values (:takim_id,:kullanici_id, now())");
                $ekle->execute(array(
                    "takim_id" => $tid,
                    "kullanici_id" => $kid
                ));
                $hata = $ekle->errorInfo();
                echo empty($hata[2]) ? 'ok' : 'hata'.LogYaz('User Takım Takip SQL', $hata[2], 'Hata');
            } else {
                echo 'hata';
                LogYaz('User Takım Takip', 'Takım seçiminde veriler hatalı', 'Hata');
            }
        } else {
            echo 'hata';
            LogYaz('User Takım Takip', 'Takım seçiminde user bulunamadı', 'Hata');
        }

    } elseif ($islem == 'sil') {

        $tid = htmlspecialchars($_POST['id']);
        $kid = KidBul(htmlspecialchars($_POST['username']));

        if ($kid > 0) {

            if ($tid != null or $kid != null or $tid != '' or $kid != '') {

                $ekle = $db->prepare("delete from takip_edenler where takim_id = :takim_id and kullanici_id = :kullanici_id");
                $ekle->execute(array(
                    "takim_id" => $tid,
                    "kullanici_id" => $kid
                ));
                $hata = $ekle->errorInfo();
                echo empty($hata[2]) ? 'ok' : 'hata'.LogYaz('User Takım Takip Sil SQL', $hata[2], 'Hata');
            } else {
                echo 'hata';
                LogYaz('User Takım Takip', 'Takım silmede veriler hatalı', 'Hata');
            }
        } else {
            echo 'hata';
            LogYaz('User Takım Takip', 'Takım silmede kullanıcı bulunamadı', 'Hata');
        }
    } elseif ($islem == 'ayarkaydet') {

        $dakika = htmlspecialchars($_POST['dakika']);
        $kid = KidBul(htmlspecialchars($_POST['username']));

        if (!empty($dakika)) {

            $ekle = $db->prepare("update kullanicilar set zaman = :zaman where id = :kullanici_id");
            $ekle->execute(array(
                "zaman" => $dakika,
                "kullanici_id" => $kid
            ));
            $hata = $ekle->errorInfo();
            echo empty($hata[2]) ? 'ok' : 'hata'.LogYaz('User Ayar Kaydet SQL', $hata[2], 'Hata');

        } else {
            echo 'hata';
            LogYaz('User Dakika Verisi ', 'Dakika verisi boş', 'Hata');
        }
    } else {
        echo 'hata';
        LogYaz('AJAX Url Farklı ', 'AJAX farklı url girilmiş', 'Hata');
    }
}else{
    echo 'gerçersiz istek';
    LogYaz('AJAX Geçersiz İstek', 'Ajax url session olmadan deneme yapıyor', 'Hata');
}