use Test;

use NativeCall;
use Native::FindVersion;

constant $lib-name = "gcc_s";
my $version;
BEGIN {
    $version = latest-version($lib-name);
    # Seems to be here and in Alpine, so we're good
}

cmp-ok( $version, ">=", v1, "Version of gcc_s is correct");

sub __addvdi3( int32 $a, int32 $b)
        returns int32 is native($lib-name, $version ) {*};

is( __addvdi3( 3, 3 ), 6, "Loads correctly a native routine");
done-testing;
