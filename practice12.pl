
###胶水语言！！
#DOS/Windows
system("dir /w");	#Print a file listing
#print system's documentation
# if(system("perldoc -f system"))
# {
# 	print "Your documentation isn't installed correctly!\n";
# }

# $file="practice1.pl";
# system("$file");

# system("notepad.exe practice1.pl");

# system("perldoc perlfaq5 > tmp.txt");

##笨的方法
system("dir > outfile");
open(OF,"outfile") || die "cannot open outfile:$!";
@data=<OF>;
close(OF);
print "================================================\n";
print "@data\n";

#反引号``
$directory=`dir`;
print "=================================================\n";
print $directory,"\n";

@dir=`dir`;
foreach(@dir)
{
	print $_,"___\n";
}

$complex=qx{sort `grep -l 'practice1' *`};
print $complex,"\n";

# open(RHANDLE,"dir /B | sort |") || die "Cannot open pipe for reading:$!";
# close(RHANDLE) || warn "pipe to more failed: $!";

sub freespace{

my(@dir,$free);
if($^O eq 'MSWin32')
{
	
	@dir=`dir`;
	$free=$dir[$#dir];
	$free=~s/.*([\d,]+) \w+ free/$1/;
	$free=~s/,//g;
	print "=================================================\n";
	print $free,"\n";

} elsif($^O eq 'linux')
{
	@dir=`df -k .`;
	$free=(split(/\s+/,$dir[$#dir]))[3];
	$free=$free*1024;

}else{
	warn "Cannot determine free space on this machine\n";
}
return $free;

}



##______________________________________________________________________
# #UNIX
# system("ls -lF");
# if(system("perldoc -f system"))
# {
# 	print "Your documentation isn't installed correctly!\n";
# }


# $file="practice1.pl";
# system("vi $file");

# system("xclock -update 1");

#Sort the file whose name is in $f and print it 
# system("sort $f | lp"); 	#Some systems use "lpr"
# #Run "xterm" and immediately return 
# system("xterm &");


# my(@dir,$free);
# @dir=`df -k .`;
# $free=(split(/\s+/,$dir[$#dir]))[3];
# $free=$free*1024;

