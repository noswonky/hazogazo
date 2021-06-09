#!/usr/bin/perl

use warnings;
use strict;

use lib '/home/chesscat/lib/perl5';
use lib '/home/chesscat/perl5/lib/perl5';


use Cwd;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use Data::Dumper;
use Template;
use Time::Local qw( timelocal timegm );

my $debug = 0;

my $subdir = 'live';
my $this_script = $0;


my $cwd = cwd;

my $q = CGI->new();
my %params = $q->Vars;


my $region_list = [
        'North America',
        'Australia/NZ',
        'Pacific',
        'South America',
        'Asia',
        'Africa',
        'Middle East',
    ];

my $event_list = [
        {
            date_fmt => 'June 9, 2021',
            time      => '2021-06-09 04:58',
            OWC_id   => '159-4337-250638-646390-G24747',
            countries  => [ 'Benin', 'Bolivia', 'Brazil', 'Chad', 'Ghana', 'Ivory Coast', 'Niger', 'Nigeria', 'Peru', 'Togo' ],
            regions  => [ 'South America', 'Africa' ],
        },
        {
            date_fmt => 'June 9, 2021',
            time      => '2021-06-09 11:03',
            OWC_id   => '159-4337-250589-646390-U116848',
            countries  => [ 'Japan', 'United States', ],
            regions     => [ 'Asia', 'North America' ],
        },
        {
            date_fmt => 'June 9, 2021',
            time      => '2021-06-09 11:34',
            OWC_id   => '159-4337-250583-646390-G10648',
            countries  => [ 'Argentina', 'Chile', ],
            regions  => [ 'South America', ],
        },
        {
            date_fmt  => 'June 9, 2021',
            time      => '2021-06-09 14:24',
            OWC_id    => '159-4337-250561-646390-G05055',
            countries => [ 'China','India','Myanmar','Philippines', ],
            regions   => [ 'Asia', ],
        },

        {
            date_fmt  => 'June 9, 2021',
            time      => '2021-06-09 17:57',
            OWC_id    => '159-4337-250532-646390-G57654',
            countries => [ 'Australia','Botswana','Namibia','South Africa','Swaziland', ],
            regions   => [ 'Africa', 'Australia/NZ'],
        },

        {
            date_fmt  => 'June 10, 2021',
            time      => '2021-06-10 02:29',
            OWC_id    => '160-4337-250462-646390-U116617',
            countries => [ 'Argentina','Chile','Lesotho','Madagascar','South Africa', ],
            regions   => [ 'South America', 'Africa' ],
        },
        {
            date_fmt  => 'June 10, 2021',
            time      => '2021-06-10 03:00',
            OWC_id    => '160-4337-250458-646390-U116596',
            countries => [ 'Bolivia','Brazil','Democratic Republic of the Congo','Ethiopia','Peru','Republic of the Congo','Somalia','South Sudan' ],
            regions   => [ 'South America', 'Africa' ],
        },

        {
            date_fmt  => 'June 10, 2021',
            time      => '2021-06-10 06:19',
            OWC_id    => '160-4337-250431-646390-U116522',
            countries => [ 'Cuba','Mexico' ],
            regions   => [ 'North America', ],
        },

        {
            date_fmt  => 'June 10, 2021',
            time      => '2021-06-10 13:51',
            OWC_id    => '160-4337-250369-646390-U116391',
            countries => [ 'Australia', ],
            regions   => [ 'Australia/NZ', ],
        },
        {
            date_fmt  => 'June 10, 2021',
            time      => '2021-06-10 22:31',
            OWC_id    => '160-4337-250297-646390-G57808',
            countries => [ 'Argentina','Australia','Chile', ],
            regions   => [ 'Australia/NZ', 'South America'],
        },

        {
            date_fmt  => 'June 11, 2021',
            time      => '2021-06-10 00:45',
            OWC_id    => '161-4337-250279-646390-G53114',
            countries => [ 'Cameroon','Central African Republic','Chad','Eritrea','Ethiopia','Ghana','Ivory Coast','Liberia','Nigeria','Oman','Pakistan','Saudi Arabia','South Sudan','Sudan','The Bahamas','United States of America','Yemen', ],
            regions   => [ 'Africa','Middle East', ],
        },

        {
            date_fmt  => 'June 11, 2021',
            time      => '2021-06-11 08:45',
            OWC_id    => '161-4337-250213-646389-U116102',
            countries => [ 'Canada','United States of America', ],
            regions   => [ 'North America', ],
        },


        {
            date_fmt  => 'June 11, 2021',
            time      => '2021-06-11 17:48',
            OWC_id    => '161-4337-250138-646389-U116006',
            countries => [ 'China','India','Iran','Iraq','Laos','Myanmar','Pakistan','Syria','Taiwan','Thailand','Turkey','Vietnam', ],
            regions   => [ 'Asia', 'Middle East' ],
        },

        {
            date_fmt  => 'June 11, 2021',
            time      => '2021-06-11 18:10',
            OWC_id    => '161-4337-250135-646389-U116003',
            countries => [ 'New Zealand', ],
            regions   => [ 'Australia/NZ', ],
        },

        {
            date_fmt  => 'June 12, 2021',
            time      => '2021-06-12 02:45',
            OWC_id    => '162-4337-250064-646389-G58323',
            countries => [ 'Argentina','Botswana','Chile','Madagascar','Mozambique','Namibia','South Africa','Zimbabwe', ],
            regions   => [ 'South America','Africa', ],
        },


        {
            date_fmt  => 'June 12, 2021',
            time      => '2021-06-12 11:04',
            OWC_id    => '162-4337-249994-646389-G40724',
            countries => [ 'Argentina','Chile', ],
            regions   => [ 'South America', ],
        },

        {
            date_fmt  => 'June 12, 2021',
            time      => '2021-06-12 19:39',
            OWC_id    => '162-4337-249923-646389-G22529',
            countries => [ 'Australia','Vanuatu', ],
            regions   => [ 'Australia/NZ', 'Pacific'],
        },


        {
            date_fmt  => 'June 13, 2021',
            time      => '2021-06-13 01:15',
            OWC_id    => '163-4337-249877-646389-U115844',
            countries => [ 'AngolaBrazil','Burundi','Colombia','Democratic Republic of the Congo','Kenya','Somalia','United Republic of Tanzania', ],
            regions   => [ 'South America', 'Africa' ],
        },


        {
            date_fmt  => 'June 15, 2021',
            time      => '2021-06-15 03:22',
            OWC_id    => '165-4337-249459-646389-G24244',
            countries => [ 'Benin','Brazil','Chad','Colombia','Egypt','Ghana','Ivory Coast','Liberia','Niger','Nigeria','Sudan','Togo', ],
            regions   => [ 'South America', 'Africa' ],
        },
        {
            date_fmt  => 'June 15, 2021',
            time      => '2021-06-15 12:23',
            OWC_id    => '165-4337-249400-646389-G09342',
            countries => [ 'Australia','Bolivia','Brazil','Chile','New Zealand', ],
            regions   => [ 'Australia/NZ', 'South America' ],
        },

#####################################################
        {
            date_fmt => 'June 30, 2021',
            time     => '2021-06-30 05:55',
            OWC_id   => '180-4337-246553-646392-U113857',
            countries  => [ 'Bermuda', 'Canada', 'Mexico', 'The Bahamas', 'United States', ],
            regions  => [ 'North America' ],
        },

        { last => 1 },


        {
            date_fmt  => '',
            time      => '',
            OWC_id    => '',
            countries => [ '', ],
            regions   => [ '', ],
        },
];


my $vars = { %params };

$debug && do { $vars->{pg} = 'campaigns' };
$debug && do { $vars->{region} = '' };

my $now_sec = time;
$debug && do { print "GMT: ", scalar(gmtime($now_sec)), "\n" };

if($vars->{pg} eq 'campaigns' ) {
    $vars->{data} = { region_list => $region_list, event_list => $event_list };

    $debug && print "Campaigns\n";

    foreach my $event (@{$vars->{data}->{event_list}} ) {

        last if($event->{last});

        my($YYYY,$MM,$DD,$hh,$mm) = split(/[\s:\-]/, $event->{time});
        $MM--;
        my $event_time_sec = timegm(0,$mm,$hh,$DD,$MM,$YYYY);
        my $time_fmt = scalar(gmtime($event_time_sec));
        $event->{time_fmt} = $time_fmt;

        if($event_time_sec < $now_sec) {
            $event->{past} = 1;
            $debug && print "PAST EVENT\n";
        }
        else {
            my $time_remaining = $event_time_sec - $now_sec;
            $event->{time_remaining} = hms($time_remaining);
        }


        if($vars->{region}) {
            
            my $is_in_region = '';

            foreach my $event_region ( @{$event->{regions}} ) {
                if($vars->{region} eq $event_region) {
                    $is_in_region = 1;
                }
            }
            if($is_in_region ) {
                $event->{in_region} = 1;
            }
                
        }
    }
}

$debug && exit;


if($this_script =~ /index/) {
    $vars->{this_script} = '';
    $subdir = 'live';
    $vars->{subdir} = 'live';
}
else {
    $vars->{this_script} = $this_script;
    $subdir = 'stage';
    $vars->{subdir} = 'stage';
}
my $tpl = Template->new( { RELATIVE => 1, INCLUDE_PATH => "./$subdir" } );

#print Dumper($vars);
#exit;

print $q->header('text/html');


$tpl->process("./${subdir}/tpl/main.tpl", $vars) || die "Template process failed: ", $tpl->error(), "\n";


sub hms {
    my ($sec) = @_;
    
    $sec = abs($sec);
    my $d = int($sec / 86400);
    $sec -= ($d * 86400);
    my $h = int($sec / 3600);
    $sec -= ($h * 3600);
    my $m = int($sec / 60);
    $sec -= ($m * 60);

    my $hms;
    if($d) {
        $hms = sprintf("%dd %02dh", $d, $h);
    }
    elsif($h) {
        $hms = sprintf("%dh %02dm", $h, $m,);
    }
    elsif($m) {
        $hms = sprintf("%dm", $m);
    }
    else {
        $hms = sprintf("%ds", $sec);
    }
    $hms =~ s/^0(\d)/$1/;
    return($hms);
}

