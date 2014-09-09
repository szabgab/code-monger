use strict;
use warnings;

use Test::More tests => 1;

use Code::Monger;
my $cm = Code::Monger->new;

$cm->process('t/corpus/eg/Abc.pm');
#diag explain $cm->data;
is_deeply $cm->data, {
   'subs' => [
     'foo',
     'bar',
     '_quix'
   ]
};


