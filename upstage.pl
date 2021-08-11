#!/usr/bin/env perl

use warnings;
use strict;

use Data::Dumper;
use Getopt::Long;
use Cwd 'cwd';

# Defaults are for upload to staging area...
my $subdir = 'stage';
my $cgi_script = 'stage.cgi';

my $here = cwd();
my $this = $0;

print "here:$here, this:$this\n";

my @splitpath = split(/\//, $here);

#print Dumper(\@splitpath);

my $thisdir = $splitpath[-1];

print "thisdir = $thisdir\n";

my $server_dir = 'hazelbrookobservatory.com';
if($thisdir ne 'hazogazo') {
    $server_dir = "hazelbrookobservatory.com/$thisdir";
}

print "server_dir = $server_dir\n";


my $opt_live = '';
my $opt_dryrun = '';
my $opt_save = '';
GetOptions(
    "live"     => \$opt_live,
    "dryrun"    => \$opt_dryrun,
    "save"      => \$opt_save,
);

# The --live option causes it to upload to the live area...
$subdir = 'live' if $opt_live;
$cgi_script = 'index.cgi' if $opt_live;

if($opt_save) {

    save_rollback();

    exit;
}

my %stamps;

my $ood = 1;    # Out of date by default forces an upload on startup
my $initial_sleeptime = 5;
my $sleeptime = $initial_sleeptime;
my $prev_int_sleeptime = 0;

my $start_time = time;
my @files;

# The dirs to check for changes
my $file_list = 'css img js tpl tg doc';

for(my $i=0;;$i++) {

    # When checking for changes, check index.cgi and the dirs in the file_list
    chomp(@files = `find index.cgi $file_list -type f -print 2>/dev/null`);
    
    foreach my $file (@files) {
        next if($file =~ /DS_Store/); # Skip MacOS stuff

        my $age = -M $file;

        if($i and ($age != $stamps{$file})) {
            # File timestamp has changed since the last iteration
            $ood = 1;
            print "#### Modified: $file\n";
            if($file =~ /^tg\//) {
                print "##### Generic template changed #####\n";
                system("touch 4337arecibo/index.cgi");
            }
        }
        $stamps{$file} = $age;
    }


    if($ood) {

        # Something is out of date, so do an upload.


        if($opt_live) {

            # Upload to live area so make sure first...

            local $| = 1;
            print "\n\n";
            print '#' x 50, "\n";
            print "##### Do you really want to release to the live site?\n";
            print '#' x 50, "\n";
            print "Continue <y/n> ? ";
            chomp(my $reply = <STDIN>);
            if($reply !~ 'y') {
                # Exit because we don't want to loop if the user bails out
                print "Exiting\n";
                exit;
            }
            else {
                # Really do it, but give the user a little more time to abort
                print "##### Ok, this is for real...\n";
                print "Here we go...\n";
            }
        }

        print "\n\nUploading...\n";
        my $cmd1 = "rsync -v -r index.cgi chesscat\@hazelbrookobservatory.com:${server_dir}/$cgi_script";
        my $cmd2 = "rsync -v -r --delete --copy-dirlinks $file_list chesscat\@hazelbrookobservatory.com:${server_dir}/${subdir}/";

        print "Cmd: $cmd1\n";
        print "Cmd: $cmd2\n";

        if($opt_dryrun) {
            print "##### DRY RUN #####\n";
        }
        else {
            sleep(10) if($opt_live);
            system($cmd1);
            system($cmd2);
            print ">" x 150, "\n";
        }


        if($subdir eq 'live') {
            print "Exiting\n";
            exit;
        }

        $ood = 0;                           # Now not out of date
        $sleeptime = $initial_sleeptime;    # Reset the sleep time to the shortest value
    }
    else {
        local $| = 1;
        print ".";
    }

    my $int_sleeptime = int($sleeptime);


    if($int_sleeptime != $prev_int_sleeptime) {
        my $elapsed_time = time - $start_time;
        print "\nElapsed: $elapsed_time, Sleep: $int_sleeptime\n";
    }
    sleep($int_sleeptime);


    $prev_int_sleeptime = $int_sleeptime;

    if($sleeptime < 20) {
        $sleeptime *= 1.05;
    }
}


sub save_rollback {


}


sub pause {
    local $| = 1;
    print "Continue...";
    <STDIN>;
    print "\n";
}
