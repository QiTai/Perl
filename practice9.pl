sub Yesno
{
	print "Are you sure (Y/N)?";
	#$answer=<STDIN>;
}
&Yesno();
Yesno();

sub shift_to_uppercase
{
	@words=qw(cia fbi un nato unicef);
	foreach(@words)
	{
		$_=uc($_);
	}
	return(@words);
}
@acronyms=shift_to_uppercase();
print "@acronyms\n";

##传递子例程参数
# subname(arg1,arg2,arg3);
# subname arg1,arg2,arg3;
# &subname(arg1,arg2,arg3);

##pay attention to @_
sub printargs{
	print join(',',@_),"\n";
}
printargs('market','home','roast beef');

sub print_third_argument
{
	print $_[2],"\n";
}
print_third_argument('hi','hello','how');

sub display_box_score
{
	($hits,$at_bats)=@_;
	print "For $at_bats trips to the plate, ";
	print "he's hitting ",$hits/$at_bats, "\n";
}
display_box_score(50,210);

@items=("hello","hi","are","how","you");
@items=(30,21,23,45);
sub sort_numerically
{
	print "Sorting...";
	return(sort{$a<=>$b} @_);
}
@sorted_items=sort_numerically(@items);
print "@sorted_items\n";


sub lots_of_args
{
	($first,$second,$third,%hash)=@_;
	#rest of subroutine...
}
lots_of_args($foo,$bar,$baz,%myhash);

##纯函数
#One fairly good way to write this function
sub moonweight
{
	($weight)=@_;
	return ($weight/6);
}
print moonweight(150);

#A poor way to write thsi function
sub moonweight
{
	return($weight/6);
}
$weight=150;
print moonweight;

#A better way to write this function
#function private variable
sub moonweight
{
	my $weight;
	($weight)=@_;
	return ($weight/1.66667);
}

sub player_stats
{
	my($at_bats,$hits,$walks)=@_;
	#Rest of function...
}

#! /usr/bin/perl -w

use strict;
sub mean
#命令use strict意味着所有变量必须用my来声明，裸单词必须用引号括起来；
{
	my(@data)=@_;
	my $sum;
	foreach (@data)
	{
		$sum+=$_;
	}
	return($sum/@data);
}

sub median
{
	my(@data)=sort{$a<=>$b} @_;
	if(scalar(@data)%2)
	{
		return($data[@data/2]);
	}
	else
	{
		my($upper,$lower);
		$lower=$data[@data/2];
		$upper=$data[@data/2-1];
		return(mean($lower,$upper));
	}
}

sub std_dev
{
	my(@data)=@_;
	my($sq_dev_sum,$avg)=(0,0);

	$avg=mean(@data);
	foreach my $elem (@data)
	{
		$sq_dev_sum+=($avg-$elem)**2;
	}
	return(sqrt($sq_dev_sum/@data-1));
}

my($data,@dataset);
print "Please enter data,separated by commas: ";
$data=<STDIN>;
chomp $data;
@dataset=split(/[\s,]+/,$data);

print "Median:",median(@dataset),"\n";
print "Mean:",mean(@dataset),"\n";
print "Standard Dev.:",std_dev(@dataset),"\n";

sub myfunc
{
	local($foo)=56;
	#rest of function..
}