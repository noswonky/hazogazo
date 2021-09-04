
var active_frame_id = '';

function upsize_vid(type, id) {

    if( active_frame_id ) {
        document.getElementById('frame_' + active_frame_id).src = '';
        document.getElementById('frame_' + active_frame_id).style.display = 'none';
        document.getElementById('summary_' + active_frame_id).style.display = 'inline';
        document.getElementById('vid_close').style.display = 'none';
        active_frame_id = '';
        return;
    }

    var frame = document.getElementById('frame_' + id);
    var summary = document.getElementById('summary_' + id);
    var vid_close = document.getElementById('vid_close');
    summary.style.display = 'none';
    frame.style.display = 'inline';
    vid_close.style.display = 'inline';

    // close.style.display = 'inline';


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

