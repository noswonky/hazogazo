
<style>
.XXnavbar {
    position:relative;
    border:solid 1px #ff0;
}
</style>

<p />

[% count = 0 %]
[% FOREACH tab IN tab_list %]

    [% IF 0 %]
        |
    [% END %]

    [% IF tab.t == t %]
        <h5 style="display:inline; padding:3px 10px; color:#FFF; background-color:#33F; border:1px solid #ff0;">[%tab.title%]</h5>
    [% ELSE %]
        <h5 style="display:inline; padding:3px 10px; color:#FFF; background-color:#333; border:1px solid #333; text-decoration:none;"><a style="text-decoration:none;" href="[%ROOT_SCRIPT%]?pg=[% pg %]&t=[% tab.t %]">[%tab.title%]</a></h5>
    [% END %]

    [% count = count + 1 %]
[% END %]

<p />

[%# Note: I can't get concatenation with '_' to work in the INCLUDE directive. So I do it in the SET %]
[% SET tab_template = t _ '.tpl' %]
[% INCLUDE "$TPL/$tab_template" %]





