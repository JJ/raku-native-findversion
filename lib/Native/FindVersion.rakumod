unit module Native::FindVersion;

constant @paths= </usr/lib /usr/local/lib /usr/lib32 /usr/lib64 /usr/lib/x86_64-linux-gnu>;
sub latest-version( Str $lib-name ) returns Version is export {
    my @found-paths;
    my $real-lib-name = $lib-name ~~ /^^ "lib" / ?? $lib-name !! "lib$lib-name";
    for @paths -> $path {
        my $io-path = $path.IO;
        next unless $io-path.e;
        my @found-in-path = dir( $io-path,
                test => /
                ^^ $real-lib-name
                [".so" | ".dynlib" | ".dll" | ".DLL"]
                \.
                / );
        @found-paths.push( @found-in-path ) if @found-in-path;
    }
    die("Can't find $lib-name") unless @found-paths;
    my @version-s = @found-paths.map:
            *.split( / "so." | "dynlib." | "dll." | "DLL." /)[1];
    my Set $version-v;
    $version-v ∪= $_ for @version-s;
    return Version.new: $version-v.max.key;
}

sub latest-version-arg( Str $lib-name ) returns Positional is export {
    return [ $lib-name, latest-version( $lib-name )];
}
