#!/usr/bin/perl -w
use strict;
use warnings;
use Date::Holidays::CZ qw(holidays);

# Sample script for Date::Holidays::CZ

# Original script for Date::Holidays::DE by Martin Schmitt <mas at scsy dot de>
# modified by Nathan Cutler <ncutler@suse.com>

# Assign full names to the internal aliases from Date::Holidays::DE
# See the manpage for a list of all aliases.
my %svatky_full_names = (
		'neuj' => 'Neujahrstag',
		'hl3k' => 'Hl. 3 Koenige',
		'romo' => 'Rosenmontag',
		'fadi' => 'Faschingsdienstag',
		'asmi' => 'Aschermittwoch',
		'grdo' => 'Gruendonnerstag',
		'karf' => 'Karfreitag',
		'kars' => 'Karsamstag',
		'osts' => 'Ostersonntag',
		'ostm' => 'Ostermontag',
		'pfis' => 'Pfingstsonntag',
		'pfim' => 'Pfingstmontag',
		'himm' => 'Himmelfahrtstag',
		'fron' => 'Fronleichnam',
		'1mai' => 'Maifeiertag',
		'17ju' => 'Tag der deutschen Einheit (1954-1990)',
		'mari' => 'Mariae Himmelfahrt',
		'frie' => 'Augsburger Friedensfest (regional)',
		'3okt' => 'Tag der deutschen Einheit',
		'refo' => 'Reformationstag',
		'alhe' => 'Allerheiligen',
		'buss' => 'Buss- und Bettag',
		'votr' => 'Volkstrauertag',
		'toso' => 'Totensonntag',
		'adv1' => '1. Advent',
		'adv2' => '2. Advent',
		'adv3' => '3. Advent',
		'adv4' => '4. Advent',
		'heil' => 'Heiligabend',
		'wei1' => '1. Weihnachtstag',
		'wei2' => '2. Weihnachtstag',
		'silv' => 'Silvester'
			);
# This year is $tento
my $tento    = (localtime(time()))[5] + 1900;

# Next year is $pristi
my $pristi = $tento + 1;

# Get the list of holidays for next year
my @svatky = @{holidays( WHERE  => ['all'], 
                         FORMAT => "%#:%d.%m.%Y (%s s since the epoch.)",
                         YEAR   => $pristi
             )};

print "Czech holidays in $pristi:\n";
print "-----------------------\n";

foreach (@svatky){
	# Split name and date
	my ($name, $datum) = split /:/;
	# Print name from $svatky_full_names along with the date
	printf ("%-40s: %10s\n", $svatky_full_names{$name}, $datum);
}

exit 0;
