$ ./nucleotide_stats -h
usage: nucleotide_stats -h
   or: nucleotide_stats [OPTIONS...] [SEQUENCE]

Count appearances of nucleotides in a DNA sequence.

  -h, --help      This help screen.
  -v, --version   Version number of this routine.

SEQUENCE is a DNA sequence. If absent, it's read from STDIN.

Count results are sent to STDOUT.

Report bugs to Rafael Lorandi <coolparadox@gmail.com>.


$ ./nucleotide_stats AGTGGCTGAGTCGA
A = 3 (21.4%)
T = 3 (21.4%)
C = 2 (14.3%)
G = 6 (42.9%)


$ ./nucleotide_stats <sample.dna 
A = 1009 (30.1%)
T = 856 (25.6%)
C = 742 (22.2%)
G = 741 (22.1%)

