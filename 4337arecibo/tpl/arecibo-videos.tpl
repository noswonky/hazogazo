[% DEFAULT VID_LAYOUT = 'vertical' %]

[% VID_LAYOUT = 'horizontal' %]

<div class="w3-container">

[% DEFAULT VID_DATA = {
    vid_list    => [ ],
    vid_id      => '',

} %]

[% VID_DATA = {
        vid_list    => [

            {
                type    => 'heading',
                text    => 'Videos Relating to the Discovery'
            },
            {
                type    => 'vid',
                title   => "We Discovered a Moon",
                text    => "A non-technical overview of the discovery by The Wonky Astronomer"
                date    => 'August 12 2021',
                id      => 'w_Cc5Or1FFw',
            },
            {
                type    => 'vid',
                title   => "Zoom Presentation - Overview of Occultations and the Moon Discovery",
                text    => "Peter Nosworthy's Presentation to the Western Sydney Amateur Astronomy Group.
                            Includes an overview of occultations and how the discovery was made with this technique.",
                date    => 'August 18 2021',
                id      => '4IxL4VYD7GQ',
            },
            {
                type    => 'vid',
                title   => "Zoom Presentation - IOTA Annual Meeting",
                text    => "Peter Nosworthy's Presentation to the 2021 IOTA Annual Meeting",
                date    => 'July 17 2021',
                id      => 'wlqawqOZ7ek',
            },
            {
                type    => 'vid',
                title   => "Zoom Presentation - Constraining the Orbit",
                text    => "Richard Nolthenius's Presentation to the 2021 IOTA Annual Meeting",
                date    => 'July 17 2021',
                id      => '6vw5eTKOHgo'
            },
        ]

} %]




<style>

.vid_caption {
    font-size:16px;
    font-weight:bold;
}
.vid_date {
    font-size:12px;
    font-weight:bold;
}
.vid_text {
    font-size:12px;
    font-weight:normal;
    vertical-align:top;
    padding:4px;
}

div.vid_summary {
    display: inline;
    float: left;
    [% IF VID_LAYOUT == 'vertical' %]
        width: 200px;
    [% ELSE %]
        width: 400px;
    [% END %]
    Xheight: 200px;
    margin: 15px;
    padding: 5px;
    Xborder:solid 1px #666;
}

img.vid_thumb {
    border: none;
    width: 170px;
    height: 100px;
    cursor: pointer;
    cursor: hand;
}

iframe.vid_frame {
    display:none;
    Xfloat: left;
    border:solid 3px #900;
    width:1200px;
    height:686px;
}

.vid_close {
    display:none;
}

.vid_table {
    border:solid 1px #666;
    padding:5px;
}

.vid_anchor {
    text-decoration:none;
}

</style>


[% IF VID_DATA.vid_id %]

    <iframe class='vid_frame' id='frame_[% vid.id %]' style="display:block" width="800" height="457" src="https://www.youtube.com/embed/[% VID_DATA.vid_id %]?vq=hd720&rel=0" allowfullscreen></iframe>

    [% RETURN %]

[% END %]

[% IF VID_DATA.vid_list.size %]

    <a class='vid_close' id='vid_close' href="#" onclick="upsize_vid()">Close</a>

    [% FOR vid IN VID_DATA.vid_list %]

        [% IF vid.type == 'heading' %]

            <p style='clear:both' />

            <h2>[% vid.text %]</h2>
            <p />


        [% ELSE %]

            [% IF ! vid.thumb_id %]
                [% vid.thumb_id = vid.id %]
            [% END %]

                [% IF VID_LAYOUT == 'vertical' %]

                    <div class='vid_summary' id='summary_[% vid.id %]'>
                        <img class='vid_thumb' onclick="upsize_vid('[% vid.type %]', '[% vid.id %]')" src="https://img.youtube.com/vi/[% vid.thumb_id %]/mqdefault.jpg" />
                        <div class="vid_caption">[% vid.title %]</div>
                        [% IF vid.type == 'list' %]
                            Playlist
                        [% END %]
                        [% IF vid.chan %]
                            by <b>[% vid.chan %]</b>
                            [% END %]
                        <div class='vid_date'><i>[% vid.date %]</i></div>
                        <p />
                        <div class='vid_text'>[% vid.text %]</div>
                    </div>
                    <iframe class='vid_frame' id='frame_[% vid.id %]' src='' allowfullscreen></iframe>

                [% ELSE %]

                    <div class='vid_summary' id='summary_[% vid.id %]'>
                        <a href="#" class='vid_anchor' onclick="upsize_vid('[% vid.type %]', '[% vid.id %]')" >
                        <table class='vid_table'>
                        <tr><td colspan=2> <div class="vid_caption">[% vid.title %]</div></tr>
                        <tr>
                            <td>
                                <img class='vid_thumb' src="https://img.youtube.com/vi/[% vid.thumb_id %]/mqdefault.jpg" />
                                <div class='vid_date'><i>[% vid.date %]</i></div>
                            </td>

                            <td valign='top'>
                                <div class='vid_text'>[% vid.text %]</div>
                            </td>
                        </tr>
                        </table>
                        </a>
                    </div>
                    <iframe class='vid_frame' id='frame_[% vid.id %]' src='' allowfullscreen></iframe>

                [% END %]

        [% END %]

    [% END %]

[% ELSE %]

    No videos.

[% END %]







</div>

<br /> <p />
<br /> <p />
<br /> <p />
<br /> <p />
<br /> <p />



