<?php
include 'functions.php';

try {
  $auth_data = checkTelegramAuthorization($_GET);
  if (!$auth_data){
      LogYaz('Telegram User Check', 'Telegramdan gelen bilgiler sorunlu!', 'Hata');
      echo 'Telegramdan veri alınamadı, tekrar deneyiniz!';
  }else {
      saveTelegramUserData($auth_data);
      header('Location: /');
  }
} catch (Exception $e) {
  die ($e->getMessage());
}