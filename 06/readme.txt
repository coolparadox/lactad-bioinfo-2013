$ ./search_motif -h
usage: search_motif -h
   or: search_motif [OPTIONS...] MOTIF [SEQUENCE]

Search for a motif in a protein sequence.

  -h, --help      This help screen.
  -v, --version   Version number of this routine.

MOTIF is a Perl regular expression to be matched to SEQUENCE.
SEQUENCE is a protein amino acid sequence. If absent, it's read from STDIN.

SEQUENCE is always sent to STDOUT with matched amino acid codes upper cased (and
unmatched ones lower cased).

Exit status is 0 if motif is found, 1 if motif is not found, >1 on errors.

Report bugs to Rafael Lorandi <coolparadox@gmail.com>.


$ cat sample.protein 
MTMSSTSTATATSTATATLDEANATVGEMFSDADMAEVRHVVQRILVPCVFVIGLLGNSVSIYVLTRKRM
RCTTNIYLTALAITDIAYLTCQLILSLQHYDYPKYHFKLYWQLYGYFVWLCDSFGYISIYIAVCFTIERF
IAIRYPLKRQTFCTESLAKKVIAAVAIFCLLSTLSTAFEHTITIGTRQIDDAYQPCNQTVANISPMPPSP
VAVTPPLATPPLPTPATIWQSPDSAMESTTSGSSNQLVDWGSGSGDGEPENIPRHRRHWQSSGFVTLPTL
RKTLEEQDQEVADAGQGSGVTESLLQLWRRKRSAENHNINNTDAFAFNVTEYCQNVTYYNHGLSELGYDE
LYSYLWNLFTLLVFVVFPLLLLATFNSILILLVHRSKNLRGDLTNASSIRRTKRKSNSGLKGSVSQENRV
TITLIAVVLMFIVCQLPWAIYLIVNQYMEIQIGTQVVAGNVCNLLASLHAASNFFLYCVLSDKYRKTVRE
LITGYRYRRRHARNNTSLYVPHTTTTLTQINGDHYGSNYGGAGSRRNRNTGRLIA


$ ./search_motif 'FCLLSTL.{0,20}GTRQIDDAYQ' <sample.protein 
motif found! :-)
mtmsststatatstatatldeanatvgemfsdadmaevrhvvqrilvpcvfvigllgnsvsiyvltrkrmrcttniyltalaitdiayltcqlilslqhydypkyhfklywqlygyfvwlcdsfgyisiyiavcftierfiairyplkrqtfcteslakkviaavaiFCLLSTLSTAFEHTITIGTRQIDDAYQpcnqtvanispmppspvavtpplatpplptpatiwqspdsamesttsgssnqlvdwgsgsgdgepeniprhrrhwqssgfvtlptlrktleeqdqevadagqgsgvtesllqlwrrkrsaenhninntdafafnvteycqnvtyynhglselgydelysylwnlftllvfvvfpllllatfnsilillvhrsknlrgdltnassirrtkrksnsglkgsvsqenrvtitliavvlmfivcqlpwaiylivnqymeiqigtqvvagnvcnllaslhaasnfflycvlsdkyrktvrelitgyryrrrharnntslyvphttttltqingdhygsnyggagsrrnrntgrlia


$ ./search_motif 'FCLLSTL.{0,20}GTRQIDDAYQ' <sample.protein | sed -r -e 's/.{70}/&\n/g'
motif found! :-)
mtmsststatatstatatldeanatvgemfsdadmaevrhvvqrilvpcvfvigllgnsvsiyvltrkrm
rcttniyltalaitdiayltcqlilslqhydypkyhfklywqlygyfvwlcdsfgyisiyiavcftierf
iairyplkrqtfcteslakkviaavaiFCLLSTLSTAFEHTITIGTRQIDDAYQpcnqtvanispmppsp
vavtpplatpplptpatiwqspdsamesttsgssnqlvdwgsgsgdgepeniprhrrhwqssgfvtlptl
rktleeqdqevadagqgsgvtesllqlwrrkrsaenhninntdafafnvteycqnvtyynhglselgyde
lysylwnlftllvfvvfpllllatfnsilillvhrsknlrgdltnassirrtkrksnsglkgsvsqenrv
titliavvlmfivcqlpwaiylivnqymeiqigtqvvagnvcnllaslhaasnfflycvlsdkyrktvre
litgyryrrrharnntslyvphttttltqingdhygsnyggagsrrnrntgrlia

