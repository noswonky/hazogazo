

[% ROOT = "/4337arecibo" %]
[% ROOT_SCRIPT = "/4337arecibo/$this_script" %]

[%# ROOT = "/arecibotest" %]
[%# ROOT_SCRIPT = "/arecibotest/$this_script" %]

[% HOME = '/' %]


[% DEFAULT subdir='live' %]
[% DEFAULT pg='overview' %]

[% TPL = "./$subdir/tpl" %]
[% IMG = "$ROOT/$subdir/img" %]




[% IF pg == 'overview' %]
    [% HL_OVERVIEW = 'w3-grey' %]
[% ELSIF pg == 'observations' %]
    [% HL_OBSERVATIONS = 'w3-grey' %]
[% ELSIF pg == 'campaigns' %]
    [% HL_CAMPAIGNS = 'w3-grey' %]
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
  <a href="[% HOME %]" class="w3-bar-item w3-button">Observatory Home</a>
  <a href="[% ROOT_SCRIPT %]" class="w3-bar-item w3-button w3-hide-small [% HL_OVERVIEW %]">Overview</a>
  <a href="[% ROOT_SCRIPT %]?pg=observations" class="w3-bar-item w3-button w3-hide-small [% HL_OBSERVATIONS %]">Observations</a>
  <a href="[% ROOT_SCRIPT %]?pg=campaigns" class="w3-bar-item w3-button w3-hide-small [% HL_CAMPAIGNS %]">Campaigns</a>
  <a href="[% ROOT_SCRIPT %]?pg=publications" class="w3-bar-item w3-button w3-hide-small [% HL_PUBLICATIONS %]">Publications</a>
</div>

<div id="demo" class="w3-bar-block w3-blue w3-hide w3-hide-large w3-hide-medium">
  <a href="[% HOME %]" class="w3-bar-item w3-button">Hazelbrook Home</a>
  <a href="[% ROOT_SCRIPT %]?pg=overview" class="w3-bar-item w3-button">Overview</a>
  <a href="[% ROOT_SCRIPT %]?pg=observations" class="w3-bar-item w3-button">Observations</a>
  <a href="[% ROOT_SCRIPT %]?pg=campaigns" class="w3-bar-item w3-button">Campaigns</a>
  <a href="[% ROOT_SCRIPT %]?pg=publications" class="w3-bar-item w3-button">Publications</a>
</div>


<div class="w3-container">

    <div class="w3-cell" style="vertical-align:top;">

        [% IF pg == 'overview' %]
            [% INCLUDE "$TPL/arecibo-overview.tpl" %]
        [% ELSIF pg == 'observations' %]
            [% INCLUDE "$TPL/arecibo-observations.tpl" %]
        [% ELSIF pg == 'campaigns' %]
            [% INCLUDE "$TPL/arecibo-campaigns.tpl" %]
        [% ELSIF pg == 'publications' %]
            [% INCLUDE "$TPL/arecibo-publications.tpl" %]
        [% END %]

    </div>


    
<!--

    <div class="w3-cell w3-hide-small w3-black" style="width:250px">

        <div class="w3-card w3-margin">
            Links here<p />
        </div>

        <div class="w3-container" style="padding:1px;">
            <a class="twitter-timeline" data-lang="en" data-width="250" data-height="1500" data-theme="dark" href="https://twitter.com/WonkyAstronomer?ref_src=twsrc%5Etfw">Tweets by WonkyAstronomer</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        </div>

    </div>
-->


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
