# Check if the file exists
if [ ! -e midecalRecord.txt ]; then
  echo "File 'midecalRecord' does not exist."
  exit 1
fi

whle [ ];do
	done

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
echo "Enter the Patient ID: "
read idt
idt=$( echo -n $idt | wc -c )
if [ $idt -eq 7 ]; then
  test="$( grep "^$idt" midecalRecord.txt | cut -d':' -f2 | cut -d',' -f1 )"
  resultt=$( grep "^$idt" midecalRecord.txt | cut -d':' -f2 | cut -d',' -f3 )
  Hgbt="$(grep "Hgb" medicalTest.txt | cut -d':' -f3 | cut -d';' -f1)"
  BGTt="$(grep "BGT" medicalTest.txt | cut -d':' -f3 | cut -d';' -f1)"
  LDLt="$(grep "LDL" medicalTest.txt | cut -d':' -f3 | cut -d';' -f1)"
  systolet="$(grep "systole" medicalTest.txt | cut -d':' -f3 | cut -d';' -f1)"
  diastolet="$(grep "diastole" medicalTest.txt | cut -d':' -f3 | cut -d';' -f1)"

    printf "1) Retrieve all patient tests:\n"
	printf "2) Retrieve all up normal patient tests:\n"
	printf "3) Retrieve all patient tests in a given specific period:\n"
	printf "4) Retrieve all patient tests based on test status:\n"
	read u
	case $u in 
	1)
		#temp=$( grep "^$digits" midecalRecord.txt | cut -d':' -f2 | cut -d',' -f1 )
		printf "the patient have this tests\n"
		grep "^$idt" midecalRecord.txt
	;;
	2)
     for tempt in $test
	 do 
	case $tempt in
	    "Hgb")
		     if [ $(( $resultt$(echo $Hgbt | cut -d',' -f1 ) &&  $resultt$(echo $Hgbt | cut -d',' -f2 ) )) == 0 ]; then
				grep "^$idt" midecalRecord.txt | grep "$"
				fi
	        ;;
		"BGT")	
		 if [ $(( $resultt$(echo $BGTt | cut -d',' -f1 ) &&  $resultt$(echo $BGTt | cut -d',' -f2 ) )) == 0 ]; then
				echo patient with id$idt have $test
				fi
	        ;;
	    "LDL")	
		 if [ $(( $resultt$(echo $LDLt) )) == 0 ]; then
				echo patient with id$idt have $test 
				fi
	        ;;
		"systole")	
		 if [ $(( $resultt$(echo $systolet) )) == 0 ]; then
				echo patient with id$idt have $test 
				fi
	        ;;
		"diastole")	
		 if [ $(( $resultt$(echo $diastolet) )) == 0 ]; then
				echo patient with id$idt have $test 
				fi
	        ;;
		*) printf "patient with id$idt have no up normal tests"				
		
	esac
	done
	;;
	3)
	#بفكر نعمل شرط اذا بده الفترة سنوات او سنين
	printf "enter the year:"
	reed y
	printf "enter the month"
	reed m
	grep "^$idt.*y.*m"  midecalRecord.txt 
	;;
	4)
	printf "completed"
	grep "^1300500.*completed$" midecalRecord.txt
	printf "*********"
	printf "pending\n"
	grep "^1300500.*pending$" midecalRecord.txt
	;;
	*)
	echo 'please enter a valid choice'
	;;
	esac
    
	else
	echo "Not valid. Your ID should be exactly 7 digits."

fi
	

;;
3)
# Extract the required fields
rbcT=$(grep "[Rr][Bb][Cc]" midecalRecord.txt | cut -d":" -f2 | cut -d"," -f3)
HgbT=$(grep "[Hh][Gg][Bb]" midecalRecord.txt | cut -d":" -f2 | cut -d"," -f3)
BGTT=$(grep "[Bb][Gg][Tt]" midecalRecord.txt | cut -d":" -f2 | cut -d"," -f3)
LDLT=$(grep "[Ll][Dd][Ll]" midecalRecord.txt | cut -d":" -f2 | cut -d"," -f3)
sysT=$(grep "[Ss][Yy][Ss]" midecalRecord.txt | cut -d":" -f2 | cut -d"," -f3)
diaT=$(grep "[Dd][Ii][Aa]" midecalRecord.txt | cut -d":" -f2 | cut -d"," -f3)

# RBC Test Average Calculation
count=$(echo "$rbcT" | wc -l)
sum=0
i=1
if [ "$count" -ne 0 ]; then
while [ "$i" -le "$count" ];do
    value=$(echo "$rbcT" | sed -n "${i}p")
    sum=$(echo "$sum + $value" | bc)
    i=$((i + 1))
done
fi
if [ "$count" -ne 0 ]; then
    avg=$(echo "scale=2; $sum / $count" | bc)
else
    avg=0
fi
echo "RBC Test Average = $avg"

# HGB Test Average Calculation
count=$(echo "$HgbT" | wc -l)
sum=0
i=1
if [ "$count" -ne 0 ]; then
while [ "$i" -le "$count" ]; do
    value=$(echo "$HgbT" | sed -n "${i}p")
    sum=$(echo "$sum + $value" | bc)
    i=$((i + 1))
done
fi
if [ "$count" -ne 0 ]; then
    avg=$(echo "scale=2; $sum / $count" | bc)
else
    avg=0
fi
echo "HGB Test Average = $avg"

# BGT Test Average Calculation
count=$(echo "$BGTT" | wc -l)
sum=0
i=1
if [ "$count" -ne 0 ]; then
while [ "$i" -le "$count" ]; do
    value=$(echo "$BGTT" | sed -n "${i}p")
    sum=$(echo "$sum + $value" | bc)
    i=$((i + 1))
done
fi
if [ "$count" -ne 0 ]; then
    avg=$(echo "scale=2; $sum / $count" | bc)
else
    avg=0
fi
echo "BGT Test Average = $avg"

# LDL Test Average Calculation
count=$(echo "$LDLT" | wc -l)
sum=0
i=1
if [ "$count" -ne 0 ]; then
while [ "$i" -le "$count" ]; do
    value=$(echo "$LDLT" | sed -n "${i}p")
    sum=$(echo "$sum + $value" | bc)
    i=$((i + 1))
done
fi
if [ "$count" -ne 0 ]; then
    avg=$(echo "scale=2; $sum / $count" | bc)
else
    avg=0
fi
echo "LDL Test Average = $avg"

# SYS Test Average Calculation
count=$(echo "$sysT" | wc -l)
sum=0
i=1
if [ "$count" -ne 0 ]; then
while [ "$i" -le "$count" ]; do
    value=$(echo "$sysT" | sed -n "${i}p")
    sum=$(echo "$sum + $value" | bc)
    i=$((i + 1))
done
fi
if [ "$count" -ne 0 ]; then
    avg=$(echo "scale=2; $sum / $count" | bc)
else
    avg=0
fi
echo "SYS Test Average = $avg"

# DIA Test Average Calculation
count=$(echo "$diaT" | wc -l)
sum=0
i=1
if [ "$count" -ne 0 ]; then
while [ "$i" -le "$count" ]; do
    value=$(echo "$diaT" | sed -n "${i}p")
    sum=$(echo "$sum + $value" | bc)
    i=$((i + 1))
done
fi
if [ "$count" -ne 0 ]; then
    avg=$(echo "scale=2; $sum / $count" | bc)
else
    avg=0
fi
echo "DIA Test Average = $avg"
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