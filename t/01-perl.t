use strict;
use warnings;

use Test::More tests => 1;

use Code::Monger;
my $cm = Code::Monger->new;

$cm->process('t/corpus/eg/Abc.pm');

#diag explain $cm->data;
is_deeply $cm->data,
	[
	{
		'name'    => 'Abc',
		'methods' => [
			{
				'line' => 8,
				'name' => 'foo'
			},
			{
				'name' => 'bar',
				'line' => 11
			},
			{
				'line' => 16,
				'name' => '_quix'
			}
		],
		'line'    => 1,
		'modules' => [
			{
				'line' => 5,
				'name' => 'Bob'
			}
		],
		'pragmata' => [
			{
				'name' => 'strict',
				'line' => 2
			},
			{
				'line' => 3,
				'name' => 'warnings'
			}
		]
	}
	]

	#calls  => [

	#	# TODO: 'foo'
	#	'_quix',
	#],

