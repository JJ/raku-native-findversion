use Test;

use NativeCall;
use Native::FindVersion;

constant $gcc_s = "gcc_s";
constant @native-arg = latest-version-arg($gcc_s);

is(  @native-arg[0], $gcc_s, "First argument is correct" );
cmp-ok( @native-arg[1], ">=", v1, "Version of gcc_s is correct");

done-testing;
