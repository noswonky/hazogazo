
var active_frame_id = '';

function upsize_vid(type, id) {

    if( active_frame_id ) {
        // document.getElementById('frame_' + active_frame_id).src = '';
        // document.getElementById('frame_large_' + active_frame_id).style.display = 'none';
        // document.getElementById('frame_medium_' + active_frame_id).style.display = 'none';
        // document.getElementById('frame_small_' + active_frame_id).style.display = 'none';
        active_frame_id = '';
    }

    // document.getElementById('frame_' + id).style.display = 'inline';
    // document.getElementById('frame_large_' + id).style.display = 'inline';
    // document.getElementById('frame_medium_' + id).style.display = 'inline';
    // document.getElementById('frame_small_' + id).style.display = 'inline';


    if(type === 'vid') {
        // frame.src = "https://www.youtube.com/embed/" + id + "?vq=hd720&rel=0";
        document.getElementById('vid_frame').src = "https://www.youtube.com/embed/" + id + "?vq=hd720&rel=0";
    }
    else if( type === 'list' ) {
        document.getElementById('vid_frame').src = "https://www.youtube.com/embed/videoseries?list=" + id;
    }


    // active_frame_id = id;
}

