
function validate_backup_params(){
a=$1
b=$2
pass=$3 

#echo $a
#echo $b
#echo $pass
#echo $d #date

if [[ -z "${a}"|| -z "${b}"|| -z "${pass}" ]];then
	echo "you need to pass three paramters so, you need to enter as followeing '.root/01/backup.sh #the_folder_to_backup #the_folder where_the_first_parameter will_be_stored #pass'"
fi

}

function backup(){

a=$1
b=$2
pass=$3
d=$(date | sed s/\ /_/g | sed s/\:/_/g)


echo "_________________the file that will contain your file is created__________"
cd ~
cd $b
mkdir $d
cd $d

echo "__________looping over the directory you need to backup____________"
#di -> directory and files
#d -> date 
for di in /root/$a/*
  do
	if [[ -d $di ]];then  #looping over the directories and the files inside the folder i want to backup
		echo  "asd_$di"
		target=$(basename $di)
		cp -r $di $target
		name="<$target>_<$d>"
		echo "it will saved as $name.tar.gz"
		tar -czvf $name.tar.gz $target
		rm -r $target
		#tar -xf $name.tar.gz -> this for testinh
		gpg --batch --output $name.tar.gz.gpg --passphrase $pass --symmetric $name.tar.gz
		rm $name.tar.gz
	fi
 done

 for di in /root/$a/*
 	do


		if [[ -f $di ]];then
			mkdir -p files
			target=$(basename $di)
			cp $di files/$target


		fi
 	done
	tar -czvf files.tar.gz files
	rm -r files
	gpg --batch --output files.tar.gz.gpg --passphrase $pass --symmetric files.tar.gz
	rm files.tar.gz
 #now we are in the folder which name is the current date -> so we need to cd .. 
 #and then compress the directory and encrypt it 
 cd ..
 tar -czvf $d.tar.gz $d
 gpg --batch --output $d.tar.gz.gpg --passphrase $pass --symmetric $d.tar.gz
 rm $d.tar.gz
 rm -r $d

}

function validate_restore_params(){
a=$1
b=$2
pass=$3
if [[ -z ${a} || -z ${b} || -z ${pass} ]];then
	echo -e 'you have to pass three parameters \n 1) a path to a folder you want to restore (exclude from the path /root/)\n 2) a path to the restore folder (exclude from the path /root/)\n 3)your password to open restore the folder'
fi

}


function restore(){
a=$1 #a folder inside the backup folder
b=$2 #restored
pass=$3

cd ~
cd $b  #entering the restoring folder
#rm -r * ->just for testing 
temp_file_name=$(echo $(basename $a) | sed s/.tar.gz.gpg//)
echo $temp_file_name
#mkdir $temp_file_name
#cd $temp_file_name
echo "decryting the whole folder by name $a"
new_name=$(echo $(basename $a) |sed s/.gpg//)
gpg --batch --output $new_name  --passphrase $pass --decrypt /root/$a
tar -xvf $new_name
rm -r $new_name
cd $temp_file_name
for di in /root/$b$temp_file_name/*
	do 
		if [[ -f $di || -d $di ]];then
		echo $di
			new_name=$(echo $(basename $di)|sed s/.gpg//)
			gpg --batch --output $new_name --passphrase $pass --decrypt $di
			rm -d $di
			echo $new_name
			tar -xvf $new_name
			rm -r $new_name
		fi
	done

}
