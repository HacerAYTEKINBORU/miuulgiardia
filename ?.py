#import yaml
#data = {}

#with open('miuul.yaml', 'w') as file:
#    yaml.dump(data, file, default_flow_style=False)


################################
#env açmak için
#conda env export > environment.yaml
####################################

#Snakefile dosyasına yazıalacak olan komudlar

rule all:
    input: "output/tRNA_scan_result.txt",
            "output/G_intestinalis.tRNA"
rule tRNAscan:
    input:"resource/G_intestinalis.fasta"
    output:"output/tRNA_scan_result.txt"
    shell:"bash run_tRNAscan.sh {input} {output}"

rule tRNAscan_stats:
    input:
            genome="resource/G_intestinalis.fasta"
    output:
            tRNA = "output/G_intestinalis.tRNA"
            stats = "output/G_intestinalis.stats"
    params:
            threads=2
    conda:
             "env/env.yaml"
    script:
        "scripts/tRNAscan_stats.py"


from snakemake.shell import shell
genome = snakemake.input.genome
tRNA = snakemake.output.tRNA
stats = snakemake.output.stats
shell(f"""tRNAscan-SE {genome} -0 {tRNA} -m{stats}""")

#
#
#
#
#
#