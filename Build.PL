#!/usr/bin/perl
use 5.012000; # CPAN Testers
use strict;
use warnings FATAL => 'all';
use Module::Build 0.37;

my $build = Module::Build->new(
    module_name        => 'Date::Holidays::CZ2',
    dist_author        => q{Smithfarm <presnypreklad@gmail.com>},
    dist_abstract      => 'determine Czech Republic bank holidays',
    dist_version_from  => 'lib/Date/Holidays/CZ.pm',
    license            => 'bsd',
    create_license     => 0,
    create_readme      => 1,
    configure_requires => {
        'Module::Build'      => 0.37,
        'Software::License'  => 0,
    },
    build_requires     => { 
        'Date::Calc'         => 5.0,
    },
    requires           => {
        'perl'               => 5.012,
        'Date::Calc'         => 5.0,
    },
    meta_merge => {
        resources => {
            homepage => 'https://metacpan.org/pod/Date::Holidays::CZ/',
            repository => 'https://github.com/smithfarm/date-holidays-cz.git',
        }
    },
    add_to_cleanup     => [ 'Date-Holidays-CZ2-*' ],
);

$build->create_build_script;
