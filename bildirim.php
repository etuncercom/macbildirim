<?php
include 'functions.php';

$sql = $db->prepare("select * from takip_edenler");
$sql->execute();

$kac = $sql->rowCount();

if ($kac>0) {

    while ($tesql = $sql->fetch(PDO::FETCH_ASSOC)) {

        $kid = $tesql['kullanici_id'];
        $tid = $tesql['takim_id'];

        $usql = $db->prepare("select * from kullanicilar where id = :kid and zaman not in (0)");
        $usql->execute(array(
            "kid" => $kid
        ));
        $ugetir = $usql->fetch(PDO::FETCH_ASSOC);
        $zaman = $ugetir['zaman'];
        $chat_id = $ugetir['tg_user_id'];

        $msql = $db->prepare("select * from maclar where takim_id = :te_takip_id and mac_sonucu = 0 order by mac_tarihi asc limit 0,1");
        $msql->execute(array(
            "te_takip_id" => $tid
        ));
        $mgetir = $msql->fetch(PDO::FETCH_ASSOC);
        $mid = $mgetir['id'];
        $evsahibi = $mgetir['evsahibi'];
        $misafir = $mgetir['misafir'];
        $mtarih = $mgetir['mac_tarihi'];

        $mac_tarihi = new DateTime($mtarih);
        $mac_tarihi->setTimezone(new DateTimeZone('Europe/Istanbul'));
        $mac_tarihi->format('Y-m-d H:i:s');
        $simdiki_tarih = new DateTime('now',new DateTimeZone('Europe/Istanbul'));

        $kalan = $mac_tarihi->diff($simdiki_tarih);
        $gecti_mi = $mac_tarihi < $simdiki_tarih;

        /*
        echo '<pre>';
        var_dump($kalan);
        echo 'kalan : ' .$kalan->d. ' gün '. $kalan->h . ' saat ' . $kalan->i . ' dakika';
        echo '</pre>';
        */

        $bisql = $db->prepare('select * from bildirimler where kullanici_id =:kid and mac_id =:mid and status=1');
        $bisql->execute(array(
            "kid" => $kid,
            "mid" => $mid
        ));
        $b_var = $bisql->rowCount();

        if ($b_var<=0) {

            if ($gecti_mi == false) {

                if ($zaman == 30) {

                    if ((($kalan->d == 0) and ($kalan->h == 0) and ($kalan->i >= 25)) and (($kalan->d == 0) and ($kalan->h == 0) and ($kalan->i <= 35))) {

                        $mesaj = $evsahibi . " ve " . $misafir . " arasındaki maç 30 dakika içinde başlamak üzere. iyi seyirler";
                        $sonuc = MesajGonder($mesaj, $chat_id);
                        echo ($sonuc == true) ? BildirimKaydet($kid, $mid, 1) : LogYaz('Telegram Mesaj', '30 Dk. Telegram Mesajı Gönderilemedi', 'Hata');
                        echo "<br>";

                    }

                } elseif ($zaman == 60) {

                    if ((($kalan->d == 0) and ($kalan->h == 1) and ($kalan->i <= 5)) or (($kalan->d == 0) and ($kalan->h == 0) and ($kalan->i >= 55))) {

                        $mesaj = $evsahibi . " ve " . $misafir . " arasındaki maç 1 saat içinde başlamak üzere. iyi seyirler";
                        $sonuc = MesajGonder($mesaj, $chat_id);
                        echo ($sonuc == true) ? BildirimKaydet($kid, $mid, 1) : LogYaz('Telegram Mesaj', '60 Dk. Telegram Mesajı Gönderilemedi', 'Hata');
                        echo "<br>";

                    }

                } else if ($zaman == 120) {

                    if ((($kalan->d == 0) and ($kalan->h == 1) and ($kalan->i >= 55)) or ((($kalan->d == 0) and $kalan->h == 2) and ($kalan->i <= 5))) {

                        $mesaj = $evsahibi . " ve " . $misafir . " arasındaki maç 2 saat içinde başlamak üzere. iyi seyirler";
                        $sonuc = MesajGonder($mesaj, $chat_id);
                        echo ($sonuc == true) ? BildirimKaydet($kid, $mid, 1) : LogYaz('Telegram Mesaj', '120 Dk. Telegram Mesajı Gönderilemedi', 'Hata');
                        echo "<br>";

                    }

                } else {
                    echo 'ilgili zaman aralığınında değildir';
                }

            } else {
                $upsql = $db->prepare("update maclar set mac_sonucu=1 where id: mac_id");
                $upsql->execute(array(
                    "mac_id" => $mgetir['id']
                ));
                $hata = $upsql->errorInfo();
                echo empty($hata[2]) ? 'update ok' : LogYaz('SQL Mac Sonucu Güncelleme', $hata[2], 'Hata');
                echo '<br> maç tarihi geçmiş gitmiş';
            }
        }else {
            LogYaz('Bildirim Göderme', "{$mid} idli maç daha önce {$kid} idli kullanıcıya bildirildi", 'Info');
            echo 'bu mac bildirimi daha önce bu kullanıcıya gönderildi';
        }
    }

}else{
    echo 'Takım takip eden kimse bulunmamaktadır!';
}