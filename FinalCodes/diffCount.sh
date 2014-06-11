diff=`diff -U 0 $1 $2 | grep -v ^@ | grep -v ^+++ | grep -v ^--- | wc -l`
n1=`cat $1 | wc -l`
n2=`cat $2 | wc -l`

echo "No. of lines in file1 : $n1"
echo "No. of lines in file2 : $n2"
echo "Difference Count : $diff"


