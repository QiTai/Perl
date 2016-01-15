#!/usr/bin/perl

use strict;
my($dirs,$sizes,$total);

while(<STDIN>)
{
	chomp;
	$total++;
	if(-d $_)
	{
		$dirs++;
		print "$_\n";
		next;
	}
	$sizes+=(stat($_))[7];
	print "$_\n";
}
print "$total files,$dirs directories\n";
print "Average file size: ",$sizes/($total-$dirs),"\n";
