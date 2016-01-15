opendir(TEMPDIR,'D:/MyPerl') || die "Cannot open D:/MyPerl:$!\n";
@FILES=readdir TEMPDIR;
@FILES=grep(!/^\.\.?$/,readdir TEPDIR);
print "@FILES","\n";
closedir TEMPDIR;

# opendir(TD,"D:/MyPerl") || die "Cannot open D:/MyPerl: $!";
# while($file=readdir TD)
# {
# 	open(FILE,"D:/MyPerl/$file") || die "Cannot open $file:$@!"
# }
# closedir(FILE);


my @hfiles=glob('/usr/include/*.h');
my @curfiles=glob('*1999*.{txt,doc}');
$count=1;
while($name=glob('*'))
{
	print "$count.$name\n";
	$count++;
}

@cfiles=<*.c>; #All files ending in .c

#-----------------------------------------------------------------
# #!/usr/bin/perl -w
# use strict;

# print "Directory to search: ";
# my $dir=<STDIN>;
# chomp $dir;
# print "Pattern to look for: ";
# my $pat=<STDIN>;
# chomp $pat;

# my($file);

# opendir(DH,$dir) || die "Cannot open $dir: $!";
# while($file=readdir DH)
# {
# 	next if(-d "$dir/$file");
# 	if(! open(F,"$dir/$file"))
# 	{
# 		warn "Cannot search $file:$!";
# 		next;
# 	}

# 	while(<F>)
# 	{
# 		if(/$pat/)
# 		{
# 			print "$file:$_";
# 		}
# 	}
# 	close(F);
# }
# closedir(DH);

#==================================================================
use Cwd;
print "Your current directory is: ",cwd,"\n";
chdir 'D:/MyPerl' or warn "Directory D: not accessible: $!";
print "You are now in: ",cwd,"\n";


print "Directory to create?";
my $newdir=<STDIN>;
chomp $newdir;
mkdir ($newdir, 0755) || die "Failed to create $newdir:$!";

print "Directory to be removed?";
my $baddir=<STDIN>;
chomp $baddir;
rmdir ($baddir) || die "Failed to remove $baddir:$!";

#unlink用于删除文件！
# unlink <*.bat>;
# $erased=unlink 'old.exe','a.out','personal.txt';
# unlink @badfiles;

@stuff=stat "D:/MyPerl/practice11.pl";
print "@stuff\n";

($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,
	$mtime,$ctime,$blksize,$blocks)=stat("D:/MyPerl/practice11.pl");

print scalar localtime($mtime);

print "\nThe file has ",(stat("D:/MyPerl/practice11.pl"))[7]," bytes of data";

#--------------------------------------------------------------------------------
#!/usr/bin/perl -w

use strict;

my($dir,$oldpat,$newpat);
print "Directory: ";
chomp($dir=<STDIN>);
print "Old pattern: ";
chomp($oldpat=<STDIN>);
print "New pattern: ";
chomp($newpat=<STDIN>);

opendir(DH,$dir) || die "Cannot open $dir: $!";
my @files= readdir DH;
close(DH);
my $oldname;
foreach(@files)
{
	$oldname=$_;
	s/$oldpat/$newpat/;
	next if(-e "$dir/$_");
	if(!rename "$dir/$oldname","$dir/$_")
	{
		warn "Could not rename $oldname to $_: $!"
	}
	else
	{
		print "File $oldname renamed to $_\n";
	}
}






