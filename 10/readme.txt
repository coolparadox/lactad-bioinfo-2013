$ ./fasta_stats -h
usage: fasta_stats -h
   or: fasta_stats [OPTIONS...] FILE

Statistics of fasta files.

  -h, --help          This help screen.
  -v, --version       Version number of this routine.

FILE is the path to a fasta formated file containing DNA information.

Statistics are sent to STDOUT.

Report bugs to Rafael Lorandi <coolparadox@gmail.com>.


$ ./fasta_stats sample.fasta 
Sequence 1: gi|451353760|gb|KC180650.1|
Description: Drosophila melanogaster strain ZS044 couch potato (cpo) gene, partial cds
First 40 nucleotides: TCGTCAAAATAGCCAACTACCAGGACCTGTTGGGCAGCCA
Sequence size: 1479 nucleotides
Nucleotide counts: A = 391 (26.4%), T = 187 (12.6%), G = 366 (24.7%), C = 535 (36.2%)
                   A+T = 578 (39.1%), G+C = 901 (60.9%)

Sequence 2: gi|451353756|gb|KC180648.1|
Description: Drosophila melanogaster strain ZS037 couch potato (cpo) gene, partial cds
First 40 nucleotides: TCGTCAAAATAGCCAACTACCAGGACCTGTTGGGCAGCCA
Sequence size: 1473 nucleotides
Nucleotide counts: A = 388 (26.3%), T = 187 (12.7%), G = 366 (24.8%), C = 532 (36.1%)
                   A+T = 575 (39.0%), G+C = 898 (61.0%)

Sequence 3: gi|451353752|gb|KC180646.1|
Description: Drosophila melanogaster strain ZS028 couch potato (cpo) gene, partial cds
First 40 nucleotides: TCGTCAAAATAGCCAACTACCAGGACCTGTTGGGCAGCCA
Sequence size: 1485 nucleotides
Nucleotide counts: A = 393 (26.5%), T = 191 (12.9%), G = 367 (24.7%), C = 534 (36.0%)
                   A+T = 584 (39.3%), G+C = 901 (60.7%)

Sequence 4: gi|451353748|gb|KC180644.1|
Description: Drosophila melanogaster strain ZS011 couch potato (cpo) gene, partial cds
First 40 nucleotides: TCGTCAAAATAGCCAACTACCAGGACCTGTTGGGCAGCCA
Sequence size: 1485 nucleotides
Nucleotide counts: A = 393 (26.5%), T = 191 (12.9%), G = 367 (24.7%), C = 534 (36.0%)
                   A+T = 584 (39.3%), G+C = 901 (60.7%)

** End of sequences, total of 4 sequence(s) processed.

