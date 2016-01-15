#! /usr/bin/perl -w
#-w : Perl will tell you when there is a warning;

$radius = 50;

$area = 3.14159*($radius ** 2);

print $area,"\n";

$a = "Hello,World!";

$b = "Nice to meet you";

$c = $a .$b;

print $c,"\n";

$name = "John";

print "I went to the store with $name";

print "I went to the store with \$name";

# x:means replicate multiple times
$line='_ 'x70;

print $line;

#change the capital letter to the little letter;
print lc("ME TOO\n");

print uc("hal9000\n");


$a = '999';
$a++;
print $a,"\n";

$a = 'c9';
$a++;
print $a,"\n";

$a = 'zzz';
$a++;
print $a,"\n";

print "What size is your shoe?";
$size = <STDIN>;
chomp $size;
print "Your shoe size is $size, or so you say. \n";


