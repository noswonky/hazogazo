

[%# For links with refer to pages within the site, begin the URL with ROOT_SCRIPT %]
[% ROOT = "/" %]
[% ROOT_SCRIPT = "/$this_script" %]
    


[% DEFAULT subdir='live' %]
[% DEFAULT pg='obs' %]

[%# For template INCLUDES, begin the path with TPL %]
[% TPL = "./$subdir/tpl" %]
[% TG = "./$subdir/tg" %]
[%# For image tags, begin the src URL with IMG %]
[% IMG = "/$subdir/img" %]
[% JS = "/$subdir/js" %]

[% HL_STYLE = "background-color:#33F;" %]

[% DEFAULT include_tpl =  "$TPL/obs.tpl" %]

[% IF pg == 'obs' %]

    [% HL_OBS = "$HL_STYLE" %]
    [% include_tpl =  "$TPL/obs.tpl" %]

[% ELSIF pg == 'occultations' %]

    [% HL_OCCULTATIONS = "$HL_STYLE" %]
    [% include_tpl =  "$TPL/occultations.tpl" %]

[% ELSIF pg == 'videos' %]

    [% HL_VIDEOS = "$HL_STYLE" %]
    [% include_tpl =  "$TPL/videos.tpl" %]

[% ELSIF pg == 'news' %]

    [% HL_NEWS = "$HL_STYLE" %]
    [% include_tpl =  "$TPL/news.tpl" %]

[% ELSIF pg == 'contact' %]

    [% HL_CONTACT = "$HL_STYLE" %]
    [% include_tpl =  "$TPL/contact.tpl" %]

[% END %]



<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Hazelbrook Observatory</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" -->
<link rel="stylesheet" href="/[%subdir%]/css/w3.css">
<script type="text/javascript" src="[%JS%]/video-display.js"></script>

<style>

h2 {
    color:#ff9;
    font-weight:900;
    font-size:28;
}
h3 {
    color:#ff9;
    font-weight:900;
    font-size:24px;
    font-style:italic;
}
h4 {
    color:#ff6;
    font-weight:900;
    font-size:20px;
    font-style:italic;
}
h5 {
    color:#fff;
    font-weight:900;
    font-size:16px;
    font-style:italic;
}

</style>

<script src="https://www.w3schools.com/lib/w3.js"></script>

<body class='w3-black'>

<!-- Start Content -->
<div id="main" class="w3-content w3-dark-blue">

<div style="position:relative; width:100%">
<img src="[% IMG %]/hazogazo-banner-2.jpg" style="width:100%;">
    <a href="[%ROOT_SCRIPT%]?pg=contact">
        <div style="position:absolute; bottom:22px; left:0px;"> <img src="[%IMG%]/social-logos-small.png" width="150px" /></div>
        <div style="position:absolute; bottom:4px; left:8px;"> @TheHazoGazo </div>
    </a>
</div>

<div class="w3-bar w3-blue">
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-left w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
  <a href="[%ROOT_SCRIPT%]" class="w3-bar-item w3-button w3-hide-small" style="[%HL_OBS%]">Observatory</a>
  <a href="[%ROOT_SCRIPT%]?pg=videos" class="w3-bar-item w3-button w3-hide-small" style="[%HL_VIDEOS%]">Videos</a>
  <a href="[%ROOT_SCRIPT%]?pg=occultations" class="w3-bar-item w3-button w3-hide-small" style="[%HL_OCCULTATIONS%]">Occultations</a>
  <a href="[%ROOT_SCRIPT%]?pg=news" class="w3-bar-item w3-button w3-hide-small" style="[%HL_NEWS%]">News</a>
  <a href="[%ROOT_SCRIPT%]?pg=contact" class="w3-bar-item w3-button w3-hide-small" style="[%HL_CONTACT%]">Contact</a>
    [% IF subdir == 'live' %]
        <a href="/4337arecibo" class="w3-bar-item w3-button" style="float:right;">Asteroid Moon Discovery</a>
    [% ELSE %]
        <a href="/4337arecibo/stage.cgi" class="w3-bar-item w3-button" style="float:right;">Asteroid Moon Discovery</a>
    [% END %]
</div>

<div id="demo" class="w3-bar-block w3-blue w3-hide w3-hide-large w3-hide-medium">
  <a href="[%ROOT_SCRIPT%]?pg=obs" class="w3-bar-item w3-button" style="[%HL_OBS%]">Observatory</a>
  <a href="[%ROOT_SCRIPT%]?pg=videos" class="w3-bar-item w3-button" style="[%HL_VIDEOS%]">Videos</a>
  <a href="[%ROOT_SCRIPT%]?pg=occultations" class="w3-bar-item w3-button" style="[%HL_OCCULTATIONS%]">Occultations</a>
  <a href="/4337arecibo" class="w3-bar-item w3-button" style="[%HL_ARECIBO%]">Moon Discovery</a>
  <a href="[%ROOT_SCRIPT%]?pg=contact" class="w3-bar-item w3-button" style="[%HL_CONTACT%]">Contact</a>
</div>


<div class="w3-container">


    [% INCLUDE "$include_tpl" %]


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
