for line in `find test -iname '*.c'`; do 
     make testAll f=`basename $line .c`
done