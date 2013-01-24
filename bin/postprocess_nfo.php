<?php

require_once("config.php");
require_once(WWW_DIR."/lib/postprocess.php");

$db = new DB();
$nfo_remaining_query = "SELECT COUNT(*) AS cnt FROM releases r WHERE r.releasenfoID = 0;";
$nfo_remaining_now = $db->query($nfo_remaining_query);
$nfo_remaining_now = $nfo_remaining_now[0]['cnt'];

$toProcess = ($nfo_remaining_now >= 100 ? 100 : $nfo_remaining_now);

for ($i=1;$i<=$toProcess;$i++)
{
	$postprocess = new PostProcess(true);
	$postprocess->processNfos();
}

?>