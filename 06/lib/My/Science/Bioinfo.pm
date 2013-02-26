package My::Science::Bioinfo;

#
# Bioinformatics module
#
# This library was developed as a homework exercise for LaCTAD Bioinformatics Course VI.
# By Rafael Lorandi <coolparadox@gmail.com>.
#

use base Exporter;
our @EXPORT_OK = ("is_dna", "dna_complement", "is_protein");
our %EXPORT_TAGS = (all => \@EXPORT_OK);

use strict;
use warnings;

# Does a string represent DNA?
sub is_dna {

	my ($sequence) = @_;
	return !($sequence =~ m/[^aAcCgGtT]/);

}

# Reverse complement a DNA sequence.
sub dna_complement {

	my ($sequence) = @_;
	$sequence =~ tr/aAcCgGtT/tTgGcCaA/;
	return scalar reverse $sequence;

}

# Does a string represent a protein?
sub is_protein {

	my ($sequence) = @_;
	return !($sequence =~ m/[^aAbBcCdDeEfFgGhHiIkKlLmMnNoOpPqQrRsStTuUvVwWyYzZ]/);

}

1;

