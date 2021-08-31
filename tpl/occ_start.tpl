


<h3>What You Need to Get Started</h3>

You can observe occultations using nothing but a telescope. However for the results to
be of scientific value you also need to record accurate timings for the events.
Accurate timing is difficult if you are observing visually (looking through the eyepiece),
but acceptable results can be achieved. It is better to record video with timing information
recorded automatically on the video frames.


<ul>
    <h5>For visual or video observing you need:</h5>
    <li>A source of occultation predictions</li>
    <li>A Telescope</li>
    <li>A method for accurate timing</li>

    <h5>And for video observing, you also need:</h5>
    <li>A Camera which can produce/record video</li>
    <li>A means of recording the video (if the camera does not record itself)</li>
    <li>Analysis Software</li>
</ul>

<p />

<h4>Predictions</h4>

You will need predictions so that you know which star to look at and when.
The easiest source of predictions is 'Occult Watcher' - an application which runs on Windows. This gathers predictions from a variety
of sources (called Feeds) and displays them in a convenient list. However it depends on suitable feeds being available for your part of the world.
If you live in hte U.S.A, Europe, Eastern Australia, New Zealand, or Japan you should have no problem.

[% links = [
    { name => "The Easiest Way",   url => "", desc => "" },
    { name => "Occult Watcher",   url => "http://occultwatcher.net", desc => "Prediction Agregator Software (Windows Only)" },

    { name => "For the more adventurous",   url => "", desc => "" },
    { name => "Occult 4",   url => "http://www.lunar-occultations.com/iota/occult4.htm", desc => "Generate your own predictions (for any location)" },
    { name => "Steve Preston's Site",   url => "https://www.asteroidoccultation.com/", desc => "Web site with lists of predictions" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
   ]
%]
[% INCLUDE "$TG/linklist.tpl" %]


<p />

<h4>Telescope</h4>

Almost any telescope can be used to observe occultations. However, a good tracking mount is highly recommended. This can be equatorial or alt-azimuth.
Long focal lengths (more than 2000m) should usually be avoided due to the small field of view and the need for longer exposures, as this reduces timing resolution.
<p />
Most refractors and Newtonian reflectors are suitable, while Schmidt Cassegrain telescopes can be used but a focal reducer is recommended.

<p />

<h4>Timing</h4>

You will need to record accurate timings for your occultation events. 
The method you use will depend on whether you are observing visually or with a camera, and the type of camera you are using.
Here are the main alternatives.

<ul>
    <li>For visual observing, a time source that produced audio 'beeps', and an audio recorder</li>
    <li>For analog video cameras use a GPS Time inserter</li>
    <li>You can use the QHY174GPS camera which has built-in GPS timing</li>
    <li>For all other cameras use the "flash-tag" timing method. There are two types:</li>
        <ul>
            <li>Smartphone apps for Android and iOS</li>
            <li>Hardware flash tag devices</li>
        </ul>
        </li>
</ul>

Note that the systems that use GPS are the best. Systems using NTP are next best, and 
systems that use a smart phone's built-in clock are the least accurate.


<p />
The 'flash-tag' timing method has the advantage that it can be used with almost any camera but is probably the most difficult to use.
To use this method, you place a flashing LED in the optical path - in front of the telescope - so that
the flashes are recorded on your video. You can then derive the times of occultation events from their relationship to the flashes.
The smart phone flash-tag apps typically use the phone's clock and so are less accurate than methods which use GPS timing.
<p />
[% links = [
    { name => "Timing for visual observing",   url => "", desc => "" },
    { name => "GPS-ABC",   url => "http://www.kuriwaobservatory.com/GPS-ABC.html", desc => "A GPS based timer" },
    { Xname => "Emerald Time",   url => "http://emeraldsequoia.com/et/", desc => "iPhone App using NTP" },

    { name => "Timing for video",   url => "", desc => "" },
    { name => "IOTA VTI",   url => "https://videotimers.com", desc => "GPS Time Inserter for Analog Video" },
    { name => "Kiwi OSD",   url => "https://sites.google.com/site/kiwiosd/", desc => "GPS Time Inserter for Analog Video (No Longer Produced)" },
    { name => "Black Box Sprite",   url => "https://www.blackboxcamera.com/pic-osd/sprite.htm", desc => "GPS Time Inserter for Analog Video" },
    { name => "QHY 174 GPS Camera",   url => "https://www.qhyccd.com/qhy174gps/", desc => "A camera with built-in GPS timestamping" },
    { name => "Aatr Olsen's flash tagger",   url => "https://www.youtube.com/watch?v=gN4TcYf_wfg", desc => "A GPS/Arduino based device by Aart Olsen (YouTube Presentation)" },
    { name => "Occult Flash Tag",   url => "https://play.google.com/store/apps/details?id=br.eti.erickcouto.occultflashtag&hl=en&gl=US", desc => "Android Phone App" },
    { name => "Astro Flash Timer",   url => "https://sites.google.com/site/astroflashtimer/home", desc => "Phone app for iOS and Android" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },

   ]
%]
[% INCLUDE "$TG/linklist.tpl" %]

<p />

<h4>Camera</h4>

There are three categories of camera you can use:

<ul>
    <li>Analog video camera</li>
    <li>The QHY 174GPS camera</li>
    <li>All other cameras</li>
</ul>

The cameras are divided into these three categories based on the timing method you can use with them.
Analog video has the advantage that it is easy to overlay video timestamps onto the video frames.
For analog video cameras you can use a time inserter such as the IOTA VTI to timestamp the video.
<p />
Alternatively, the QHY 174GPS camera has its own built-in GPS unit which provides an accurate timestamp on each frame.
<p />
For other cameras, timing is more difficult but it can be done. See the 'Timing' section above.

[% links = [

    { name => "Watec 910BD or 910HX",   url => "http://www.watec-shop.com/en/products/monochrome-cameras/wat-910bd-color-board-camera-unit-910hx-59.html", desc => "Analog video - Use IOTA VTI for timing" },
    { name => "TACOS-BD Camera",   url => "http://www.kuriwaobservatory.com/TACOS_BD-System.html", desc => "A Watec 910BD in a better housing - Use IOTA VTI for timing" },
    { name => "QHY 174 GPS Camera",   url => "https://www.qhyccd.com/qhy174gps/", desc => "A camera with built-in GPS timestamping" },
    { name => "Runcam Night Eagle Astro",   url => "https://shop.runcam.com/runcam-night-eagle-astro/", desc => "Analog video - Use IOTA VTI for timing" },
    { name => "IOTA Night Eagle Kit",   url => "https://occultations.org/night-eagle-2-pro-astro-edition-ordering-page/", desc => "The Runcam Night Eagle in a kit" },
    { name => "Malincam 828",   url => "http://www.mallincamusa.com/Updates%20-%20July%202005/RECON.htm", desc => "Analog Video" },
    { name => "See Also:",   url => "", desc => "" },
    { name => "IOTA's Recommended Analog Cameras",   url => "https://occultations.org/observing/recommended-equipment/analog-video-cameras/", desc => "" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
   ]
%]

[% INCLUDE "$TG/linklist.tpl" %]


<p />


<h4>Recording Video</h4>

Some observers use camcorders or small video recorders to record their video. This can be convenient for mobile stations,
but a better method for home use is to record to a computer. If you're using an analog video camera you will need to
capture and digitise the video to record it to a PC. 


[% links = [
    { name => "Recommended Capture Device",   url => "", desc => "" },
    { name => "StarTech SVID2USB232",   url => "https://www.startech.com/en-au/audio-video-products/svid2usb232", desc => "Video to USB capture" },
    { name => "Software - See:",   url => "", desc => "" },
    { name => "IOTA's Video Recording Guide",   url => "https://occultations.org/observing/educational-materials/equipment/analog-video-recording-in-windows/", desc => "" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
   ]
%]
[% INCLUDE "$TG/linklist.tpl" %]

<h4>Analysis Software</h4>

After your video is recorded you will need to generate a light curve and measure the timing of the event.


[% links = [
    { name => "Video Analysis (Light Curves)",   url => "", desc => "" },
    { name => "Tangra",   url => "http://www.hristopavlov.net/Tangra3/", desc => "Video andlysis software" },
    { name => "LiMovie",   url => "http://astro-limovie.info/limovie/limovie_en.html", desc => "Video analysis software" },
    { name => "PyMovie",   url => "https://occultations.org/observing/software/pymovie/", desc => "Video analysis software" },
    { name => "Timing Extraction",   url => "", desc => "" },
    { name => "AOTA (part of Occult)",   url => "https://occultations.org/observing/software/occult/", desc => "Timing extraction and analysis" },
    { name => "PyOTE",   url => "https://occultations.org/observing/software/ote/", desc => "Timing extraction and analysis" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
   ]
%]
[% INCLUDE "$TG/linklist.tpl" %]

[%#
    { name="IOTA Complete Occultation Kit", url => "https://occultations.org/observing/recommended-equipment/iota-vti/", desc => "Buy a kit with most of what you need in one package" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
    { name => "",   url => "", desc => "" },
%]
