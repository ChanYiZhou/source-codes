#! /bin/sh -e
#Tag 1538
#
# convert a DOS ASCII file to a UNIX ASCII file by removing trailing ^M at the
# end of each line and ^Z at the end of the file

TMPFILE=/tmp/to_unix$$

if [ $# -gt 2 ]
then
echo "usage: to_unix [<dos_file> [<unix_file>]"
exit 1
fi

# First strip out all carriage-return and ctrl-Z's
if [ $# -gt 0 ]
then
tr -d '\015\032' < "$1" > $TMPFILE
else
tr -d '\015\032' > $TMPFILE
fi


if [ $# -eq 2 ]
then
mv -f $TMPFILE "$2"
else
cat $TMPFILE
rm $TMPFILE
fi
