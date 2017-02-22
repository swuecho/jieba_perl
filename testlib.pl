use ExtUtils::testlib;
use DDP;
use Jieba;
Jieba::hello();
#my $r= Jieba::do_nothing();
#p $r;

my $s = "南京市长江大桥";
Jieba::CutDemo($s);
$s = '小明硕士毕业于中国科学院计算所，后在日本京都大学深造';
my @x= Jieba::CutDemo($s);
p $_ for @x;

