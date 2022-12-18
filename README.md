# Native::FindVersion [![Test-install distro](https://github.com/JJ/raku-native-findversion/actions/workflows/test.yaml/badge.svg)](https://github.com/JJ/raku-native-findversion/actions/workflows/test.yaml)

Tries to find all available versions of the shared libraries used in `native
` modules.

## Installing

Just the usual `zef install Native::FindVersion`.

## Running

It exports a single function, `latest-version`. An example (from the test)

```raku
use Native::FindVersion;

constant $lib-name = "gcc_s";
my $version;
BEGIN {
    $version = latest-version($lib-name);
}

sub __addvdi3( int32 $a, int32 $b) returns int32 is native($lib-name, $version )
{*};

say __addvdi3( 3, 3 )
```

Since the version needs to be known at compile time, it needs to be assigned
 during the `BEGIN` phase. You can use either the short form (`foo`) or the
  long form (`libfoo`).
  
In this case we're using a shared library and function that can be found in
 most Linux systems, `libgcc`.

## See also

[`NativeLibs`](https://raku.land/github:salortiz/NativeLibs) includes
 `NativeLib::Searcher` that will help you find a library using the symbols
  found in it and a range of possible versions.

## Caveats

Untested in Windows and MacOS. If they don't append the version number to the
 extension, it will not work.

## License
 
(c) JJ Merelo, jj@raku.org 2022

This module will be licensed, by default, under the Artistic 2.0 License (the same as Raku itself). 
