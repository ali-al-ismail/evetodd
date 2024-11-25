# eve to dd shell script
#dd if=x bs=697 skip=1 of=

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: evetodd <inputfile> [outputfile]"
    echo
    echo "Arguments:"
    echo "<inputfile> File to be processed (required)."
    echo "[outputfile] Optional. in it's absence, will create file as inputfile.dd"
    echo
    echo "Options:"
    echo "-h, --help Display this message."
    exit 0
fi
inputfile=$1
if [ -z "$inputfile" ]
then
	echo "Error: No input file specified, use -h or --help to see usage."
	exit 1
fi

if [ ! -e "$inputfile" ]
then
	echo "Error: input file does not exist."
	exit 1
fi

if [ -n "$2" ]
then
	outputfile=$2
else
	outputfile="${inputfile%.*}.dd"
fi

dd if=$inputfile bs=697 skip=1 of=$outputfile

if [ $? -eq 0 ]
then
	echo "Success."
else
	echo "Error: dd has failed"
fi
