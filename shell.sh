# Check if the file exists

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
read new 
#check if valid
id=$( echo -n "$(echo $new | cut -d':' -f1)" | wc -c )
name=$(echo -n "$(echo $new | cut -d':' -f2 | cut -d',' -f1)" | wc -c)
date=$(echo -n "$(echo $new | cut -d':' -f2 | cut -d',' -f2)" | wc -c)
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
	echo "enter the Patient ID: "
	
;;
5)
printf "loading...\n"
printf "exiting...\n"
exit 0
break
;;
*) printf "please enter a valid choice\n" ;;

esac
done