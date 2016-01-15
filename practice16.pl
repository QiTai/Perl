
## DBM文件
dbmopen(%hash,"dbmopen",0644) || die "Cannot open DBM dbmfile: $!";

$hash{feline}="cat";
$hash{canine}="dog";

print $hash{canine};

dbmclose(%hash);

##运行dbmoopen以前的哈希结构中的值均被丢失
%h=();
$h{dromedary}="camel";
dbmopen(%h,"database",0644) || die "Cannot open: $!";
print $h{dromedary};	#Likely will print nothing at all;
dbmclose(%h);

dbmopen(%h,"database",0644) || die "Cannot open: $!";
$h{bovine}="cow";
dbmclose(%h);
print $h{bovine}; 	#Likely will print nothing;


## 遍历与DBM文件相连接的哈希结构
## each函数用于很大的哈希结构

dbmopen(%recs,"records",0644) || die "Cannot open records: $!";
while( ($key,$value)=each %recs)
{
	print "$key = $value \n";
}
dbmclose(%recs);

##================================================================

#！/usr/bin/perl -w
use strict;

my(%answers,$subject,$info,$pattern);

dbmopen(%answers,"answers",0666) || die "Cannot open answer DBM:$!";

while(1)
{
	print "Your question ('quit' to quit): ";
	chomp($_=lc(<STDIN>));
	last if (/^quit$/);
	if(/like\s+(.*)\?/)
	{
		$pattern = $1;
		while( ($subject, $info)=each(%answers) )
		{
			if($subject=~/$pattern/)
			{
				print "$subject is like $pattern\n";				
			}
		}
	}
	elsif(/(.*)\?/)
	{
		$subject=$1;
		if($answers{$subject})
		{
			print "$subject is $answers{$subject}\n";
		}
		else
		{
			print qq{I don't know about "$subject"\n};
		}
	}
	elsif(/(.*)\sis\s(.*)/)
	{
		$subject=$1;
		$info=$2;
		$answers{$subject}=$info;
		print qq{OK, I'll remember "$subject" as "$info"\n};
	}
	else
	{
		print "I'm sorry, I don't understand.\n";
	}
}
dbmclose(%answers);

 
#!/usr/bin/perl -w 
use strict;

sub readdata{
	open(PH,"phone.txt") || die "Cannot open phone.txt: $!";
	my(@DATA)=<PH>;
	chomp @DATA;
	close(PH);
	return(@DATA);
}

sub writedata{
	my(@DATA)=@_;	#Accept new contents
	open(PH,">phone.txt") || die "Cannot open phone.txt:$!";
	foreach(@DATA)
	{
		print PH "$_\n";
	}
	close(PH);
}

@PHONELIST=readdata();
push(@PHONELIST,"April 555-1314");
writedata(@PHONELIST);

@PHONELIST=readdata();
@PHONELIST=grep(!/Ann/,@PHONELIST);
writedata(@PHONELIST);

#open existing file for reading and writing
open(F,"+<file.txt") || die "file.txt error: $!";
seek(F,0,2);
print F "On the end";
seek(F,0,0);
print F "This is at the beginning";

##锁定文件
chomp($newrecord=<STDIN>);	#Get a new record from the user
@PHONEL=readdata();			#Read data into @PHONEL
push(@PHONEL,$newrecord);	#Put the record into the array
writedata(@PHONEL);			#Write out the array

use Fcntl qw(:flock);

flock(FILEHANDLE,lock_type);


## 通用锁函数
use Fcntl qw(:flock);
# Any file name will do for semaphore.
my $semaphore_file="/tmp/sample.sem";

#Function to lock (waits indefinitely)
sub get_lock {
	open(SEM, ">$semaphore_file") || die "Cannot create semaphore: $!";
	flock(SEM,LOCK_EX) || die "Lock failed: $!";
}

#Function to unlock
sub release_lock {
	close(SEM);
}

#在加锁情况下文本文件的输入、输出
#! /usr/bin/perl -w
use strict;
use Fcntl qw(:flock);
my $semaphore_file="/tmp/list154.sem";

#Function to lock (waits indefinitely)
sub get_lock{
	open(SEM,">$semaphore_file") || die "Cannot create semaphore: $!";
	flock(SEM,LOCK_EX) || die "Lock failed: $!";
}

#Function to unlock
sub release_lock{
	close(SEM);
}

sub readdata {
	open(PH,"phone.txt") || die "Cannot open phone.txt $!";
	my(@DATA)=<PH>;
	chomp(@DATA);
	close(PH);
	return(@DATA);
}

sub writedata{
	my(@DATA)=@_;
	open(PH, ">phone.txt") || die "Cannot open phone.txt $!";
	foreach(@DATA)
	{
		print PH "$_\n";
	}
	close(PH); 			#Releases the lock,too
}

my @PHONEL;

get_lock();
@PHONEL=readdata();
push(@PHONEL,"Calvin 555-1012");
writedata(@PHONEL);
release_lock();
