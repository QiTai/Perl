##查找一个文件时所用的程序
#! /usr/bin/perl -w 
use strict;

use File::Find;

sub wanted {
	if($_ eq "lecture4_4.py")
	{
		print $File::Find::name;
		#print $File::Find::dir;
		#print $_;
	}
}

find \&wanted, 'D:\MyPython';

##================================================================

##删除临时文件所用的程序
##但是好像不能运行成功！

#！ /usr/bin/perl -w
use strict;
use File::Find;

sub delete_tmp {
	#Check to see if the filename is not a diretory
	if(-f $File::Find::name)
	{
		#Verify the filename eds in .tmp
		if($File::Find::name=~/\.tmp$/i)
		{
			print "Removing $File::Find::name";
			unlink $File::Find::name;
		}
	}
}
find \&delete_tmp, 'D:\MyPython';


##==============================================================

use File::Copy;
copy("sourcefile","destination") || warn "Could not copy files: $!";


use File::Copy;
if( not move("important.doc","d:/archives/documents/important.doc"))
{
	warn "tmp.txt could not be moved: $!";
	unlink "d:/archives/documents/important.doc";
}


# use File::Ping;
# if(pingecho("www.yahoo.com",15))
# {
# 	print "Yahoo is on the network";
# }
# else
# {
# 	print "Yahoo is unreachable.";
# }

use English;
while(<>)
{
	print $ARG;
}

use diagnostics ; #能帮助理解出错信息的含义;



