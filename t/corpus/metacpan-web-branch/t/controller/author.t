use strict;
use warnings;
use Test::More;
use MetaCPAN::Web::Test;

test_psgi app, sub {
    my $cb = shift;
    ok( my $res = $cb->( GET '/author/DOESNTEXIST' ),
        'GET /author/DOESNTEXIST' );
    is( $res->code, 404, 'code 404' );
    ok( $res = $cb->( GET '/author/perler' ), 'GET /author/perler' );
    is( $res->code, 301, 'code 301' );
    ok( $res = $cb->( GET '/author/PERLER' ), 'GET /author/PERLER' );
    is( $res->code, 200, 'code 200' );
    my $tx = tx($res);
    $tx->like( '/html/head/title', qr/PERLER/, 'title includes author name' );
    my $release = $tx->find_value('//table[1]//tbody/tr[1]/td[1]//a/@href');
    ok( $release, 'found a release' );

    ok( $res = $cb->( GET $release), "GET $release" );
    is( $res->code, 200, 'code 200' );
};

done_testing;
