cd #!/bin/bash
# Description: Write a script to get the output from comma-separated value.
# script is to get the values from the comma seprated fiels.

FILE_PATH="/c/Users/SU40134747/documents/shellscript/bsrtestsheet.csv"

echo "HELLO"
declare -A SERVER_DETAILS


echo"adding a change for user222"

echo "Enter 'A' to print the list by OS details"
echo "Enter 'B' to print the list by disk details"
echo
read -r USER_OPTION
echo

if [[ "$USER_OPTION" =~ ^[Aa]$ ]]; 
then
    SERVER_DETAILS[win_count]=$(grep -i "win" "$FILE_PATH" | wc -l)
    SERVER_DETAILS[linux_count]=$(grep -i "linux" "$FILE_PATH" | wc -l)
    echo
    echo "OS_name   count"
    echo "-------   -----"
    echo "window    ${SERVER_DETAILS[win_count]}"
    echo "linux     ${SERVER_DETAILS[linux_count]}"
elif [[ "$USER_OPTION" =~ ^[Bb]$ ]]; 
then
    echo "Enter the server name:"
    echo
    read -r USER_INPUT_SERVER
    echo
    SERVER_DETAILS[server_name]=$USER_INPUT_SERVER
    SERVER_DETAILS[disk_count]=$(grep -i "$USER_INPUT_SERVER" "$FILE_PATH" | wc -l)
    SERVER_DETAILS[disk_size]=$(grep -i "$USER_INPUT_SERVER" $FILE_PATH | awk -F "," '{print $5}' | gawk '{ sum += $1 }; END { print sum }')
    echo
    echo "server_name   disk_count  disk_size"
    echo "-----------   ----------  ---------"
    echo "$USER_INPUT_SERVER      ${SERVER_DETAILS[disk_count]}             ${SERVER_DETAILS[disk_size]} GB"
else
    echo "input in not one of 'A' 'B'"
fi
exit
