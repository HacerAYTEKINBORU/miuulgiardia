#rule all:
    #input: "output/tRNA_scan_result.txt",
           #"output/G_intestinalis.tRNA"

#rule tRNAscan:
    #input: "resource/Genome/G_intestinalis.fasta",
    #output: "output/tRNA_scan_result.txt"
    #conda: "env/env.yaml"
    #shell: """tRNAscan-SE {input} -o {output}"""

#rule tRNAscan_stats:
    #input:
        #Genome = "resource/Genome/G_intestinalis.fasta"
    #output:
        #tRNA = "output/G_intestinalis.tRNA",
        #stats = "output/G_intestinalis.stats"
    #params:
        #threads=2
    #conda :
        #"env/env.yaml"
    #script:
        #"scripts/tRNAscan_stats.py"







rule all:
    input:
        "output/tRNA_scan_result.txt",
        "output/tRNAscan/G_intestinalis.tRNA",
        expand("output/tRNAscan/{sp}.tRNA", sp=["G_muris", "G_intestinalis"])

rule tRNAscan_stats_wildcard:
    input:
        genome="resource/Genome/{genome}.fasta"
    output:
        tRNA="output/tRNAscan/{genome}.tRNA",
        stats="output/tRNAscan/{genome}.stats"
    params:
        threads=2
    conda:
        "env/env.yaml"
    script:
        "scripts/tRNAscan_stats.py"

#rulemakeblastdb:
    #input:
        #"resource/{type}/db/{db}.fasta"
    #output:
       # "output/{type}/db/{db}.ndb",
       # "output/{type}/db/{db}.nhr",
        #"output/{type}/db/{db}.nin",
       # "output/{type}/db/{db}.not",
        #"output/{type}/db/{db}.nsq",
        #"output/{type}/db/{db}.ntf",
        #"output/{type}/db/{db}.nto"
   # params:
       # outname="output/{type}/db/{db}"

    #shell:
       # 'makeblastdb -dbtype nucl -in {input} -out{params.outname}'



#rule blastn:
 #   input:
  #      query="resource/{type}/query/{query}.fasta",
   #     db="output{type}/db/{db}.ndb"
    #output:
     #   'output/{type}/{db}{query}.blastn'
   # params:
    #    perc_identity=95,
     #   outfmt=6,
      #  num_threads=2,
       # max_target_seq=1,
        #max_hsps=1,
        #db_prefix="output/{type}/db/{db}"
  #  conda:
  #      "env/env.yaml"
   # script:
   #     "scripts/blastn.py"

#from snakemake.shell import shell
#input,output
#query = snakemake.input.query
#out = snakemake.output[0]
#paramaters
#db_prefix = snakemake.params.db_prefix
#perc_identity = snakemake.params.perc_identity
#outfmt = snakemake.params.outfmt
#num_threads = snakemake.params.num_threads
#max_target_seqs = snakemake.params.max_target_seqs
#max_hsps = snakemake.params.max_hsps

#command line
#shell(f"""
 #   blast -query {query} -db {db_prefix} -out {out} \
  #  -perc_indentity {perc_identity} \
   # -outfmt {outfmt} \
    #-num_threads {num_threads} \
    #-max_target_seqs {max_target_seqs}
    #-max_hsps {max_hsps}
#""")