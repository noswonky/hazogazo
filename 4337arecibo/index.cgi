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

my $subdir = 'live';
my $this_script = $0;


my $cwd = cwd;

my $q = CGI->new();
my %params = $q->Vars;


my $region_list = [
        'North America',
        'South America',
        'East Asia',
        'Africa',
    ];

my $event_list = [
        {
            date_fmt => 'June 9, 2021',
            OWC_id   => '159-4337-250638-646390-G24747',
            countries  => [ 'Benin', 'Bolivia', 'Brazil', 'Chad', 'Ghana', 'Ivory Coast', 'Niger', 'Nigeria', 'Peru', 'Togo' ],
            regions  => [ 'South America', 'Africa' ],
        },
        {
            date_fmt => 'June 9, 2021',
            OWC_id   => '159-4337-250589-646390-U116848',
            countries  => [ 'Canada', 'Japan', 'Mexico', 'Russia', 'United States', ],
            regions     => [ 'East Asia', 'North America' ],
        },
        {
            date_fmt => 'June 30, 2021',
            OWC_id   => '180-4337-246553-646392-U113857',
            countries  => [ 'Bermuda', 'Canada', 'Mexico', 'The Bahamas', 'United States', ],
            regions  => [ 'North America' ],
        },
        {
            date_fmt => '',
            OWC_id   => '',
            regions  => [ '', ],
        },
];


my $vars = { %params };

if($vars->{pg} eq 'campaigns' ) {
    $vars->{data} = { region_list => $region_list, event_list => $event_list };

    if($vars->{region}) {
        foreach my $event (@{$vars->{data}->{event_list}} ) {
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


