
[% DEFAULT w = "75%" %]
[% DEFAULT style = "" %]

[% IF wl %]

<div class="w3-container w3-hide-medium w3-hide-small" style="width:[% wl %]; border:1px solid #666; margin:5px; [% style %]">
    <div>
        <a href="[% file %]" style="font-size:70%">Click for full size L</a>
    </div>

    <div>
        <a href="[% file %]">
            <img src="[% file %]" width="100%" />
        </a>
    </div>

    <div style="padding:5px">
        [% caption %]
    </div>

</div>
<div class="w3-container w3-hide-large" style="width:[% w %]; border:1px solid #666; margin:5px; [% style %]">
    <div>
        <a href="[% file %]" style="font-size:70%">Click for full size MS</a>
    </div>

    <div>
        <a href="[% file %]">
            <img src="[% file %]" width="100%" />
        </a>
    </div>

    <div style="padding:5px">
        [% caption %]
    </div>

</div>


[% ELSE %]

<div class="w3-container" style="width:[%w%]; border:1px solid #666; margin:5px; [% style %]">

    <div>
        <a href="[% file %]" style="font-size:70%">Click for full size O</a>
    </div>

    <div>
        <a href="[% file %]">
            <img src="[% file %]" width="100%" />
        </a>
    </div>

    <div style="padding:5px">
        [% caption %]
    </div>

</div>

[% END %]
