# cmd: bash bindcsv_run.sh yourfile
# converted csv will be under originalfilename_results
# Make sure AWK and SED are downloaded 
# May take up to 15 seconds for program to complete
echo "$1"
echo "$(mkdir -p $1_results)"
echo "$(cat $1 | tr " " "\n" | grep .com > $1IGNOREME.txt)"

while read p; do
	echo "$(host $p|grep " has address "| sed 's/has address/,/g')"
done < $1IGNOREME.txt > $1_results/$1.csv
