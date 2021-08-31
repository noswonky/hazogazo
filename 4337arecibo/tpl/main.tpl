

[% ROOT = "/$arecibo_dir" %]
[% ROOT_SCRIPT = "/$arecibo_dir/$this_script" %]

[% HOME = '/' %]


[% DEFAULT subdir='live' %]
[% DEFAULT pg='faq' %]

[% TPL = "./$subdir/tpl" %]
[% TG = "./$subdir/tg" %]    [%# Generic Templates %]
[% IMG = "$ROOT/$subdir/img" %]
[% JS = "$ROOT/$subdir/js" %]


[% HL_STYLE = "background-color:#33F;" %]

[% DEFAULT include_tpl = "$TPL/arecibo-faq.tpl" %]


[% IF pg == 'observations' %]

    [% HL_OBSERVATIONS = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-observations.tpl" %]

[% ELSIF pg == 'campaigns' %]

    [% HL_CAMPAIGNS = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-campaigns.tpl" %]

[% ELSIF pg == 'publications' %]

    [% HL_PUBLICATIONS = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-publications.tpl" %]

[% ELSIF pg == 'videos' %]

    [% HL_VIDEOS = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-videos.tpl" %]

[% ELSIF pg == 'contact' %]

    [% HL_CONTACT = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-contact.tpl" %]

[% ELSIF pg == 'faq' %]

    [% HL_FAQ = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-faq.tpl" %]

[% END %]

<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Hazelbrrook Observatory</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" -->
<link rel="stylesheet" href="../css/w3.css">
<!-- <script src="https://www.w3schools.com/lib/w3.js"></script> -->
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
    font-size:22px;
    font-style:italic;
}
h4 {
    color:#ff6;
    font-weight:900;
    font-size:18px;
    font-style:italic;
    Xtext-decoration:underline;
}

</style>

<body class='w3-black'>

<!-- Start Content -->
<div id="main" class="w3-content w3-dark-blue">
 

<div style="position:relative; width:100%">
<img src="[% IMG %]/arecibo-banner-2.jpg" style="width:100%;">
    <Xa href="[%ROOT_SCRIPT%]?pg=contact">
        <div style="position:absolute; bottom:22px; right:0px;"> <img src="[%IMG%]/social-logos-small.png" width="150px" usemap="#socialmap" /></div>
        <div style="position:absolute; bottom:4px; right:8px;"> @TheHazoGazo </div>
    </Xa>
</div>

<map name="socialmap">
  <area shape="circle" coords="32,28,22" alt="Twitter" href="https://twitter.com/TheHazoGazo">
  <area shape="circle" coords="79,28,22" alt="Instagram" href="https://www.instagram.com/thehazogazo">
  <area shape="circle" coords="126,28,22" alt="Facebook" href="https://www.facebook.com/TheHazoGazo">
</map>

<div class="w3-bar w3-blue">
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-left w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
  <a href="[% ROOT_SCRIPT %]" class="w3-bar-item w3-button w3-hide-small" style="[% HL_FAQ %]">Intro/FAQ</a>
  <a href="[% ROOT_SCRIPT %]?pg=videos" class="w3-bar-item w3-button w3-hide-small" style="[% HL_VIDEOS %]">Videos</a>
  <a href="[% ROOT_SCRIPT %]?pg=observations" class="w3-bar-item w3-button w3-hide-small" style="[% HL_OBSERVATIONS %]">Analysis</a>
  <a href="[% ROOT_SCRIPT %]?pg=campaigns" class="w3-bar-item w3-button w3-hide-small" style="[% HL_CAMPAIGNS %]">Campaigns</a>
  <a href="[% ROOT_SCRIPT %]?pg=publications" class="w3-bar-item w3-button w3-hide-small" style="[% HL_PUBLICATIONS %]">Publications</a>
  <a href="[% ROOT_SCRIPT %]?pg=contact" class="w3-bar-item w3-button w3-hide-small" style="[% HL_CONTACT %]">Contact</a>
    [% IF subdir == 'live' %]
        <a href="/" class="w3-bar-item w3-button" style="float:right;">Observatory Home</a>
    [% ELSE %]
        <a href="/stage.cgi" class="w3-bar-item w3-button" style="float:right;">Observatory Home</a>
    [% END %]
</div>

<div id="demo" class="w3-bar-block w3-blue w3-hide w3-hide-large w3-hide-medium">
  <a href="[% ROOT_SCRIPT %]" class="w3-bar-item w3-button" style="[%HL_FAQ%]">Intro/FAQ</a>
  <a href="[% ROOT_SCRIPT %]?pg=videos" class="w3-bar-item w3-button" style="[%HL_VIDEOS%]">Videos</a>
  <a href="[% ROOT_SCRIPT %]?pg=observations" class="w3-bar-item w3-button" style="[%HL_OBSERVATIONS%]">Analysis</a>
  <a href="[% ROOT_SCRIPT %]?pg=campaigns" class="w3-bar-item w3-button" style="[%HL_CAMPAIGNS%]">Campaigns</a>
  <a href="[% ROOT_SCRIPT %]?pg=publications" class="w3-bar-item w3-button" style="[%HL_PUBLICATIONS%]">Publications</a>
  <a href="[% ROOT_SCRIPT %]?pg=contact" class="w3-bar-item w3-button" style="[%HL_CONTACT%]">Contact</a>
    [% IF subdir == 'live' %]
        <a href="/" class="w3-bar-item w3-button">Observatory Home</a>
    [% ELSE %]
        <a href="/stage.cgi" class="w3-bar-item w3-button">Observatory Home</a>
    [% END %]
</div>


<div class="w3-container">

    <div class="w3-cell" style="vertical-align:top;">

        [% INCLUDE "$include_tpl" %]

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
