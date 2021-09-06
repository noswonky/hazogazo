
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
        height:200px;
        width: 370px;
    [% END %]
    Xheight: 200px;
    margin: 10px;
    padding: 5px;
    border:solid 1px #666;
    overflow: hidden;
}

img.vid_thumb {
    border: none;
    width: 170px;
    height: 100px;
    cursor: pointer;
    cursor: hand;
}

Xiframe.vid_frame {
    display:none;
    Xposition:relative;
    Xtop:10px;
    Xleft:10px;
    float:left;
    border:solid 2px #900;
}

iframe.vid_frame_large {
    width:900px;
    height:515px;
}
iframe.vid_frame_medium {
    width:600px;
    height:343px;
}
iframe.vid_frame_small {
    width:380px;
    height:218px;
}


.videoWrapper {
  position: relative;
  top:0px;
  left:0px;
  Xfloat:left;
  width:65%;
  height: 0;
  padding-bottom: 36.56%; /* 16:9 - Must be the width percentage x 0.5625 */
}
.videoWrapper iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.Xvid_table {
    border:none;
    padding:5px;
}

.vid_anchor {
    text-decoration:none;
}

</style>


<div class="w3-container">



[% IF VID_DATA.vid_id %]

    <iframe class='vid_frame' id='frame_[% vid.id %]' src="" allowfullscreen></iframe>

    [% RETURN %]

[% END %]

[% FOR vid IN VID_DATA.vid_list %]
                    [%#
                        I use three differently sized iframes for responsiveness.
                        I would rather use a percentage width and tried some code which does that.
                        It involved putting a wrapper div around the iframe. This worked but had problems
                        when trying to make it visible via javascript. It would become visible but at
                        a tiny size.
                    %]

                    <!--
                    <iframe class='vid_frame vid_frame_large w3-hide-medium w3-hide-small' id='frame_large_[% vid.id %]' src="https://www.youtube.com/embed/[% vid.id %]?vq=hd720&rel=0" allowfullscreen></iframe>
                    <iframe class='vid_frame vid_frame_medium w3-hide-large w3-hide-small' id='frame_medium_[% vid.id %]' src="https://www.youtube.com/embed/[% vid.id %]?vq=hd720&rel=0" allowfullscreen></iframe>
                    <iframe class='vid_frame vid_frame_small w3-hide-large w3-hide-medium' id='frame_small_[% vid.id %]' src="https://www.youtube.com/embed/[% vid.id %]?vq=hd720&rel=0" allowfullscreen></iframe>
                    -->
[% END %]

[% DEFAULT first_vid_id = '' %]

[% IF VID_DATA.vid_list.size %]

    [% IF ! first_vid_id %]
        [% first_vid_id = VID_DATA.vid_list.0.id %]
    [% END %]

    <div class='videoWrapper'>
    <iframe class='vid_frame' id='vid_frame' src="https://www.youtube.com/embed/[% first_vid_id %]?vq=hd720&rel=0" allowfullscreen></iframe>
    </div>

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
                        <a href="#heading" class='vid_anchor' onclick="upsize_vid('[% vid.type %]', '[% vid.id %]')" >
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


                [% END %]

        [% END %]

    [% END %]

[% ELSE %]

    No videos.

[% END %]


</div>
