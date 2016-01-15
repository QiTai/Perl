# while(<>)
# {
# 	print $_;
# }


#引用
$a=1000;
$ref=\$a;
print $ref,"\n";

print $$ref;
$$ref="Sticks";
print $a,"\n";

$ref="Break";
print $ref,"\n";

$name="Gandalf";
$nref=\$name;
$oref=$nref;

$book='Lord of the Rings';
$bref=\$book;
$bref2=\$bref;


#对数组的引用
$aref=\@arr;
# $$aref[0]:@arr第一个元素            与${$aref}[0]等价
# @$aref[2,3]:@arr的一个子数组        与@{$aref}[2,3]等价
# @$aref :@arr的整个数组			  与@{$aref}等价


$href=\%hash;
# $$href{key}:访问%hash中的一个关键字，也可以是${$href}{key}
# %$href :访问整个哈希结构，也可以是%{$href}

# foreach $key (keys %$href)
# {
# 	print $$href($key);		# same as $hash($key)
# }

# 当创建了对哈希结构的或数组的引用后，就不需要原始哈希结构或数组，只要对哈希结构或数组引用存在，即使原始数据不再存在，Perl
# 仍然保留着哈希结构和数组的各个元素

my $href;
{
	my %hash=(phone=>'Bell',light=>'Edison');
	$href=\%hash;
}
print $$href{light};


# 匿名存储
$ahref={phone=>'Bell',light=>'Edison'};
$aaref=[qw(Crosby Stills Nash Young)];

#引用形成的新结构
$a = [ qw (rock pop classical) ];
$b = [ qw (mystery action drama) ];
$c = [ qw (biography novel periodical) ];

%media=(music=>$a, film=>$b, 'print'=>$c);

#数组引用的数组=》二维数组
@list_of_lists=(
	[qw(Mustang Bronco Ranger)],
	[qw(Cavalier Suburban Buick)],
	[qw(LeBaron Ram)],);

# 访问二维数组格式：$list_of_lists[0][1];

# 访问二维数组行数的序号最大数： $#list_of_lists;
# 访问二维数组行数的总行数： scalar{@list_of_lists};

foreach my $outer (@list_of_lists)
{
	foreach my $inner (@{$outer})
	{
		print "$inner";	
	}
	print "\n";
}

push(@list_of_lists, [qw (Mercedes EMW Lexus)] ); # A new row
push(@{$list_of_lists[0]},qw(Taurus) );			  # A new element to one list

#！ /usr/bin/perl -w
use strict;

my @maze=(
	[qw (e swe we ws)],
	[qw (ne new sw ns)],
	[qw (ns - ns wn)],
	[qw (ne w ne w)],
);

my %direction=('n'=> [-1,0], 's'=> [1,0],
  	'e'=> [0,1],'w'=> [0,-1]);

my %full=('e'=>'East','n'=>'North','w'=>'West','s'=>'South');

my ($curr_x,$curr_y,$x,$y)=(0,0,3,3);
my $move;

sub disp_location
{
	my($cx,$cy)=@_;
	print "You may move ";
	while($maze[$cx][$cy]=~/([news])/g)   #g？
	{
		print "$full{$1}";
	}
	print "($maze[$cx][$cy])\n";
}

sub move_to
{
	my($new,$xref,$yref)=@_;
	$new=substr(lc($new),0,1);
	if($maze[$$xref][$$yref]!~/$new/)    #!~?
	{
		print "Invalid direction,$new.\n";
		return;
	}
	$$xref += $direction{$new}[0];
	$$yref += $direction{$new}[1];
}

until ($curr_x==$x and $curr_y==$y)
{
	disp_location($curr_x,$curr_y);
	print "Which way?";
	$move=<STDIN>; chomp $move;
	exit if($move=~/^q/);
	move_to($move,\$curr_x,\$curr_y);
}




