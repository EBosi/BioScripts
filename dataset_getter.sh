# usage: bash dataset_getter.sh GENUS OUT_DIR
# download all the contigs of a given genus.
# To download draft genomes of a given species:
#		-> bash dataset_getter.sh GENUS_SPECIES OUT_DIR

genus=$1
out_dir=$2

cd $out_dir
num=0
drafts=`curl ftp://ftp.ncbi.nih.gov/genomes/Bacteria_DRAFT/ -l -s | grep $genus`
for l in $drafts;
do
	file_=''
	mkdir $l;
	file_=$(curl ftp://ftp.ncbi.nih.gov/genomes/Bacteria_DRAFT/$l/ -l -s | grep ".fna");
	cd $l;
	file_="ftp://ftp.ncbi.nih.gov/genomes/Bacteria_DRAFT/$l/$file_";
	wget $file_;
	cd .. ;
	num=`expr $num + 1`
done

echo -e "\e[00;31mtask done!\ntotal genome retrieved: $num\e[00m"

# you may want to extract all... just like that
# for f in $(ls | grep "Pseudo"); do cd $f; f2=$(ls); echo $f2; tar -zxvf $f2; cd ..; done
# rm */*.tgz
# 
# you may want to merge all contigs into a multifasta
# for f in $(ls | grep $genus); do cd $f; cat *.fna > $f; cd ..;done
