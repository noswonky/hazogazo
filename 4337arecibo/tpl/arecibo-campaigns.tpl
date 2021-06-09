
[% region_list = data.region_list %]
[% event_list = data.event_list %]

[% Xregion_list = [
        'North America',
        'South America',
        'East Asia',
        'Africa',
    ]
%]

[% Xevent_list = [
        {
            date_fmt => 'June 9, 2021',
            OWC_id   => '159-4337-250638-646390-G24747',
            countries  => [ 'Benin', 'Bolivia', 'Brazil', 'Chad', 'Ghana', 'Ivory Coast', 'Niger', 'Nigeria', 'Peru', 'Togo' ],
            regions  => [ 'South America', 'Africa' ],
        },
        {
            date_fmt => 'June 9, 2021',
            OWC_id   => '159-4337-250589-646390-U116848',
            countries  => [ 'Canada', 'Japan', 'Mexico', 'Russia', 'United States', ],
            regions     => [ 'East Asia', 'North America' ],
        },
        {
            date_fmt => 'June 30, 2021',
            OWC_id   => '180-4337-246553-646392-U113857',
            countries  => [ 'Bermuda', 'Canada', 'Mexico', 'The Bahamas', 'United States', ]
            regions  => [ 'North America' ]
        },
        {
            date_fmt => '',
            OWC_id   => '',
            regions  => [ '', ],
        },
    ]
%]

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

 <h4>Upcoming Events of Particular Interest</h4>

<ul>
[% FOREACH event IN event_list %]

    [% IF "$event.date_fmt" %]
        <li> <a href="#[% event.OWC_id %]">[% event.date_fmt %]</a>
            in
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

Region = [% region %]


[% FOREACH event IN event_list %]

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







