<style>
.vid_caption {
    font-size:12px;
}
</style>

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
                title   => "Discovery of Arecibo Moon - Peter Nosworthy's Presentation to the IOTA Annual Meeting",
                date    => 'July 17 2021',
                id      => 'wlqawqOZ7ek',
            },
            {
                type    => 'vid',
                title   => "Constraining the Orbit - Richard Nolthenius's Presentation to the IOTA Annual Meeting",
                date    => 'July 17 2021',
                id      => '6vw5eTKOHgo'
            },
        ]

} %]



<script>

var active_frame_id = '';

function upsize_vid(type, id) {

    if( active_frame_id ) {
        document.getElementById('frame_' + active_frame_id).src = '';
        document.getElementById('frame_' + active_frame_id).style.display = 'none';
        document.getElementById('summary_' + active_frame_id).style.display = 'inline';
    }

    var frame = document.getElementById('frame_' + id);
    var summary = document.getElementById('summary_' + id);
    summary.style.display = 'none';
    frame.style.display = 'inline';

    if(type === 'vid') {
        frame.src = "https://www.youtube.com/embed/" + id + "?vq=hd720&rel=0";
    }
    else if( type === 'list' ) {
        frame.src="https://www.youtube.com/embed/videoseries?list=" + id;
    }

    // frame.src = "https://www.youtube.com/embed/" + vid_id + "?vq=hd720&rel=0";
    // frame.src="http://img.youtube.com/vi/" + vid_id + "/hqdefault.jpg";

    active_frame_id = id;
}

</script>


<style>

div.vid_summary {
    display: inline;
    float: left;
    width: 200px;
    height: 200px;
    margin: 15px;
    border: none;
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
    float: left;
    border:solid 3px #900;
}

</style>


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

            <div class='vid_summary' id='summary_[% vid.id %]'>
                <img class='vid_thumb' onclick="upsize_vid('[% vid.type %]', '[% vid.id %]')" src="https://img.youtube.com/vi/[% vid.thumb_id %]/mqdefault.jpg" />
                <span class="vid_caption">[% vid.title %]</span>
                [% IF vid.type == 'list' %]
                    Playlist
                [% END %]
                [% IF vid.chan %]
                    by <b>[% vid.chan %]</b>
                [% END %]
                <br />
                <b>[% vid.date %]</b>
                <br />
                [% vid.text %]<br />
            </div>
            <iframe class='vid_frame' id='frame_[% vid.id %]' width="800" height="457" src='' allowfullscreen></iframe>

        [% END %]

    [% END %]

[% ELSE %]

    No videos.

[% END %]





</div>

<br />
<br />
<br />
<br />
<br />
<br />





