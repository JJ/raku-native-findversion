use Test;

use NativeCall;
use Native::FindVersion;


throws-like {  latest-version("foo") },
        Exception,
        message => /"foo"/,
        "Throws if it does not find";

done-testing;
