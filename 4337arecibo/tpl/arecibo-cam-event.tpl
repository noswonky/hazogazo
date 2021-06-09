
[% IF NOT "$event.date_fmt" %]
    [% RETURN %]
[% END %]

<div class="w3-container">

<h4 id="[% event.OWC_id %]">[% event.date_fmt %] &nbsp; - &nbsp;
[% FOREACH region IN event.regions %]
    [% IF region != event.regions.last %]
        [% region %],&nbsp;
    [% ELSE %]
        [% region %]
    [% END %]
[% END %]
</h4>

<a href="https://cloud.occultwatcher.net/event/[% event.OWC_id %]">OWC Event Page</a>
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
<img src="https://www.occultwatcher.net/occ/OccultMap.ashx?id=[% event.OWC_id %]" style="width:90%" />

<p />
<hr />
<p />

</div>







