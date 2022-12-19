use Test;

use NativeCall;
use Native::FindVersion;

constant @native-arg = latest-version-arg("gcc_s");

cmp-ok( @native-arg[1], ">=", v1, "Version of gcc_s is correct");

sub gcc-mod( int32 $a, int32 $b)
        returns int32
        is native(@native-arg )
        is symbol("__modti3")
{*};

is( gcc-mod( 3, 2 ), 3,
        "Loads correctly a native routine with arg");
done-testing;
