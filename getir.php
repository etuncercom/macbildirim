<?php
include 'functions.php';
/*
$gjson = json_decode(file_get_contents("https://beinsports.com.tr/_next/data/319/tr/lig/super-lig/fikstur.json"),true);
$takimlar = $gjson['pageProps']['teams'];

for ($i=0;$i<count($takimlar);$i++) {

    $tsql = $db->prepare("insert into takimlar (ad,kisa_ad,r_ad,logo,lig_id) values(:ad, :kisa_ad, :r_ad, :logo, 1)");
    $tsql->execute(array(
        "ad" => $takimlar[$i]['name'],
        "kisa_ad" => $takimlar[$i]['abbreviation'],
        "r_ad" => $takimlar[$i]['rewriteId'],
        "logo" => $takimlar[$i]['logo']
    ));
    $hata = $tsql->errorInfo();
    echo empty($hata[2]) ? $takimlar[$i]['name'] . " => başarılı şekilde eklendi.<br>" : $hata[2];
}

$tsql = $db->query("select r_ad from takimlar");
while ($getir=$tsql->fetch(PDO::FETCH_ASSOC)){
    echo $getir['r_ad'].".json <br>";
}
*/



$tsql = $db->query("select r_ad from takimlar");
while ($getir=$tsql->fetch(PDO::FETCH_ASSOC)){


    $gjson = json_decode(file_get_contents("https://beinsports.com.tr/_next/data/323/tr-TR/takim/{$getir['r_ad']}.json"),true);
    $maclar = $gjson['pageProps']['data']['fixtures']['data'];
    $takim = $gjson['pageProps']['rewriteId'];

    $takimsql = $db->prepare("select id  from takimlar where r_ad = :r_ad");
    $takimsql->execute(array(
        "r_ad" => $takim
    ));
    $tgetir = $takimsql->fetch(PDO::FETCH_ASSOC);
    $takim_id = $tgetir['id'];


    for ($i=0;$i<count($maclar);$i++){

        $evsahibi = empty($maclar[$i]['homeTeam']['rewriteId']) ? $maclar[$i]['homeTeam']['name'] : $maclar[$i]['homeTeam']['rewriteId'];
        $misafir = empty($maclar[$i]['awayTeam']['rewriteId']) ? $maclar[$i]['awayTeam']['name'] : $maclar[$i]['awayTeam']['rewriteId'];
        $mactarihi = $maclar[$i]['matchDate'];
        $macsonucu =  $maclar[$i]['liteMatchStatus'];
        $evsahibi_skor = $maclar[$i]['score']['homeScore'];
        $misafir_skor = $maclar[$i]['score']['awayScore'];
        $macid = $maclar[$i]['id'];

        $csql = $db->prepare("select id from maclar where mac_id = :mac_id and takim_id = :takim_id");
        $csql->execute(array(
            "mac_id" => $macid,
            "takim_id" => $takim_id
        ));
        $kac = $csql->rowCount();

        if ($kac>0){

            $upsql = $db->prepare("update maclar set mac_tarihi = :mac_tarihi where mac_id = :mac_id");
            $upsql->execute(array(
                "mac_tarihi" => $mactarihi,
                "mac_id" => $macid,
            ));

            $hata = $upsql->errorInfo();

            echo empty($hata[2]) ? "{$takim} takiminin bu id'li '{$macid}' maçları daha önce eklenmiş ve bilgiler yine de güncellendi <br>" : $hata[2];

        }else{

            if ($macsonucu=='preMatch'){

                $isql = $db->prepare("insert into maclar (evsahibi,misafir,e_skor,m_skor,mac_tarihi,mac_sonucu,mac_id,takim_id)
                                            values (:evsahibi, :misafir, :e_skor, :m_skor, :mac_tarihi, :mac_sonucu, :mac_id, :takim_id)");
                $isql->execute(array(
                    "evsahibi" => $evsahibi,
                    "misafir" => $misafir,
                    "e_skor" => $evsahibi_skor,
                    "m_skor" => $misafir_skor,
                    "mac_tarihi" => $mactarihi,
                    "mac_sonucu" => 0,
                    "mac_id" => $macid,
                    "takim_id" => $takim_id
                ));

                $hata = $isql->errorInfo();

                echo empty($hata[2]) ? "{$takim} => {$macid} , maçlar başarılı şekilde eklendi <br>" : $hata[2];

            }
        }
    }
    echo "<hr>";
}

