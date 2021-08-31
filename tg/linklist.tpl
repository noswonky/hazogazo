
<ul>
    [% FOREACH link IN links %]
        [% IF link.name %]

            [% IF link.url %]
                <li> [% INCLUDE "$TG/link.tpl" name="$link.name" url="$link.url" %]
                [% IF link.desc %]
                    -  <span style="font-size:80%">[% link.desc %]</span>
                [% END %]
                </li>
            [% ELSE %]
                <h5>[% link.name %]</h5>
                [% IF link.desc %]
                    -  <span style="font-size:80%">[% link.desc %]</span>
                [% END %]
            [% END %]

        [% END %]
    [% END %]
</ul>

