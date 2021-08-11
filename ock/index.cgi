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
use Template::Plugin::Math;

my $subdir = 'live';
my $this_script = $0;


my $cwd = cwd;

my $q = CGI->new();
my %params = $q->Vars;


my $vars = { %params };

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


