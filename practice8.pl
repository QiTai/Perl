$Authors{'Dure'}='Frank Herbert';

$food{'apple'}='fruit';
$food{'pear'}='fruit';
$food{'carrot'}='vegetable';

%food=('apple','fruit','pear','fruit','carrot','vegetable');

%food=('apple'=>'fruit','pear'=>'fruit','carrot'=>'vegetable',);
print $food{'carrot'},"\n";
print $food{carrot},"\n";

%food1=(apple=>'fruit',pear=>'fruit',carrot=>'vegetable');
print $food1{pear},"\n";

print "_____________________________________________________________\n";

%Movies=('The Shining'=>'Kubrick','Ten Commandments'=>'DeMile','Goonies'=>'Spielberg');
foreach $film (keys %Movies)
{
	print "$film\n";
}

foreach $film (keys %Movies)
{
	print "$film was directed by $Movies{$film}.\n";
}

@Directors=values %Movies;
@Films=keys %Movies;

@Data=%Movies;
%Movies=@Data;

%Both={%First,%Second};
%Additional={%Both,key1=>'value1',key2=>'value2'};

if(exists $Movies{'The Shining'})
{
	print "test finish!\n";
}

delete $Movies{'The Shining'};

###%Movies=();

print %Movies,"\n";

# while(<>)
# {
# 	while(/(\w[\w-]*)/g)
# 	{
# 		$Words{$1}++;
# 	}
# }

foreach (keys %Words)
{
	print "$_ $Words{$_}\n";
}

@fishwords=('one','fish','two','fish','red','fish','blue','fish');
%seen=();
foreach(@fishwords)
{
	$seen{$_}=1;
}
@uniquewords=keys %seen;
print "@uniquewords","\n";


@stars=('R.Reagan','C.Eastwood','M.Jackson','Cher','S.Bono');
@pols=('N.Gingrich','S.Thrumon','R.Reagan','S.Bono','C.Eastwood','M.Thatcher');
%seen=();
foreach (@stars)
{
	$seen{$_}=1;
}
@intersection=grep($seen{$_},@pols);
print "@intersection\n";

%seen=();
foreach (@stars)
{
	$seen{$_}=1;
}
@difference=grep(!$seen{$_},@pols);
print "@difference\n";

print "_____________________________________________________________\n";
foreach(sort keys %stars)
{
	print "$_ $stars{$_}\n";
}

foreach(sort {$Words{$a}<=>$Words{$b}} keys %words)
{
	print "$_ $Words{$_}\n";
}


#################################################3333
#! /usr/bin/perl -w

print "_____________________________________________________________\n";

open(PH,"customers.txt") or die "Cannot open customers.txt:$!\n";
while(<PH>)
{
	chomp;
	($number,$email)=(split(/\s+/,$_))[1,2];
	$Phone{$number}=$_;      ###相当于把number对应的整条信息存入Hash中;
	print ;
	print "\n";
	$Email{$email}=$_;
	print ;
	print "\n";
	print "_____________________________________________________________\n";

}
close(PH);

print "Type 'q' to exit\n";
while(1)
{
	print "\nNumber?";
	$number=<STDIN>;
	chomp($number);
	$address="";
	if(!$number)
	{
		print "E-Mail?";
		$address=<STDIN>;
		chomp($address);
	}

	next if(! $number and ! $address);
	last if($number eq 'q' or $address eq 'q');

	if($number and exists $Phone{$number})
	{
		print "customers:$Phone{$number}\n";
		next;
	}

	if($address and exists $Email{$address})
	{
		print "Customers:$Email{$address}\n";
		next;
	}

	print "Customer record not found.\n";
	next;
}

print "\nAll done.\n";

