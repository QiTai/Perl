#list
(5, 'apple',$x,3.141592);

print qw(apples oranges 45.6 $x);

print (1..10);

print (a..z);

#array
@boy=qw(Greg Peter Bobby);
@copy=@original;
@clean=();

print "@boy","\n";

@girls=qw(Marcia Jan Cindy);
@kids=(@girls,@boys);
@family=(@kids,('Mike','Carol'),'Alice');

print "@kids","\n";

print $kids[1];

($a,$b,$c)=qw(appples oranges bananas);

@trees = qw(oak cedar maple apple cherry pine peach fir);
print $#trees; #got a problem??????


$fix=(_) x 70;
print "\n",$fix,"\n";

@foo = qw(water pepsi coke lemonade);
$a = @foo;
$b = $#foo;  ###  $#：返回数组的最后一个索引;
print "$a\n";
print "$b\n";

print scalar(@foo);

@stars = ('*') x 100;
print $stars[99];

# $a=<STDIN>;
# print $a;

#stop when type Ctrl+Z twice;
# @whole=<STDIN>;
# print "@whole";
# print $whole[1];

# ($a)=<STDIN>;
# print ($a);

@pets=('cat','dog','fish','canary','iguana');
$last_pet=('cat','dog','fish','canary','iguana');
print $last_pet,"\n";

print scalar(localtime);

@flavors=qw(chocolate vanilla strawberry mint sherbert);
for($index=0;$index<@flavors;$index++)
{
	print "My favorite flavor is $flavors[$index] and..."
}
print "many others.\n";

foreach $cone (@flavors)
{
	print "I'd like a cone of $cone\n";
}

@words=split(/ /,"The quick brown fox");
print "@words\n";

# while(<STDIN>)
# {
# 	($firstchar)=split(/ /,$_);
# 	print "The first character was $firstchar\n";
# }

###the use of split ,join
###good example!
@Music=('White Album,Beatles','Graceland, Paul Simon','A Boy Named Sue, Goo Goo Dolls');
foreach $record (@Music)
{
	($record_name, $artist)=split(/,/,$record);
}
print $record_name,"\n";
print $artist,"\n";

$message = "Elvis was here";
print "The string \"$message\" consist of :", join('-',split(//,$message)),"\n";

@Chiefs=qw(Cliton Bush Reagan Carter Ford Nixon);
print join(' ',sort @Chiefs);

#different from what you thought would be
@numbers=(100, 11, 12, 10);
print join(' ',sort @numbers),"\n";

@sorted =sort {
	return(1) if($a>$b);
	return(0) if($a==$b);
	return(-1) if($a<$b);
}@numbers;

print "@sorted\n";

@sorted = sort{$a<=>$b;} @numbers;
print "@sorted\n";

###the use of the function "reverse"
$reversed=reverse("Perl");
print $reversed,"\n";

@lines=qw(I do not like green eggs and ham);
print join(' ', reverse @lines),"\n";
print join(' ', reverse sort @lines),"\n";


###hangman game
#! /usr/bin/perl -w

@words = qw(internet answers printer program);
@guesses =();
$wrong = 0;

$choice=$words[rand @words];
$hangman="0-|--<";

@letters = split(//, $choice);
@hangman = split(//, $hangman);
@blankword=(0)x scalar (@hangman);
OUTER:
	while ($wrong<@hangman)
	{
		foreach $i (0..$#letters)
		{
			if ($blankword[$i])
			{
				print $blankword[$i];
			}
			else
			{
				print "-";
			}
		}
		print "\n";
		if($wrong)
		{
			print @hangman[0..$wrong-1]
		}
		print "\n Your Guess: ";
		$guess=<STDIN>;
		chomp $guess;
		foreach(@guesses)
		{
			next OUTER if($_ eq $guess);
		}

		$right=0;
		for($i=0;$i<@letters;$i++)
		{
			if($letters[$i] eq $guess)
			{
				$blankword[$i]=$guess;
				$right=1;
			}
		}

		$wrong++ unless(not $right);
		if(join('',@blankword) eq $choice)
		{
			print "You got it right!\n";
			exit;
		}
	}
print "$hangman\nSorry,the word was $choice.\n";



