#file handle
open (MYTEXT,"d:/MyPerl/practice1.pl") || die;
close(MYTEXT);


# die "Cannot open\n";
# die "Cannot open";

open(MYFILE,"d:/MyPerl/practice1.pl") || die "Cannot open myfile: $!\n";
$line =<MYFILE>;
while(defined($a=<MYFILE>))
{
	print $a;
}

while(<MYFILE>)
{
	print $_;
}

open(MYFILE,"d:/MyPerl/practice1.pl") || die "$!";
@contents=<MYFILE>;
print $contents[3],"\n";
close(MYFILE);

#! /usr/bin/perl -w

open(MYFILE,"d:/MyPerl/practice1.pl") || die "opening testfile:$!";
@stuff=<MYFILE>;
close(MYFILE);
#Actually,any manipulation can be done now.
foreach(reverse(@stuff))
{
	print scalar(reverse($_));
}

#Overwrite existing data, if any
# open(NEWFH, ">output.txt") || die "Opening output.txt: $!";
#Simply append to whatever data may be there.
open(APPFH, ">>logfile.txt") || die "Opening logfile.txt: $!";
close(NEWFH);
close(APPFH);


open(LOGF,">>logfile.txt") || die "$!";
if(! print LOGF "This entry was written at ",scalar(localtime),"\n")
{
	warn "Unable to write to the log file:$!";
}
close (LOGF);


open(SOURCE,"practice1.pl") || die "$!";
open(DEST,">logfile.txt") || die "$!";
@contents = <SOURCE>;
print DEST @contents;
#print DEST <SOURCE>;
close (DEST);
close (SOURCE);

# open(FH,"camel.gif") || die "$!";
# binmode(FH);
# #start of a valid GIF file...
# print FH "GIF87a\056\001\045\015\000";
# close(FH);


print "Save date to what file?";
$filename=<STDIN>;
chomp $filename;
if(-s $filename)
{
	warn "$file contents will be Overwrite!\n";
	warn "$file was last updated ",
	-M $filename, "days ago.\n";
}








