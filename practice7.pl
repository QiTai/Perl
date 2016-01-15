###正则表达式RE/regexp
$pat=<STDIN>;
chomp $pat;
$_="The phrase that pays";
if(/$pat/)
{
	print "\"$_\" contains the pattern $pat \n";
}

if(/dogs|cats/){
	print "\$_ contains a pet\n";
}

#regexp: the following three are equivalent
# if(/frog|bog|log|flog|clog/)
# if(/(fr|b|fl|cl)og/)
# if(/(fr|b|(f|c)l)og)/)

##excellent example
$_="apple is red";
($fruit,$color)=/(.*)\sis\s(.*)/;
print $fruit,"\n";
print $color,"\n";

$_="Our house is in the middle of our street".
s/middle/end/;
print ;
s/in/at/;
print ;
if(s/apartment/condo/)
{
	print "return value is true\n";
}

###an example about weight change from earth to moon

#! /usr/bin/perl -w

print "Your weight:";
$_=<STDIN>;
chomp;
s/^\s+//;    #Remove leading spaces, if any;

#### i表示不考虑大小写字母
if(m/(lbs?|kgs?|kilograms?|pounds?)/i)
{
	if(s/\s*(kgs?|kilograms?).*//)
	{
		$_*=2.2;
	}
	else
	{
		s/\s*(lbs?|pounds?).*//;
	}
}
print "Your weight on the moon: ", $_*.16667, " lbs\n";

###连接运算符=~
$weight="185 lbs";
$weight=~s/ lbs//;     #Do substitution against $weight
print $weight,"\n";

$poem="One fish, two fish, red fish";
$n=$poem=~m/fish/;             #$n is true, if $poem has fish?
print $n,"\n";



$_="One fish, two frog, red fred, blue foul";
@F=m/\W(f\w\w\w)/g;
print "@F\n";

$letters=0;
$phrase="What's my line?";
while($phrase=~/\w/g)
{
	$letters++;
}
print $letters,"\n";
{

if(/(\d{3})-(\d{3})-(\d{4})/)
{
	print "The area code is $1";
}

@dogs=qw(greyhound bloodhound terrier mutt chihuahua);
@hounds=grep /hound/, @dogs;
print "@hounds\n";

@longdogs=grep length($_)>8, @dogs;
print "@longdogs\n";

@hounds=grep s/hound/hounds/, @dogs;
print "@hounds\n";
print "@dogs\n";

###got problems??
@input=qw(dogcat hop litole);
@words=map(split'o',$_),@input;
print "@words\n";








