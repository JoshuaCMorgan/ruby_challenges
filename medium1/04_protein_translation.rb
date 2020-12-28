=begin
Lets write a program that will translate RNA sequences into proteins. RNA can 
be broken into three nucleotide sequences called codons, and then translated to 
a polypeptide like so:

RNA: "AUGUUUUCU" => translates to

Codons: "AUG", "UUU", "UCU"
=> which become a polypeptide with the following sequence =>

Protein: "Methionine", "Phenylalanine", "Serine"

There are 64 codons which in turn correspond to 20 amino acids; however, all of 
the codon sequences and resulting amino acids are not important in this 
exercise.

There are also four terminating codons (also known as 'STOP' codons); if any of 
these codons are encountered (by the ribosome), all translation ends and the 
protein is terminated. All subsequent codons after are ignored, like this:

RNA: "AUGUUUUCUUAAAUG" =>

Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

Protein: "Methionine", "Phenylalanine", "Serine"

Note the stop codon terminates the translation and the final methionine is not translated into the protein sequence.--

Below are the codons and resulting Amino Acids needed for the exercise.
Codon 	Amino Acids
AUG 	Methionine
UUU, UUC 	Phenylalanine
UUA, UUG 	Leucine
UCU, UCC, UCA, UCG 	Serine
UAU, UAC 	Tyrosine
UGU, UGC 	Cysteine
UGG 	Tryptophan
UAA, UAG, UGA 	STOP
=end


=begin
	- tranlate single codon to amino acide
    - iterate through lookup table to see which group condon belongs
  
  - tranlate RNA strand to collection of its aminos
    - group strand by 3 elements each
    - iterate through codon, traslating to amino acid and putting in collection
=end

class InvalidCodonError < StandardError
end


class Translation
  PROTEIN_CODON = {
    "Methionine" => ["AUG"],
    "Phenylalanine" => ["UUU", "UUC"],
    "Leucine" => ["UUA", "UUG"],
    "Serine" => ["UCU", "UCC", "UCA", "UCG"],
    "Tyrosine" => ["UAU", "UAC"],
    "Cysteine" => ["UGU", "UGC"],
    "Tryptophan" => ["UGG"],
    "STOP" => ["UAA", "UAG", "UGA"]
  }

  def self.of_codon(codon)
    PROTEIN_CODON.keys.each do |amino|
      return amino if PROTEIN_CODON[amino].include?(codon)
    end
    return nil
  end

  def self.of_rna(strand)
    protein =[]

    strand.scan(/.{3}/).each do |codon|
      amino = of_codon(codon) 
      raise InvalidCodonError if amino == nil
      break if amino == "STOP"
      protein << amino
    end

    protein
  end
end