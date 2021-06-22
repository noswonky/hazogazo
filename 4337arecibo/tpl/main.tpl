

[% ROOT = "/4337arecibo" %]
[% ROOT_SCRIPT = "/4337arecibo/$this_script" %]

[% HOME = '/' %]


[% DEFAULT subdir='live' %]
[% DEFAULT pg='overview' %]

[% TPL = "./$subdir/tpl" %]
[% IMG = "$ROOT/$subdir/img" %]


[% HL_STYLE = "background-color:#33F;" %]

[% DEFAULT include_tpl = "$TPL/arecibo-overview.tpl" %]

[% IF pg == 'overview' %]

    [% HL_OVERVIEW = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-overview.tpl" %]

[% ELSIF pg == 'observations' %]

    [% HL_OBSERVATIONS = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-observations.tpl" %]

[% ELSIF pg == 'campaigns' %]

    [% HL_CAMPAIGNS = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-campaigns.tpl" %]

[% ELSIF pg == 'publications' %]

    [% HL_PUBLICATIONS = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-publications.tpl" %]

[% ELSIF pg == 'contact' %]

    [% HL_CONTACT = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-contact.tpl" %]

[% ELSIF pg == 'simple' %]

    [% HL_SIMPLE = "$HL_STYLE" %]
    [% include_tpl = "$TPL/arecibo-simple.tpl" %]

[% END %]

<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Hazelbrrook Observatory</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" -->
<link rel="stylesheet" href="../css/w3.css">
<style>
</style>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<body class='w3-black'>

<!-- Start Content -->
<div id="main" class="w3-content w3-dark-blue">
 

<img src="[%IMG%]/arecibo-banner.jpg" style="width:100%">

<div class="w3-bar w3-blue">
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-left w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
  <a href="[% ROOT_SCRIPT %]" class="w3-bar-item w3-button w3-hide-small" style="[% HL_OVERVIEW %]">Discovery</a>
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
  <a href="[% ROOT_SCRIPT %]?pg=overview" class="w3-bar-item w3-button" style="[%HL_OVERVIEW%]">Discovery</a>
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

    <!--
        [% IF pg == 'overview' %]
            [% INCLUDE "$TPL/arecibo-overview.tpl" %]
        [% ELSIF pg == 'observations' %]
            [% INCLUDE "$TPL/arecibo-observations.tpl" %]
        [% ELSIF pg == 'campaigns' %]
            [% INCLUDE "$TPL/arecibo-campaigns.tpl" %]
        [% ELSIF pg == 'publications' %]
            [% INCLUDE "$TPL/arecibo-publications.tpl" %]
        [% END %]
    -->
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
