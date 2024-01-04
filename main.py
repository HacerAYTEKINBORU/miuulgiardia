# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press ⌘F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/


#Hello @everyone Macbook m1/m2 işlemcileri olup Mamba / Snakemake🐍  Ve tRNAscan kurlumları ile sorun yaşayanlar  şu adımlar izleyebilirsiniz 🤕
#1)  conda update conda   ile güncellenir.
#2) conda config --add channels biocondaile bioconda kanalı config edilir.
#3) conda config --add channels conda-forge ile conda-forge kanalı confing edilir.
#4) Base ortamında conda install mamba ile mamba yüklenebilir.
#5) tRNAscan için sanal ortam oluşturulur. ör/ conda create -n trnascan
#6) Sanal ortam aktifleştirilir ve içine conda install -c nanoporetech trnascan-se ile paket yüklenir.
#7) Snake make için sanal ortam açılır. ör/ conda create -n snakemake
#8) Sanal ortama aktifleştirilir ve içine conda install -c bioconda snakemake veya mamba install -c  bioconda snakemake  ile paket yüklenir.
#9) Bu kadar şey yapmamıza rağmen hala sanakemake yüklenmekte direnirse env içine conda install pip ile pip kurulur ve pip install snakemake ile snakemake yüklenebilir.