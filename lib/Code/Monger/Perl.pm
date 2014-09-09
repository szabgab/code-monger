package Code::Monger::Perl;
use Moose;

sub process {
	my ($self, $code) = @_;

	my @subs = $code =~ /sub\s+(\w+)/g;
	my @loaded = $code =~ /use\s+([\w:]+)/g;
	my @modules = grep { $_ ne lc $_ } @loaded;
	my @pragmatas = grep { $_ eq lc $_ } @loaded;
	my %data = (
		subs => \@subs,
		#modules => \@modules,
		pragmatas => \@pragmatas,
	);

	return \%data;
}


1;


