
[% DEFAULT w = "90%" %]
[% DEFAULT style = "" %]

<div class="w3-container" style="width:[%w%]; border:1px solid #666; [% style %]">

    <div>
        <a href="[% file %]" style="font-size:70%">Click for full size</a>
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

