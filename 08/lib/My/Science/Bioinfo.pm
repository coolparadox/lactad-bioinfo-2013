package My::Science::Bioinfo;

#
# Bioinformatics module
#
# This library was developed as a homework exercise for LaCTAD Bioinformatics Course VI.
# By Rafael Lorandi <coolparadox@gmail.com>.
#

use base Exporter;
our @EXPORT_OK = (
	"is_dna",
	"dna_complement",
	"is_protein",
	"nucleotide_stats",
	"dna_mutate"
);
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

# Induce a fixed number of random mutations in a DNA sequence.
# Note: input is assumed to be valid DNA (no check is performed); you may want
# to validate it with is_dna() prior to calling this subroutine.
# Note: length of DNA sequence is assumed to be greater than number of mutations
# to be performed. Caller is supposed to verify this prior to calling this subroutine.
sub dna_mutate {

	my ($how_many_mutations, $dna_sequence) = @_;
	my $sequence_size = length $dna_sequence;
	my %mutations;
	while (scalar keys %mutations < $how_many_mutations) {

		# Decide what position to mutate.
		# Rely the random number seed is automatically set by rand()
		# as since Perl 5.004.
		my $mutation_pos = int rand $sequence_size;

		# Make sure we don't mutate again a previously mutated position.
		if (defined $mutations{$mutation_pos}) { next; }

		# Decide what nucleotide the mutated position will turn to.
		my $original_nucleotide = substr ($dna_sequence, $mutation_pos, 1);
		my $mutated_nucleotide = $original_nucleotide;
		while ($mutated_nucleotide eq $original_nucleotide) {

			my $nucleotide_pos = int rand 4;
			if ($original_nucleotide =~ m/[[:lower:]]/) {

				$mutated_nucleotide = substr ("acgt", $nucleotide_pos, 1);

			}
			else {

				$mutated_nucleotide = substr ("ACGT", $nucleotide_pos, 1);

			}

		}

		# Mutation position and value defined; add them to the mutation hash.
		$mutations{$mutation_pos} = $mutated_nucleotide;

	}

	# Apply mutations.
	foreach my $mutation_pos (keys %mutations) {

		substr ($dna_sequence, $mutation_pos, 1) = $mutations{$mutation_pos};

	}

	# Answer the mutated sequence.
	return $dna_sequence;

}

1;

