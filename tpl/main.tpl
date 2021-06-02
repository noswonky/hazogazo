
[%# ROOT = "$this_script" %]
[%# DEFAULT subdir='live' %]
[%# DEFAULT pg='home' %]
[%# ARECIBO = 'http://www.hazelbrookobservatory.com/4337arecibo' %]


[% ROOT = "/" %]
[% ROOT_SCRIPT = "/$this_script" %]
[% HOME = '/' %]


[% DEFAULT subdir='live' %]
[% DEFAULT pg='home' %]

[% TPL = "./$subdir/tpl" %]
[% IMG = "/$subdir/img" %]




<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Hazelbrrook Observatory</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" -->
<link rel="stylesheet" href="/[%subdir%]/css/w3.css">
<style>
</style>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<body class='w3-black'>

<!-- Start Content -->
<div id="main" class="w3-content w3-dark-blue">

<map name="bannermap">
    <area shape="rect" coords="0,0,50,50" alt="Arecibo" href="/4337arecibo">
</map>


<img src="[% IMG %]/hazogazo-banner-2.jpg" style="width:100%" usemap="#bannermap">

<div class="w3-bar w3-blue">
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-left w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
  <a href="[%ROOT_SCRIPT%]" class="w3-bar-item w3-button">Home</a>
  <a href="[%ROOT_SCRIPT%]?pg=occultations" class="w3-bar-item w3-button w3-hide-small">Occultations</a>
  <a href="[%ROOT_SCRIPT%]?pg=contact" class="w3-bar-item w3-button w3-hide-small">Contact</a>
</div>

<div id="demo" class="w3-bar-block w3-red w3-hide w3-hide-large w3-hide-medium">
  <a href="[%ROOT_SCRIPT%]?pg=occultations" class="w3-bar-item w3-button">Occultations</a>
  <a href="[%ROOT_SCRIPT%]?pg=Contact" class="w3-bar-item w3-button">Contact</a>
</div>


<div class="w3-container">

    <!-- div class="w3-cell" style="vertical-align:top;">
    -->
    <div class="w3-row">

        <div class="w3-col l10 m10 s12">

        [% IF pg == 'home' %]
            [% INCLUDE "$TPL/home.tpl" %]
        [% ELSIF pg == 'occultations' %]
            [% INCLUDE "$TPL/occultations.tpl" %]
        [% ELSIF pg == 'contact' %]
            [% INCLUDE "$TPL/contact.tpl" %]
        [% ELSIF pg == 'arecibo' %]
            [% INCLUDE "$TPL/arecibo.tpl" %]
        [% END %]

        </div>

        <div class="w3-col l2 m2 w3-hide-small" style="padding-top:10px; padding-right:10px;">

            <a class="twitter-timeline" data-theme="dark" href="https://twitter.com/WonkyAstronomer/lists/astronews?ref_src=twsrc%5Etfw">A Twitter List by WonkyAstronomer</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


        </div>
    </div>



</div>

<script>
function myFunction() {
  var x = document.getElementById("demo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>






</body>
</html>