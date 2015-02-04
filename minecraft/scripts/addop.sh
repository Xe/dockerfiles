OP="$1"
PREFIX="$2"

if [ "$OP" = "" ]
then
	exit -1
fi

if [ "$PREFIX" = "" ]
then
	exit -1
fi

echo "Trying to op $OP on $PREFIX"

echo "op $OP" | docker attach "$PREFIX"-mc-server

