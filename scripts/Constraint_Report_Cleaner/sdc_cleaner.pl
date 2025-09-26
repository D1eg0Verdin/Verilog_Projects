#!/usr/bin/env perl
use strict;
use warnings;

my $file = shift || "constraints.sdc";

open (my $fh,"<", $file) or die "Cannot open $file: $!";
while(<$fh>){
    if(/create_clock\s+-name\s+(\w+)\s+-period\s+([\d.]+)/){
    	print("Clock: $1 period = $2 ns \n");
    }
    if(/Path Slack:\s+(-[\d.]+)/){
    	print("VIOLATION Slack = $1\n");
    }
}
close $fh;

