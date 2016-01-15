sub foo
{
	my $var = shift;
	$$var = '1';
}
my $foo = '2';
my $var = \$foo;
print $$var;
foo ($var);
print $foo,"\n";


