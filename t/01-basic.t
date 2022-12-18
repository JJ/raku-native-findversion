use Test;

use Native::FindVersion;

my $version = latest-version("gcc_s"); # Seems to be here and in Alpine, so we're good

cmp-ok( $version, ">=", v1, "Version of gcc_s is correct");
done-testing;
