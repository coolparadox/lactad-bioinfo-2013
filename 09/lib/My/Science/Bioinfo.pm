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
	"dna_mutate",
	"dna_translate"
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

# Conversion table from codons to aminoacids.
my %genetic_code = (

	TTT => 'F',  # Phenylalanine
	TTC => 'F',  # Phenylalanine
	TTA => 'L',  # Leucine
	TTG => 'L',  # Leucine

	TCT => 'S',  # Serine
	TCC => 'S',  # Serine
	TCA => 'S',  # Serine
	TCG => 'S',  # Serine

	TAT => 'Y',  # Tyrosine
	TAC => 'Y',  # Tyrosine
	TAA => '*',  # translation stop
	TAG => '*',  # translation stop

	TGT => 'C',  # Cysteine
	TGC => 'C',  # Cysteine
	TGA => '*',  # translation stop
	TGG => 'W',  # Tryptophan

	CTT => 'L', # Leucine
	CTC => 'L', # Leucine
	CTA => 'L', # Leucine
	CTG => 'L', # Leucine

	CCT => 'P', # Proline
	CCC => 'P', # Proline
	CCA => 'P', # Proline
	CCG => 'P', # Proline

	CAT => 'H', # Histidine
	CAC => 'H', # Histidine
	CAA => 'Q', # Glutamine
	CAG => 'Q', # Glutamine

	CGT => 'R', # Arginine
	CGC => 'R', # Arginine
	CGA => 'R', # Arginine
	CGG => 'R', # Arginine

	ATT => 'I', # Isoleucine
	ATC => 'I', # Isoleucine
	ATA => 'I', # Isoleucine
	ATG => 'M', # Methionine

	ACT => 'T', # Threonine
	ACC => 'T', # Threonine
	ACA => 'T', # Threonine
	ACG => 'T', # Threonine

	AAT => 'N', # Asparagine
	AAC => 'N', # Asparagine
	AAA => 'K', # Lysine
	AAG => 'K', # Lysine

	AGT => 'S', # Serine
	AGC => 'S', # Serine
	AGA => 'R', # Arginine
	AGG => 'R', # Arginine

	GTT => 'V', # Valine
	GTC => 'V', # Valine
	GTA => 'V', # Valine
	GTG => 'V', # Valine

	GCT => 'A', # Alanine
	GCC => 'A', # Alanine
	GCA => 'A', # Alanine
	GCG => 'A', # Alanine

	GAT => 'D', # Aspartic acid
	GAC => 'D', # Aspartic acid
	GAA => 'E', # Glutamic acid
	GAG => 'E', # Glutamic acid

	GGT => 'G', # Glycine
	GGC => 'G', # Glycine
	GGA => 'G', # Glycine
	GGG => 'G', # Glycine

);

# Translate a DNA sequence to aminoacids.
# Assumptions: sequence string is valid DNA (see is_dna() above), and length of
# sequence string is multiple of 3.
sub dna_translate {

	my ($sequence) = @_;
	$sequence = uc $sequence;
	my @codons = $sequence =~ /(.{1,3})/g;
	my @aminoacids;
	foreach my $codon (@codons) {

		push (@aminoacids, $genetic_code{$codon});

	}
	return (join '', @aminoacids);

}

# End of module.
1;

