# report RAST genomic assignments
##########
##
##########

#
# Usage= bash summary_feats.sh RAST_DIR
#

dir_=$1

# rnas
trna=`cat $dir_/assigned_functions | grep -c "tRNA"`
rnas=`cat $dir_/assigned_functions | grep -c "^"`
rrna=`echo "($rnas-$trna)" | bc`

# protein encoding genes
pegs=`cat $dir_/Features/peg/tbl | grep -c "^"`
echo
echo "working dir: "$dir_
echo "t-RNA number: "$trna
echo "r-RNA number: "$rrna

echo "PEG number: "$pegs
