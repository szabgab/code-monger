package Code::Monger::Perl;
use Moose;

use PPIx::EditorTools::Outline;

sub process {
	my ( $self, $code ) = @_;

	my $ppi = PPIx::EditorTools::Outline->new;
	return $ppi->find( code => $code );

	#my @subs      = $code =~ m{sub\s+(\w+)}g;
	#my @loaded    = $code =~ m{use\s+([\w:]+)}g;
	#my @modules   = grep { $_ ne lc $_ } @loaded;
	#my @pragmatas = grep { $_ eq lc $_ } @loaded;

	#my @calls = $code =~ m{(\w+)\s*\(}g;

	#my %data = (
	#	subs      => \@subs,
	#	modules   => \@modules,
	#	pragmatas => \@pragmatas,
	#	calls     => \@calls,
	#);

	#return \%data;
}

1;

