#! /usr/bin/perl  -w 

print "Montly deposit amount?" ;
$pmt = <STDIN>;
chomp $pmt;

print "Annual Interest rate? (ex. 7% is .07)";
$interest = <STDIN>;
chomp $interest;

print "Number of months to deposit?" ;
$mons = <STDIN>;
chomp $mons;

#Formula requires a monthly interest
$interest /= 12;

$total = $pmt * ((1+$interest)**$mons-1)/$interest;

print "After $mons months, at $interest monthly you\n";
print "will have $total.\n";


#the use of "next",like "continue" in C;
for($i=0;$i<100;$i++)
{
	next if(not $i%2);
	print "An odd number=$i\n";
}

#the use of "last",like "break" in C;
$i = 0;
while($i<15)
{
	last if($i==5);
	$i++;
	print $i,"\n";
}

#symbol for a sentence;
OUTER: for($i=0;$i<100;$i++)
{
	for($j=0;$j<100;$j++)
	{
		if($i*$j==140)
		{
			print "The product of $i and $j is 140\n";
			last OUTER;
			#last;
		}
	}
}

# the use of "exit"
$user_response='quit';
if($user_response eq 'quit')
{
	print "Good Bye!\n";
	exit 0;  #Exit with a status of 0.
}

#like "switch case" in C
# if($variable_to_test==$value)
# {
# 	statement1;
# }elsif($variable_to_test==$value2)
# {
# 	statement2;
# }else
# {
# 	default_statement;
# }






