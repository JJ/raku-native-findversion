use Test;

use NativeCall;
use Native::FindVersion;

constant $lib-name = "cmark";
my $version;
BEGIN {
    try {
        $version = latest-version($lib-name);
    }
}

cmp-ok( $version, ">=", v0.29, "Version of gcc_s is correct") if $version;

done-testing;
