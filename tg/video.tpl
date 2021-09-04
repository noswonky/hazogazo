
[% DEFAULT VID_DATA = {
    vid_list    => [ ],
    vid_id      => '',
    layout      => 'horizontal',


} %]


<style>

.vid_title {
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
    [% IF VID_DATA.layout == 'vertical' %]
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
    font-size:18px;
    font-weight:bold;
}

.vid_table {
    border:solid 1px #666;
    padding:5px;
}

.vid_anchor {
    text-decoration:none;
}

</style>


<div class="w3-container">

[% IF VID_DATA.vid_id %]

    <iframe class='vid_frame' id='frame_[% vid.id %]' style="display:block" width="800" height="457" src="https://www.youtube.com/embed/[% VID_DATA.vid_id %]?vq=hd720&rel=0" allowfullscreen></iframe>

    [% RETURN %]

[% END %]

[% IF VID_DATA.vid_list.size %]


    [% FOR vid IN VID_DATA.vid_list %]

        [% IF vid.type == 'heading' %]

            <p style='clear:both' />

            <h2>[% vid.text %]</h2>
            <p />


        [% ELSE %]

            [% IF ! vid.thumb_id %]
                [% vid.thumb_id = vid.id %]
            [% END %]

                [% IF VID_DATA.layout == 'vertical' %]

                    <div class='vid_summary' id='summary_[% vid.id %]'>
                        <img class='vid_thumb' onclick="upsize_vid('[% vid.type %]', '[% vid.id %]')" src="https://img.youtube.com/vi/[% vid.thumb_id %]/mqdefault.jpg" />
                        <div class="vid_title">[% vid.title %]</div>
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
                        <tr><td colspan=2> <div class="vid_title">[% vid.title %]</div></tr>
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
