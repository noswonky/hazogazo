package chessos::Model::Video;

use warnings;
use strict;

sub helpVideo {
    my($s, $c, $p) = @_;


    my $vid_data = {
        page_title  => "",
        vid_list    => [

            {
                type    => 'heading',
                text    => 'ChesSOS Tutorials'
            },


            {
                type    => 'vid',
                chan    => 'ChesSOS',
                title   => 'Drag and Drop Board',
                text    => 'Introduction to the new drag/drop board with integrated analysis mode.',
                date    => 'September 2015',
                id      => 'jB2kNUB8nbE',
            },

#            {
#                type    => 'vid',
#                chan    => 'ChesSOS',
#                title   => 'New Time Controls',
#                text    => "Introduction to cumulative and multi-move time controls.",
#                date    => 'September 2015',
#                id      => '7F6rQUytV8k',
#            },


        ],
    };

    if( $p->{vid_id} ) {
        $vid_data->{vid_id} = $p->{vid_id};
    }

    return($vid_data);
}


sub miscVideo {
    my($s, $c, $p) = @_;

    $c->log->debug("Model::miscVideo START");

    my $vid_data = {
        page_title  => "Chess Videos and Video Playlists",
        vid_list    => [

            {
                type    => 'heading',
                text    => 'Chess Rules and Principles'
            },

            {
                type    => 'vid',
                chan    => 'ChessNetwork',
                title   => 'Learn the Rules of Chess',
                text    => '',
                date    => 'September 2015',
                id      => 'SM2fcenx7KU',
            },
            {
                type    => 'vid',
                chan    => 'ChessNetwork',
                title   => 'Basic Opening Ideas',
                text    => '',
                date    => 'September 2015',
                id      => 'C_hJS29_IUk',
            },


            {
                type    => 'heading',
                text    => 'Games and Analysis'
            },

            {
                type    => 'list',
                title   => 'Famous Games',
                chan    => 'ChessNetwork',
                text    => "Analysis of some famous chess games",
                date    => '',
                id      => 'PL45300E324BE31AC4',
                thumb_id => 'q1ZNeYe7q-w',
            },
            {
                type    => 'list',
                title   => 'How to Solve Chess Puzzles',
                chan    => 'ChessNetwork',
                text    => '',
                date    => '',
                id      => 'PL542BA724CC5A1A3B',
                thumb_id => 'mAVSyYhdo7k',
            },

            {
                type    => 'heading',
                text    => 'Lectures from The Chess Club and Scholastic Center of St. Louis'
            },

            {
                type    => 'list',
                title   => 'Novice Level Lectures',
                chan    => 'St. Louis Chess Club',
                text    => '',
                date    => '',
                id      => 'PLVWaFpMwtaGgJy03_4RtTAmLSCAonR8ww',
                thumb_id => 'aLppVwVnna8',
            },

            {
                type    => 'list',
                title   => 'Beginner Level Lectures',
                chan    => 'St. Louis Chess Club',
                text    => '',
                date    => '',
                id      => 'PLVWaFpMwtaGj-HHi0t8bHxFzNtDwLoWon',
                thumb_id => '8u8_gJfpHjU',
            },

            {
                type    => 'list',
                title   => 'Intermediate Level Lectures',
                chan    => 'St. Louis Chess Club',
                text    => '',
                date    => '',
                id      => 'PLVWaFpMwtaGhJ9r9f0ikKI0rwGNtKMS-F',
                thumb_id => 'qfy86Wm1Waw',
            },

            {
                type    => 'list',
                title   => 'Advanced Level Lectures',
                chan    => 'St. Louis Chess Club',
                text    => '',
                date    => '',
                id      => 'PLVWaFpMwtaGhglkgWbA-LqlY65ljO_aWq',
                thumb_id => 'sIo7BXokiuo',
            },




        ],
    };

    if( $p->{vid_id} ) {
        $vid_data->{vid_id} = $p->{vid_id};
    }

    return($vid_data);
}

1;

