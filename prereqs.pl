#!/m1/shared/bin/perl

# Utility to check for ShelfLister 2.0 prerequisites

use strict;

EvalModules('shelflister.cgi : required Perl module(s)',
 'File::Basename',
 'Encode',
 'DBI',
 'DBD::Oracle');

sub EvalModules {
    my ($message,@module_list) = @_;
    print qq($message\n);
    foreach my $module (@module_list) {
        eval("use $module");
        if ($@) {
            print qq( $module... MISSING\n);
        } else {
            print qq( $module... found\n);
        }
        sleep 1;
    }
}
