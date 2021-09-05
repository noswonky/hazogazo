
var active_frame_id = '';

function upsize_vid(type, id) {

    if( active_frame_id ) {
        //document.getElementById('frame_' + active_frame_id).src = '';
        document.getElementById('frame_' + active_frame_id).style.display = 'none';
        document.getElementById('summary_' + active_frame_id).style.display = 'inline';
        active_frame_id = '';
        return;
    }

    var frame = document.getElementById('frame_' + id);
    var summary = document.getElementById('summary_' + id);
    summary.style.display = 'none';
    frame.style.display = 'inline';


/*
    if(type === 'vid') {
        frame.src = "https://www.youtube.com/embed/" + id + "?vq=hd720&rel=0";
    }
    else if( type === 'list' ) {
        frame.src="https://www.youtube.com/embed/videoseries?list=" + id;
    }
*/


    active_frame_id = id;
}

