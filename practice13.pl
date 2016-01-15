#!/usr/bin/perl -w
#This program contains TWO errors 

use strict ;

sub message{
	my($quant)=@_;
	my $mess;
	$mess="$quant glasses of Lemonade on the wall\n";
	if($quant eq 1)
	{
		$mess=~s/glasses/glass/;
	}
	print $mess;
}

foreach(0..20)
{
	message($_);
}

