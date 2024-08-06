# Check if the file exists
if [ ! -e midecalRecord ]; then
  echo "File 'midecalRecord' does not exist."
  exit 1
fi


n=1
while [ "$n" -eq 1 ]
do 
printf "1) Add a new medical test record:\n"
printf "2) Search for a test by patient ID:\n"
printf "3) Average test value:\n"
printf "4) Update an existing test result\n"
printf "5) Exit\n"
printf "enter your choice: "
read y
case $y in
1)
printf "Enter new medical test record\n"
echo "you should enter it in that formula"
echo ' "id" : "name" , "year-month" , "result" , "status" '
read new 
#check if valid
id=$( echo -n "$(echo $new | cut -d':' -f1)" | wc -c )
name=$(echo -n "$(echo $new | cut -d':' -f2 | cut -d',' -f1)" | wc -c)
month=$(echo -n "$(echo $new | cut -d':' -f2 | cut -d',' -f2 | cut -d'-' -f2)" | wc -c)
year=$(echo -n "$(echo $new | cut -d':' -f2 | cut -d',' -f2 | cut -d'-' -f1)" | wc -c)
result=$(echo -n "$(echo $new | cut -d':' -f2 | cut -d',' -f3)" | wc -c)
status=$(echo -n "$(echo $new | cut -d':' -f2 | cut -d',' -f5)" | wc -c)
echo $id
echo $name
echo $date
echo $result
echo $status

if [ $id -ne 7 ]
then 
echo " not valid your id should be = 7 integer"
elif [ $name -ge 5 ]
then
echo "not valid "
elif [ $year -ne 4 ] || [ $month -ne 2  ]
then
echo "not valid date 2"
elif [ $result -ge 5 ]
then
echo "not valid 3"
elif [ $status -ge 12 ]
then 
echo "not valid 4"
else 
printf "the input is valid\n"
echo "$new" >> midecalRecord.txt
fi 
;;
2)
	
	printf "1) Retrieve all patient tests:\n"
	printf "2) Retrieve all up normal patient tests:\n"
	printf "3) Retrieve all patient tests in a given specific period:\n"
	printf "4) Retrieve all patient tests based on test status:\n"
	read u
	case $u in
	1)
	echo '21'
	;;
	2)
	echo '22'
	;;
	3)
	echo '23'
	;;
	4)
	echo '24'
	;;
	*)
	echo 'please enter a valid choice'
	;;
	esac

;;
3)
printf "avg value\n"
;;
4)
echo "Enter the Patient ID: "
read ID

# Count the number of digits
digits=$(echo -n "$ID" | wc -m)

if [ "$digits" -ne 7 ]; then
    echo "Not valid. Your ID should be exactly 7 digits."
    exit 1
fi

# Extract the old result and the full record line
record=$(grep "$ID" midecalRecord.txt)
old=$(echo "$record" | cut -d":" -f2 | cut -d"," -f3)

if [ -z "$old" ]; then
    echo "No record found for Patient ID: $ID"
    exit 1
fi

echo "Enter the new result: "
read result

# Use sed to update only the result part of the line
sed -i "/$ID/s/\($ID:[^,]*,[^,]*,\)\($old\)/\1$result/" midecalRecord.txt

# Check if the sed command was successful
if [ $? -eq 0 ]; then
    echo "Record updated successfully."
else
    echo "Failed to update the record."
fi
;;
5)
printf "loading...\n"
printf "exiting...\n"
break
;;
*) printf "please enter a valid choice\n" ;;

esac
done