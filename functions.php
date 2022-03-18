<?php
session_start();
ob_start();
include 'conn.php';

const BOT_USERNAME = '---bot-adi---';
const BOT_TOKEN = '---bot--token---';

/**
 * @throws Exception
 */
function checkTelegramAuthorization($auth_data) {
    $check_hash = $auth_data['hash'];
    unset($auth_data['hash']);
    $data_check_arr = [];
    foreach ($auth_data as $key => $value) {
        $data_check_arr[] = $key . '=' . $value;
    }
    sort($data_check_arr);
    $data_check_string = implode("\n", $data_check_arr);
    $secret_key = hash('sha256', BOT_TOKEN, true);
    $hash = hash_hmac('sha256', $data_check_string, $secret_key);
    if (strcmp($hash, $check_hash) !== 0) {
        throw new Exception('Data is NOT from Telegram');
        LogYaz('Telegram User Check', 'Data is NOT from Telegram', 'Hata');
    }
    if ((time() - $auth_data['auth_date']) > 86400) {
        throw new Exception('Data is outdated');
        LogYaz('Telegram User Check', 'Data is outdated', 'Hata');
    }
    return $auth_data;
}

function saveTelegramUserData($auth_data) {
    global $db;

    $tg_user_id = $auth_data['id'];
    $tg_ad = htmlspecialchars($auth_data['first_name']);
    $tg_soyad = htmlspecialchars($auth_data['last_name']);
    $tg_username = htmlspecialchars($auth_data['username']);
    $tg_auth_date = htmlspecialchars($auth_data['auth_date']);

    $sorgu = $db->prepare("select id from kullanicilar where tg_user_id = :tg_user_id");
    $sorgu->execute(array(
        "tg_user_id" => $tg_user_id
    ));
    $kac = $sorgu->rowCount();

    if($kac>0) {

        $kup = $db->prepare("update kullanicilar set tg_authdate = :tg_authdate, giris_tarihi = now() where tg_user_id = :tg_user_id");
        $kup->execute(array(
            "tg_authdate" => $tg_auth_date,
            "tg_user_id" => $tg_user_id
        ));

        $hata = $kup->errorInfo();
        if (empty($hata[2])){
            echo "kullanıcının authdate güncellendi";
            $cookie_value = md5("giris-basarili-ok");
            setcookie("giris",$cookie_value);
            $_SESSION['username'] = $tg_username;

        }else{
            echo LogYaz('User Login SQL Update', $hata[2], 'Hata');
        }


    }else{
        $ekle = $db->prepare("insert into kullanicilar (tg_user_id,tg_ad,tg_soyad,tg_username,tg_authdate, giris_tarihi, zaman)
                                    values(:tg_user_id, :tg_ad, :tg_soyad, :tg_username, :tg_authdate, now(), 30)");
        $ekle->execute(array(
            "tg_user_id" => $tg_user_id,
            "tg_ad" => $tg_ad,
            "tg_soyad" => $tg_soyad,
            "tg_username" => $tg_username,
            "tg_authdate" => $tg_auth_date
        ));

        $hata = $ekle->errorInfo();
        if (empty($hata[2])){
            echo "kullanıcı kaydı başarılı";
            $cookie_value = md5("giris-basarili-ok");
            setcookie("giris",$cookie_value);
            $_SESSION['username'] = $tg_username;
        }else{
            echo LogYaz('User Register SQL Insert', $hata[2], 'Hata');
        }

    }

}

function MesajGonder($mesaj, $kim){

    $veriler = [
        'text' => $mesaj,
        'chat_id' => $kim
    ];
    $fg = json_decode(file_get_contents("https://api.telegram.org/bot".BOT_TOKEN."/sendMessage?" . http_build_query($veriler)));

    return ($fg->ok==1)  ? true : false;
}

function KidBul($username){
    global $db;
    $sql = $db->prepare("select id from kullanicilar where tg_username = :uname");
    $sql->execute(array(
        "uname" => $username
    ));
    $kac = $sql->rowCount();
    if ($kac>0){
        $getir = $sql->fetch(PDO::FETCH_ASSOC);
        $kid = $getir['id'];
    }else{
        $kid = 0;
    }

    return $kid;
}

function LogYazFile($baslik,$deger){
    $dosya = fopen("log.txt",'a+');
    $veri = "Tarih : [".date('d-m-Y h:i:s')."] Baslik => [".$baslik."] Mesaj => [".$deger."]; \n";
    fwrite($dosya,$veri);
    fclose($dosya);
}

function LogYaz($baslik,$icerik,$seviye){
    global $db;
    $lsql = $db->prepare("insert into loglar (baslik, icerik, tarih, seviye) values (:baslik, :icerik, now(), :seviye)");
    $lsql->execute(array(
       "baslik" => $baslik,
       "icerik" => $icerik,
       "seviye" => $seviye
    ));
    $hata = $lsql->errorInfo();
    if (!empty($hata[2])){LogYazFile('SQL Insert LOG', $hata[2]);}
}

function BildirimKaydet($kid, $mid, $durum){
    global $db;
    $bsql = $db->prepare("insert into bildirimler (kullanici_id, mac_id, tarih, status) values (:kid, :mid, now(), :status)");
    $bsql->execute(array(
        "kid" => $kid,
        "mid" => $mid,
        "status" => $durum
    ));
    $hata = $bsql->errorInfo();
    return empty($hata[2]) ? true : LogYaz('SQL Bildirim Kaydet', $hata[2], 'Hata');
}

function KullaniciIptal ($kid){
    global $db;
    $ksql = $db->prepare("update kullanicilar set zaman =0 where id=:kid");
    $ksql->execute(array("kid"=>$kid));
    $hata = $ksql->errorInfo();
    return empty($hata[2]) ? true : LogYaz('SQL Kullanici Iptal', $hata[2], 'Hata');
}