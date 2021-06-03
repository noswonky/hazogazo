

[%# For links with refer to pages within the site, begin the URL with ROOT_SCRIPT %]
[% ROOT = "/" %]
[% ROOT_SCRIPT = "/$this_script" %]


[% DEFAULT subdir='live' %]
[% DEFAULT pg='home' %]

[%# For template INCLUDES, begin the path with TPL %]
[% TPL = "./$subdir/tpl" %]
[%# For image tags, begin the src URL with IMG %]
[% IMG = "/$subdir/img" %]


[% IF pg == 'home' %]

    [% HL_HOME = 'w3-grey' %]
    [% include_tpl =  "$TPL/home.tpl" %]

[% ELSIF pg == 'obs' %]

    [% HL_OBS = 'w3-grey' %]
    [% include_tpl =  "$TPL/obs.tpl" %]

[% ELSIF pg == 'obs_build' %]

    [% HL_OBS = 'w3-grey' %]
    [% include_tpl =  "$TPL/obs_build.tpl" %]

[% ELSIF pg == 'obs_tour' %]

    [% HL_OBS = 'w3-grey' %]
    [% include_tpl =  "$TPL/obs_tour.tpl" %]

[% ELSIF pg == 'obs_equip' %]

    [% HL_OBS = 'w3-grey' %]
    [% include_tpl =  "$TPL/obs_equip.tpl" %]

[% ELSIF pg == 'occultations' %]

    [% HL_OCCULTATIONS = 'w3-grey' %]
    [% include_tpl =  "$TPL/occultations.tpl" %]

[% ELSIF pg == 'videos' %]

    [% HL_VIDEOS = 'w3-grey' %]
    [% include_tpl =  "$TPL/videos.tpl" %]

[% ELSIF pg == 'contact' %]

    [% HL_CONTACT = 'w3-grey' %]
    [% include_tpl =  "$TPL/contact.tpl" %]

[% END %]



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
  <a href="[%ROOT_SCRIPT%]" class="w3-bar-item w3-button [%HL_HOME%]">Home</a>
  <a href="[%ROOT_SCRIPT%]?pg=obs" class="w3-bar-item w3-button w3-hide-small [%HL_OBS%]">Observatory</a>
  <a href="[%ROOT_SCRIPT%]?pg=occultations" class="w3-bar-item w3-button w3-hide-small [%HL_OCCULTATIONS%]">Occultations</a>
  <a href="[%ROOT_SCRIPT%]?pg=videos" class="w3-bar-item w3-button w3-hide-small [%HL_VIDEOS%]">Videos</a>
  <a href="[%ROOT_SCRIPT%]?pg=contact" class="w3-bar-item w3-button w3-hide-small [%HL_CONTACT%]">Contact</a>
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

            [% INCLUDE "$include_tpl" %]

        </div>

        <div class="w3-col l2 m2 w3-hide-small" style="padding-top:10px; padding-right:10px;">

            <a class="twitter-timeline" data-width="250" data-height="1200" data-theme="dark" href="https://twitter.com/TheHazoGazo/lists/1400437010670657539?ref_src=twsrc%5Etfw">A Twitter List by TheHazoGazo</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


            [%# <a class="twitter-timeline" data-theme="dark" href="https://twitter.com/WonkyAstronomer/lists/astronews?ref_src=twsrc%5Etfw">A Twitter List by WonkyAstronomer</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
            %]


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
