PREFIX="$1"

if [ "$PREFIX" = "" ]
then
	exit -1
fi

echo "save-all" | docker attach $PREFIX-mc-server
echo "stop" | docker attach $PREFIX-mc-server

