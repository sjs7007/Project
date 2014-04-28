x=`diff -U 0 $1 $2 | grep -v ^@ | grep -v ^+++ | grep -v ^--- | wc -l`
echo "Difference Count : $x"
