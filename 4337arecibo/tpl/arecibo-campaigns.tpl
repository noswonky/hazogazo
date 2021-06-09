
[% region_list = [
        'North America',
        'South America',
        'East Asia',
        'Africa',
    ]
%]

[% event_list = [
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

<!--
Regions:
[% FOREACH region IN region_list %]
    <a href="[%ROOT_SCRIPT%]?pg=campaigns&region=[% region %]">[% region %]</a> &nbsp;
[% END %]
<p />
-->

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
            [% FOREACH region IN event.regions %]
                [% IF region != event.regions.last %]
                    [% region %],&nbsp;
                [% ELSE %]
                    [% region %]
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

    [% INCLUDE "$TPL/arecibo-cam-event.tpl" %]

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







