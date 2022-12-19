use Test;

use NativeCall;
use Native::FindVersion;

constant @native-arg = latest-version-arg("gcc_s");

cmp-ok( @native-arg[1], ">=", v1, "Version of gcc_s is correct");

done-testing;
