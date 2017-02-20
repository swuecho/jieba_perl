 use ExtUtils::testlib;
 use Jieba;
 Jieba::hello();
 my $s = "南京市长江大桥";
 Jieba::CutDemo($s);
 $s = '小明硕士毕业于中国科学院计算所，后在日本京都大学深造';
 Jieba::CutDemo($s);

