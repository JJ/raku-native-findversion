use File::Find;

unit module Native::FindVersion;

constant @paths= </lib /usr/lib /usr/local/lib>;

sub latest-version( Str $lib-name ) returns Version is export {
    my @found-paths;
    my $real-lib-name = $lib-name ~~ /^^ "lib" / ?? $lib-name !! "lib$lib-name";
    for @paths -> $path {
        my @found-in-path = find( dir => $path, name => /^^ $real-lib-name /);
        @found-paths.append( @found-in-path ) if @found-in-path;
    }
    my @versions = @found-paths.map:
            Version.new(*.split( / "so." | "dynlib." | "dll." | "DLL." /).[1] );
    return @versions.max;
}
