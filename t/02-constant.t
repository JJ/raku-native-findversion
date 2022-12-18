use Test;

use NativeCall;
use Native::FindVersion;

constant $lib-name = "gcc_s";
constant $version = latest-version($lib-name);

cmp-ok( $version, ">=", v1, "Version of gcc_s is correct");

sub gcc-multiply( int32 $a, int32 $b)
        returns int32
        is native($lib-name, $version )
        is symbol("__mulvdi3")
{*};

is( gcc-multiply( 3, 3 ), 9, "Loads correctly a native routine");
done-testing;
