use 5.018000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $libs =  ['-ljieba -lstdc++ -lm']; # e.g., '-lm' #TODO: include libjieba.so from a custom di;
my $incs =  '-I. -I./deps/include -I/usr/include'; # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
WriteMakefile(
    NAME              => 'Jieba',
    VERSION_FROM      => 'lib/Jieba.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/Jieba.pm', # retrieve abstract from module
    AUTHOR            => 'Hao Wu <echowuhao@gmail.com>',
    LICENSE           => 'perl',
    #Value must be from legacy list of licenses here
    #http://search.cpan.org/perldoc?Module%3A%3ABuild%3A%3AAPI
    LIBS              => $libs,
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => $incs,
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);

#  gcc -o demo demo.c -L.   -ljieba -lstdc++ -lm
#
