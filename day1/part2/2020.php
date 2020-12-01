<?php
foreach(file('input') as $val) { $f[trim($val)] = 1; }
foreach($f as $k => $v) {
  $search = 2020 - $k;
  foreach($f as $k2 => $v2) {
    $search2 = $search - $k2;
    if (isset($f[$search2])) { echo "$k + $k2 + $search2 = 2020\n$k * $k2 * $search2 = ".($k*$k2*$search2)."\n"; }
  }
}
