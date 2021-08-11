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
use POSIX qw(strftime);
use Time::Local qw( timelocal timegm );

my $debug = 0;

my $subdir = 'live';
my $this_script = $0;


my $cwd = cwd;

my $q = CGI->new();
my %params = $q->Vars;


my $region_list = [
        'North America',
        'Europe',
        'Eastern Europe',
        'Australia/NZ',
        'Pacific',
        'South America',
        'Asia',
        'Africa',
        'Middle East',
    ];

my $event_list = [
#        {
#            time      => '2021-06-09 04:58',
#            OWC_id   => '159-4337-250638-646390-G24747',
#            countries  => [ 'Benin', 'Bolivia', 'Brazil', 'Chad', 'Ghana', 'Ivory Coast', 'Niger', 'Nigeria', 'Peru', 'Togo' ],
#            regions  => [ 'South America', 'Africa' ],
#        },

##        {
##            time      => '2021-06-09 11:03',
##            OWC_id   => '159-4337-250589-646390-U116848',
##            countries  => [ 'Japan', 'United States', ],
##            regions     => [ 'Asia', 'North America' ],
##        },

#        {
#            time      => '2021-06-09 11:34',
#            OWC_id   => '159-4337-250583-646390-G10648',
#            countries  => [ 'Argentina', 'Chile', ],
#            regions  => [ 'South America', ],
#        },
#        {
#            time      => '2021-06-09 14:24',
#            OWC_id    => '159-4337-250561-646390-G05055',
#            countries => [ 'China','India','Myanmar','Philippines', ],
#            regions   => [ 'Asia', ],
#        },
#
#        {
#            time      => '2021-06-09 17:57',
#            OWC_id    => '159-4337-250532-646390-G57654',
#            countries => [ 'Australia','Botswana','Namibia','South Africa','Swaziland', ],
#            regions   => [ 'Africa', 'Australia/NZ'],
#        },
#
#        {
#            time      => '2021-06-10 02:29',
#            OWC_id    => '160-4337-250462-646390-U116617',
#            countries => [ 'Argentina','Chile','Lesotho','Madagascar','South Africa', ],
#            regions   => [ 'South America', 'Africa' ],
#        },
#        {
#            time      => '2021-06-10 03:00',
#            OWC_id    => '160-4337-250458-646390-U116596',
#            countries => [ 'Bolivia','Brazil','Democratic Republic of the Congo','Ethiopia','Peru','Republic of the Congo','Somalia','South Sudan' ],
#            regions   => [ 'South America', 'Africa' ],
#        },
#
#        {
#            time      => '2021-06-10 06:19',
#            OWC_id    => '160-4337-250431-646390-U116522',
#            countries => [ 'Cuba','Mexico' ],
#            regions   => [ 'North America', ],
#        },
#
#        {
#            time      => '2021-06-10 13:51',
#            OWC_id    => '160-4337-250369-646390-U116391',
#            countries => [ 'Australia', ],
#            regions   => [ 'Australia/NZ', ],
#        },
#        {
#            time      => '2021-06-10 22:31',
#            OWC_id    => '160-4337-250297-646390-G57808',
#            countries => [ 'Argentina','Australia','Chile', ],
#            regions   => [ 'Australia/NZ', 'South America'],
#        },
#
#        {
#            time      => '2021-06-11 00:45',
#            OWC_id    => '161-4337-250279-646390-G53114',
#            countries => [ 'Cameroon','Central African Republic','Chad','Eritrea','Ethiopia','Ghana','Ivory Coast','Liberia','Nigeria','Oman','Pakistan','Saudi Arabia','South Sudan','Sudan','The Bahamas','United States of America','Yemen', ],
#            regions   => [ 'Africa','Middle East', ],
#        },
#
#        {
#            time      => '2021-06-11 08:45',
#            OWC_id    => '161-4337-250213-646389-U116102',
#            countries => [ 'Canada','United States of America', ],
#            regions   => [ 'North America', ],
#        },
#
#
#        {
#            time      => '2021-06-11 17:48',
#            OWC_id    => '161-4337-250138-646389-U116006',
#            countries => [ 'China','India','Iran','Iraq','Laos','Myanmar','Pakistan','Syria','Taiwan','Thailand','Turkey','Vietnam', ],
#            regions   => [ 'Asia', 'Middle East' ],
#        },
#
#        {
#            time      => '2021-06-11 18:10',
#            OWC_id    => '161-4337-250135-646389-U116003',
#            countries => [ 'New Zealand', ],
#            regions   => [ 'Australia/NZ', ],
#        },
#
#        {
#            time      => '2021-06-12 02:45',
#            OWC_id    => '162-4337-250064-646389-G58323',
#            countries => [ 'Argentina','Botswana','Chile','Madagascar','Mozambique','Namibia','South Africa','Zimbabwe', ],
#            regions   => [ 'South America','Africa', ],
#        },
#
#
#        {
#            time      => '2021-06-12 11:04',
#            OWC_id    => '162-4337-249994-646389-G40724',
#            countries => [ 'Argentina','Chile', ],
#            regions   => [ 'South America', ],
#        },
#
#        {
#            time      => '2021-06-12 19:39',
#            OWC_id    => '162-4337-249923-646389-G22529',
#            countries => [ 'Australia','Vanuatu', ],
#            regions   => [ 'Australia/NZ', 'Pacific'],
#        },
#
#
#        {
#            time      => '2021-06-13 01:15',
#            OWC_id    => '163-4337-249877-646389-U115844',
#            countries => [ 'AngolaBrazil','Burundi','Colombia','Democratic Republic of the Congo','Kenya','Somalia','United Republic of Tanzania', ],
#            regions   => [ 'South America', 'Africa' ],
#        },
#
#
#        {
#            time      => '2021-06-15 03:22',
#            OWC_id    => '165-4337-249459-646389-G24244',
#            countries => [ 'Benin','Brazil','Chad','Colombia','Egypt','Ghana','Ivory Coast','Liberia','Niger','Nigeria','Sudan','Togo', ],
#            regions   => [ 'South America', 'Africa' ],
#        },
#        {
#            time      => '2021-06-15 10:23',
#            OWC_id    => '165-4337-249400-646389-G09342',
#            countries => [ 'Australia','Bolivia','Brazil','Chile','New Zealand', ],
#            regions   => [ 'Australia/NZ', 'South America' ],
#        },
#
#        {
#            time      => '2021-06-16 04:37',
#            OWC_id    => '166-4337-249248-646389-G30648',
#            countries => [ 'Cuba','Mexico','Portugal','Spain','United States of America', ],
#            regions   => [ 'North America', 'Europe', ],
#        },
#
#        {
#            time      => '2021-06-24 07:42',
#            OWC_id    => '174-4337-247647-646390-G42942',
#            countries => [ 'Canada','United States of America', ],
#            regions   => [ 'North America', ],
#        },
#
#        {
#            time      => '2021-06-24 19:33',
#            OWC_id    => '174-4337-247553-646390-G18930',
#            countries => [ 'Angola','Botswana','Indonesia','Madagascar','Mozambique','Namibia','Papua New Guinea','Zimbabwe', ],
#            regions   => [ 'Africa','Asia' ],
#        },
#
#        {
#            time      => '2021-06-25 18:47',
#            OWC_id    => '175-4337-247370-646390-U115127',
#            countries => [ 'Australia','Botswana','Namibia','Solomon Islands','South Africa','Swaziland', ],
#            regions   => [ 'Australia/NZ','Africa','Pacific' ],
#        },
#        {
#            time      => '2021-06-25 22:05',
#            OWC_id    => '175-4337-247344-646390-G25613',
#            countries => [ 'Afghanistan','Algeria','China','Egypt','Iran','Kazakhstan','Kuwait','Kyrgyzstan','Libya','Morocco','Saudi Arabia','Tajikistan', ],
#            regions   => [ 'Middle East','Africa', 'Asia'],
#        },
#        {
#            time      => '2021-06-26 11:18',
#            OWC_id    => '176-4337-247241-646391-U116527',
#            countries => [ 'Argentina','Chile','Falkland Islands', ],
#            regions   => [ 'South America', ],
#        },
#        {
#            time      => '2021-06-26 12:29',
#            OWC_id    => '176-4337-247231-646390-G57000',
#            countries => [ 'Cambodia','India','Myanmar','Philippines','Thailand','Vietnam', ],
#            regions   => [ 'Asia', 'South East Asia','Pacific'],
#        },
#        {
#            time      => '2021-06-26 14:27',
#            OWC_id    => '176-4337-247216-646390-U116465',
#            countries => [ 'India','Indonesia','Oman','Papua New Guinea','Saudi Arabia','Sri Lanka', ],
#            regions   => [ 'Middle East','South East Asia', ],
#        },
######################################################

##        {
##            time     => '2021-06-30 05:55',
##            OWC_id   => '180-4337-246553-646392-U113857',
##            countries  => [ 'Bermuda', 'Canada', 'Mexico', 'The Bahamas', 'United States', ],
##            regions  => [ 'North America' ],
##        },

        {
            time      => '2021-08-21 09:32',
            OWC_id    => '232-4337-243869-646413-U102353',
            countries => [ 'New Zealand', ],
            regions   => [ 'Australia/NZ', ],
        },
        {
            time      => '2021-09-04 00:48',
            OWC_id    => '246-4337-245540-646411-U105504',
            countries => [ 'Bermuda','Mexico','United States of America', ],
            regions   => [ 'North America', ],
        },
        {
            time      => '2021-09-04 07:34',
            OWC_id    => '246-4337-245584-646411-U105652',
            countries => [ 'Australia', 'New Zealand', ],
            regions   => [ 'Australia/NZ', ],
        },
        {
            time      => '2021-09-14 00:38',
            OWC_id    => '256-4337-247294-646409-U111672',
            countries => [ 'Argentina','Brazil','Chile','Paraguay', ],
            regions   => [ 'South America', ],
        },

        { last => 1 },


        {
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
        my @time_fmt = gmtime($event_time_sec);
        $event->{date_fmt} = strftime("%B %e, %Y", @time_fmt);

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

