package Code::Monger::Perl;
use Moose;

sub process {
	my ( $self, $code ) = @_;

	my @subs      = $code =~ m{sub\s+(\w+)}g;
	my @loaded    = $code =~ m{use\s+([\w:]+)}g;
	my @modules   = grep { $_ ne lc $_ } @loaded;
	my @pragmatas = grep { $_ eq lc $_ } @loaded;

	my @calls = $code =~ m{(\w+)\s*\(}g;

	my %data = (
		subs      => \@subs,
		modules   => \@modules,
		pragmatas => \@pragmatas,
		calls     => \@calls,
	);

	return \%data;
}

1;

