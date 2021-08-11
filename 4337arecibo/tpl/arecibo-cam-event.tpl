
[% IF NOT "$event.date_fmt" %]
    [% RETURN %]
[% END %]

<div class="w3-container">

<h4 id="[% event.OWC_id %]">[% event.date_fmt %]
                [% IF event.past %]
                    <span style="color:#F00">(PAST)</span>
                [% ELSE %]
                    in <span style="color:#6F0">[% event.time_remaining %]</span>
                [% END %]
&nbsp; - &nbsp;
[% FOREACH region IN event.regions %]
    [% IF region != event.regions.last %]
        [% region %],&nbsp;
    [% ELSE %]
        [% region %]
    [% END %]
[% END %]
</h4>

<a href="https://cloud.occultwatcher.net/event/[% event.OWC_id %]" target="_blank">OWC Event Page</a>
&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="#top">Back to top</a>
<p />
Locations: 
[% FOREACH country IN event.countries %]
    [% IF country != event.countries.last %]
        [% country %],&nbsp;
    [% ELSE %]
        [% country %]
    [% END %]
[% END %]
<p />
[% INCLUDE "$TG/imgr.tpl" file = "https://www.occultwatcher.net/occ/OccultMap.ashx?id=$event.OWC_id" w = "40%" %] 


<p />
<hr />
<p />

</div>







