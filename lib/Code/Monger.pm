package Code::Monger;
use Moose;

our $VERSION = '0.01';

use Path::Tiny qw(path);

=head1 NAME

Code::Monger - Doing something

=cut

sub process {
	my ($self, $filename) = @_;

	my $code = path($filename)->slurp_utf8;

	my $type = $self->get_type($filename, $code);
	my $module = 'Code::Monger::' + ucfirst $type;
	eval "use $module";
	die $@ if $@;

	$module->new->process($code);

	return;
}

sub get_type {
	my ($self, $filename, $code) = @_;

	return 'perl' if $filename =~ /\.pm$/;

	die "Could not recognize file-type for '$filename'\n";
}



1;

