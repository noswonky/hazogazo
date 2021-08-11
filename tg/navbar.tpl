
[% DEFAULT this_page = "home" %]

<p />
[% FOREACH link IN link_list %]
    [% IF link.page == this_page %]
        <h5 style="display:inline; padding:3px 10px; color:#FFF; background-color:#33F;">[%link.title%]</h5>
    [% ELSE %]
        <h5 style="display:inline; padding:3px 10px; color:white;"><a href="[%ROOT_SCRIPT%]?pg=[%link.page%]">[%link.title%]</a></h5>
    [% END %]

    [% IF link.last != 1 %]
        |
    [% END %]
[% END %]






