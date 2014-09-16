use strict;
use warnings;
use ExtUtils::MakeMaker;

my %conf = (
	NAME          => 'Code::Monger',
	VERSION_FROM  => 'lib/Code/Monger.pm',
	ABSTRACT_FROM => 'lib/Code/Monger.pm',
	PREREQ_PM     => {
		'Parse::Functions' => '0.01',
		'PPIx::EditorTools::Outline' => '0.18',
		'Moose'      => '2.1211',
		'Path::Tiny' => '0.056',
	},
);

if (eval { ExtUtils::MakeMaker->VERSION(6.3002) }) {
	$conf{LICENSE} = 'perl';
}

if (eval { ExtUtils::MakeMaker->VERSION(6.46) }) {
	$conf{META_MERGE} = {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => 'http://github.com/szabgab/code-monger.git',
				web  => 'http://github.com/szabgab/code-monger',
			}
		}
	};
}

my %configure_requires = (
        'ExtUtils::MakeMaker' => '6.64',
);
my %build_requires = ();
my %test_requires = (
		'Test::More'      => '1.00',
		#'Test::Exception' => '0.32',
		'Perl::Tidy'             => '20140711',  # Apparently Test::Code::TidyAll does not explicitly depend on it
		'Test::Code::TidyAll'    => 0.20,
		'Test::Perl::Critic'     => 0,

		# standard modules:
		#'File::Temp' => 0,
);

###   merging data "standard code"
if (eval { ExtUtils::MakeMaker->VERSION(6.52) }) {
	$conf{CONFIGURE_REQUIRES} = \%configure_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %configure_requires);
}

if (eval { ExtUtils::MakeMaker->VERSION(6.5503) }) {
	$conf{BUILD_REQUIRES} = \%build_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %build_requires);
}
if (eval { ExtUtils::MakeMaker->VERSION(6.64) }) {
	$conf{TEST_REQUIRES} = \%test_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %test_requires);
}
WriteMakefile(%conf);

