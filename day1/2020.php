<?php
$f = array_flip(file('input'));
foreach($f as $k => $v) {
  $k = trim($k);
  $search = 2020 - $k;
  if (isset($f["$search\n"])) { echo "$k + $search = 2020\n$k * $search = ".($k*$search)."\n"; }
}
