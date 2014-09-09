package Code::Monger::Perl;
use Moose;

sub process {
	my ($self, $code) = @_;

	my @subs = $code =~ /sub\s+(\w+)/g;
	my %data = (
		subs => \@subs,
	);

	return \%data;
}


1;


