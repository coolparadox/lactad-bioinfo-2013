package My::Science::Bioinfo;

#
# Bioinformatics module
#
# This library was developed as a homework exercise for LaCTAD Bioinformatics Course VI.
# By Rafael Lorandi <coolparadox@gmail.com>.
#

use base Exporter;
our @EXPORT_OK = ("is_dna", "dna_complement", "is_protein", "nucleotide_stats");
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

# Count appearances of each nucleotide in a DNA sequence.
# Note: input is assumed to be valid DNA (no check is performed); you may want
# to validate it with is_dna() prior to calling this subroutine.
sub nucleotide_stats {

	my ($sequence) = @_;
	my %answer;
	$answer{'A'} = ($sequence =~ tr/aA//);
	$answer{'C'} = ($sequence =~ tr/cC//);
	$answer{'G'} = ($sequence =~ tr/gG//);
	$answer{'T'} = ($sequence =~ tr/tT//);
	return %answer;

}

1;

