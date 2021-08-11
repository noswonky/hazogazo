

[% vid_width_large = 800 %]
[% vid_height_large = 457 %]

[% vid_width_medium = 500 %]
[% vid_height_medium = 286 %]

[% vid_width_small = 400 %]
[% vid_height_small = 229 %]


[% IF vid_id %]

    <div class="w3-container w3-hide-medium w3-hide-small" >

        <iframe width="[%vid_width_large%]" height="[%vid_height_large%]" src="https://www.youtube.com/embed/[%vid_id%]" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

    </div>

    <div class="w3-container w3-hide-large w3-hide-small" >
    
        <iframe width="[%vid_width_medium%]" height="[% vid_height_medium %]" src="https://www.youtube.com/embed/[%vid_id%]" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

    </div>

    <div class="w3-container w3-hide-large w3-hide-medium" >

        <iframe width="[%vid_width_small%]" height="[%vid_height_small%]" src="https://www.youtube.com/embed/[%vid_id%]" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

    </div>

[% ELSE %]

    No video found.

[% END %]






