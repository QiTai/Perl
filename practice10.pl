$tmp=index "Ring around the rosy", "o"; 
print $tmp,"\n";

@a=qw(cats peas beans);
print index join(" ",@a),"peas","\n";

$reindeer="dasher prancer vixen";
index($reindeer,"da",1);   #Return 7
index($reindeer,"da");     #Return 0

$a="She loves you yeah,yeah,yeah.";
rindex($a,"yeah");         #Return 26
rindex($a,"yeah",25);      #Return 20

$a="I do not like green eggs and ham.";
print substr($a,25),"\n";	#prints "and ham"
print substr($a,14,5),"\n";	#prints "green"
print substr($a,5,-10),"\n";

$a="countrymen, lend me your wallets";
#Replace first character of $a with "Romans, C";
substr($a,0,1)="Romans,C";
print $a,"\n";

substr($a,0,0)="Friends, ";
print $a,"\n";

substr($a,-7,7)="ears."; 
print $a,"\n";

tr/ABC/XYZ/;
$a=~tr/a-zA-Z/A-Za-z/;	#Invert upper and lowercase
print $a,"\n";

$eyes=$a=~tr/i//;	#Count the i's in $a,return to $eyes.
$nums=$a=~tr/0-9//; #Count digits in $a,return to $nums.
print $eyes,"\t",$nums,"\t","\n";

@band=qw(trombone);
push @band,qw( ukulele clarinet);
print "@band","\n";

$brass=shift @band;
$wind=pop @band; 
print $brass,"\t",$wind,"\t","@band","\n";

unshift @band,"harmonica";
push @band,"hihi";
print "@band","\t";

@veg=qw(carrots corn);
splice(@veg,0,1),"\n";
print "@veg","\n";
splice(@veg,0,0,qw(peas)),"\n";
print "@veg\n";
splice(@veg,-1,1,qw(barley,turnip));
print "@veg\n";
splice(@veg,1,1);
print "@veg\n";

