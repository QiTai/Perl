#This file is used to find keywords in all the files in a stdin directory!
#This script is very useful!!

#!/usr/bin/perl -w
use strict;

print "Directory to search: ";
my $dir=<STDIN>;
chomp $dir;
print "Pattern to look for: ";
my $pat=<STDIN>;
chomp $pat;

my($file);

opendir(DH,$dir) || die "Cannot open $dir: $!";
while($file=readdir DH)
{
	next if(-d "$dir/$file");
	if(! open(F,"$dir/$file"))
	{
		warn "Cannot search $file:$!";
		next;
	}

	while(<F>)
	{
		if(/$pat/)
		{
			print "$file:$_";
		}
	}
	close(F);
}
closedir(DH);