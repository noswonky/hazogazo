
[% region_list = data.region_list %]
[% event_list = data.event_list %]


<div class="w3-container">
<h2 id="top">Arecibo Campaigns</h2>

Regions:
    [% IF ! region %]
        <h5 style="display:inline; padding:3px 10px; color:#FFF; background-color:#33F;">All</h5>
    [% ELSE %]
        <h5 style="display:inline; padding:3px 10px; color:white;"><a href="[%ROOT_SCRIPT%]?pg=campaigns">All</a></h5>
    [% END %]
[% FOREACH region_name IN region_list %]
    <!--
    <a href="[%ROOT_SCRIPT%]?pg=campaigns&region=[% region %]">[% region %]</a> &nbsp;
    -->

    [% IF region == region_name %]
        <h5 style="display:inline; padding:3px 10px; color:#FFF; background-color:#33F;">[% region_name %]</h5>
    [% ELSE %]
        <h5 style="display:inline; padding:3px 10px; color:white;"><a href="[%ROOT_SCRIPT%]?pg=campaigns&region=[%region_name%]">[% region_name %]</a></h5>
    [% END %]
[% END %]

<p />

Observers are encouraged to observe the events below in order to confirm the existence of a satellite.
Please visit the 
<a href="https://cloud.occultwatcher.net/events/campaign/AreciboMoon">Occult Watcher Cloud Campaign Page</a>
for a full list of upcoming events for this campaign.

 <p />

 <h4>Upcoming Events:</h4>

<ul>
[% FOREACH event IN event_list %]
    [% LAST IF event.last == 1 %]

    [% IF ! region OR event.in_region %]

        <li> <a href="#[% event.OWC_id %]">[% event.date_fmt %]</a>
            [% IF event.past %]
                <span style="color:#F00">(PAST)</span>
            [% ELSE %]
                in <span style="color:#6F0">[% event.time_remaining %]</span>
            [% END %]
            &nbsp;&nbsp;

            [% FOREACH region_name IN event.regions %]
                [% IF region_name != event.regions.last %]
                    [% region_name %],&nbsp;
                [% ELSE %]
                    [% region_name %]
                [% END %]
            [% END %]
        </li>
    [% END %]
[% END %]

</ul>

<p />
<hr />
<p />


[% FOREACH event IN event_list %]
    [% LAST IF event.last == 1 %]

    [% IF ! region OR event.in_region %]
        [% INCLUDE "$TPL/arecibo-cam-event.tpl" %]
    [% END %]

[% END %]



<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />


</div>







