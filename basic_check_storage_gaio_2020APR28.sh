#!/bin/bash
#script version is basic_check_storage_gaio_2020MAR07

cd `dirname $0`
storage_name=''
check_hour=`date +'%Y%m%d%H'`
log_time=`date +'%Y%m%d%H%M%S'`
wd='/home/hardware'                                    ###Script Home directory with log and output dirs inside
inputfile=$wd/storage_list                             ### Storage IP and Password Configuration Files. Check storage version
naviseccli='/opt/Navisphere/bin/naviseccli'            ###VNXE CONFIGURATION on the script server
python3_exe='/miniconda3/bin/python3'                  ###Python 3 CONFIGURATION required for some sub scripts to parse xml from EMC VNXe web api
log_file=$wd/log/storage.log

#################################################IBM_V7000 STORAGE CHECK ##################################################
########################################################################################################################################
function callIBM_V_7000_Interface(){
	storage_ip=$2
	storage_name=$1
	storage_brand=$3
	storage_version=$4
	username=$5
	password=$6
	remote_ip=$7
	check_hour=$8
	log_time=$9
	log_file=$10
	#outputfile="$11"
	echo "THIS IS THE USERNAME " $username
	echo "THIS IS THE password " $password
	echo ${log_time} ${storage_name} " --- Check STARTED" >> $log_file
	result='' 
	
	function checkIBM_V_7000_Processor(){		
	
		if [[  $2 == "DISKS"  ]]
			then 
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsdrive -delim ';' " < /dev/null | grep -v "id;" )		
		elif [[ $2 == "POOLS" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsmdiskgrp -delim ';' " < /dev/null | grep -v "id;name"  )	
		elif [[ $2 == "VOLUMES" ]]
		then
			result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsvdisk -delim ';' " < /dev/null | grep -v "id;name"  )			
		elif [[ $2 == "HOSTS" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lshost -delim ';' " < /dev/null | grep -v "id;name"  )			
		elif [[ $2 == "SASPORT" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsportsas -delim ';' " < /dev/null | grep -v "id;"  )	
		elif [[ $2 == "SCSIPORT" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsportip  -delim ';' " < /dev/null | grep -v "id;"  )	
		elif [[ $2 == "FCPORT" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsportfc -delim ';' " < /dev/null | grep -v "remote_wwpn"  )
		elif [[ $2 == "POWER_SUPPLIES" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsenclosurepsu -delim ';' " < /dev/null | grep -v "id;PS"  )	
		elif [[ $2 == "FANS" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsenclosurefanmodule -delim ';' " < /dev/null | grep -v "id;fan"  )				
		elif [[ $2 == "ENCLOSURE_CANISTER" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${1}" "lsenclosurecanister -delim ';' " < /dev/null | grep -v "id;can" )	
		elif [[ $2 == "ENCLOSURE" ]]
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsenclosure -delim ';' " < /dev/null | grep -v "id;" )	
		elif [[ $2 == "BATTERY" ]] 
			then
				result1=$(sshpass -p $password ssh -t -t -n "$username"@"${storage_ip}" "lsenclosurebattery -delim ';' " < /dev/null  | grep -v "id;" )			
		else 
			echo "ERROR DISK ITEM NOT DEFINED"
		fi
	
echo "$result1" | tr -d '\r'| while read mydata
		do
			printf "%s%s%s%s%s" "${check_hour};"STORAGE";$3;$1;$2;"
			value1=`echo $mydata | cut -d ";" -f1`
			value2=`echo $mydata | cut -d ";" -f2`
			value3=`echo $mydata | cut -d ";" -f3`
			value4=`echo $mydata | cut -d ";" -f4`
			value5=`echo $mydata | cut -d ";" -f5`
			value6=`echo $mydata | cut -d ";" -f6`
			value7=`echo $mydata | cut -d ";" -f7`
			value8=`echo $mydata | cut -d ";" -f8`
			value9=`echo $mydata | cut -d ";" -f9`
			value10=`echo $mydata | cut -d ";" -f10`
			value11=`echo $mydata | cut -d ";" -f11`
			value12=`echo $mydata | cut -d ";" -f12`
			value13=`echo $mydata | cut -d ";" -f13`
			value14=`echo $mydata | cut -d ";" -f14`
			value15=`echo $mydata | cut -d ";" -f15`
			value16=`echo $mydata | cut -d ";" -f16`
			value17=`echo $mydata | cut -d ";" -f17`
			value18=`echo $mydata | cut -d ";" -f18`
			value19=`echo $mydata | cut -d ";" -f19`
			value20=`echo $mydata | cut -d ";" -f20`
			value21=`echo $mydata | cut -d ";" -f21`
			value22=`echo $mydata | cut -d ";" -f22`
			value23=`echo $mydata | cut -d ";" -f23`
			value24=`echo $mydata | cut -d ";" -f24`
			value25=`echo $mydata | cut -d ";" -f25`
			
			if [[ $2 == "POOLS" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value2;$value3;$value7;$value5;$value3;$value11;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14"
			elif [[ $2 == "VOLUMES" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value2;$value5;$value7;$value5;$value3;$value11;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14"			
			elif [[ $2 == "HOSTS" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value2;$value5;$value7;$value5;$value3;$value11;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14"		
			elif [[ $2 == "SASPORT" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value4_$value1_$value2;$value4_$value1_$value2;$value7;$value11;$value4;$value5;$value12;$value8;$value9;$value10;$value11;$value12;$value13;$value14"
			elif [[ $2 == "SCSIPORT" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value3_$value1_$value2;$value3_$value1_$value2;$value12;$value11;$value4;$value5;$value12;$value8;$value9;$value10;$value11;$value12;$value13;$value14"
			elif [[ $2 == "FCPORT" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value1_$value2_$value3;$value1_$value2_$value3;$value10;$value11;$value4;$value5;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14"
			elif [[ $2 == "POWER_SUPPLIES" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value1_$value2;$value1_$value2;$value3;$value5;$value3;$value11;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14"
			elif [[ $2 == "FANS" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value1_$value2;$value1_$value2;$value3;$value5;$value3;$value11;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14"
			elif [[ $2 == "ENCLOSURE_CANISTER" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value1_$value2;$value5_$value1_$value1;$value3;$value5;$value3;$value11;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14" 
			elif [[ $2 == "ENCLOSURE" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value1;$value3_$value1;$value2;$value5;$value3;$value11;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14" 
		    elif [[ $2 == "BATTERY" ]] 
			#### Use this description when troubleshooting from basic_cheques table
			#### Description is enclosure_id and battery_id (combined):status:recondition_needed:charging_status:percent_charged:end_of_life_warning
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value1_$value2;$value3;$value5;$value4;$value6;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14"
			elif [[ $2 == "DISKS" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value8;$value2;$value6;$value5;$value3;$value11;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14" 				
			else 
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value1;$value2;$value3;$value4;$value5;$value6;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14" 
			fi
				echo ""
		done
	}

	declare -a showCommand=("DISKS" "POOLS" "VOLUMES" "HOSTS" "SASPORT" "SCSIPORT" "FCPORT" "POWER_SUPPLIES" "FANS" "ENCLOSURE_CANISTER" "ENCLOSURE" "BATTERY")
	cd $wd
	
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[0]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[1]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[2]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[3]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[4]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[5]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[6]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[7]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[8]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[9]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[10]}" $storage_name $username $password $outputfile
	checkIBM_V_7000_Processor "$storage_ip" "${showCommand[11]}" $storage_name $username $password $outputfile	
	echo ${log_time} ${storage_name} " -Check COMMPLETED" >> $log_file
}


#############################################################EMC STORAGE CHECK##########################################################
############################################################EMC UNITY 300###############################################################
function checkEMC_Unity_300_Interface(){
	storage_name=$1
	storage_ip=$2
	storage_brand=$3
	storage_version=$4
	username="$5"
	password=$6
	remote_ip=$7
	check_hour=$8
	log_time=$9
	log_file="$10"
	outputfile="$11"
	echo ${log_time} "Started" ${storage_name} >> ${log_file} 
	${python3_exe} $wd/py_storage_check_emc_unity_300.py ${storage_ip} ${storage_name} ${check_hour} ${username} ${password} ${outputfile} 
	cat $outputfile | sed 's/\,/\;/g' | sed 's/\]//g' | sed "s/'//g" |sed "s/\[//g" # > $outputfile.csv
	echo ${log_time} "Finished EMC" ${storage_name} >> ${log_file} 
}

#############################################################EMC VNX STORAGE ###########################################################
function checkEMC_VNXe_Interface(){
	storage_name=$1
	storage_ip=$2
	storage_brand=$3
	storage_version=$4
	username="$5"
	password=$6
	remote_ip=$7
	check_hour=$8
	log_time=$9
	log_file="$10"
	outputfile="$11"
	details=`echo ${check_hour} ";STORAGE;" $storage_name ";" $storage_ip";"`
	
	echo ${log_time} ":Started:" ${storage_name} >> ${log_file}
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getcontrol -arv -busy -cbt -date -day -flush -idle -read -rw -sc -sf -sl -time -write | grep ":" | awk -F ":" '{print $1 ";" $2}'| awk -v prefix="$details" '{print prefix "CONTROL STATUS;" $0}' # >> $outpufile
	####FANS###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getcrus -fana -fanb -fanc -fand -fane | grep ":" |grep -v "Disk"| awk -F ":" '{print $1 ";" $2}'| awk -v prefix="$details" '{print prefix "FANS;" $0}' # >> $outpufile
	#####DISK###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getdisk -state -capacity -drivetype -product  -usercapacity -serial -speeds -hs -lun | awk -F":" 'BEGIN{a=""} !/:/{if (a != "") print a; a=$0; next} {gsub(/^ +| +$/,"",$2);  a=a";"$2} END{print a}'|grep -v ^$ | awk -v prefix="$details" '{print prefix "DISKS;" $0}' # >> $outpufile
	#####MEMORY###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getcrus -dimma -dimmb | grep ":" | awk -F ":" '{print $1 ";" $2}'|awk -v prefix="$details" '{print prefix "MEMORY;" $0}' # >> $outpufile
	#####CPU###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getcrus  -cpua -cpub  | grep ":" | awk -F ":" '{print $1 ";" $2}' | awk -v prefix="$details" '{print prefix "CPU;" $0}' # >> $outpufile
	#####IO_MODULE###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getcrus -ioa -iob | grep ":" | awk -F ":" '{print ";" $1 ";" $2}' | awk -v prefix="$details" '{print prefix "IOMODULES" $0}' #>> $outpufile
	#####LINK_CONTROL_CARD###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getcrus  -lcca -lccb -speeds | grep ":" | grep ^"B" | awk -F ":" '{print $1 ";" $2}' | awk -v prefix="$details" '{print prefix "SPEEDS;" $0}' #>> $outpufile
	#####BASEBOARD SP AND MANAGEMENT BOARD###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getcrus -spa -spb -bbua -bbub -mgmta -mgmtb -bma -bmb | grep ":" | awk -F ":" '{print $1 ";" $2}' | awk -v prefix="$details" '{print prefix "BASEBOARD;" $0}'  #>> $outpufile  
	#####LOOP###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getloop | grep ":" | awk -F ":" '{print $1 ";" $2}'  | awk -v prefix="$details" '{print prefix "LOOP;" $0}'# >> $outpufile
	#####LUN###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 getlun -name  -state -capacity  | sed 's/Name/Name\:/g'| awk -F":" 'BEGIN{a=""} !/:/{if (a != "") print a; a=$0; next} {gsub(/^ +| +$/,"",$2);  a=a";"$2} END{print a}'|grep -v ^$ | sed 's/LOGICAL UNIT NUMBER//g' | awk -v prefix="$details" '{print prefix "LUN;" $0}' # >> $outpufile
	#####IOPORTS###
	$naviseccli -h $storage_ip -User $username -Password $password -scope 0 ioportconfig -list -iomodule "basemodule" -all |grep -v ^$|grep -v "Infor" | sed 's/SP ID\:/SP ID/g'| awk -F":" 'BEGIN{a=""} !/:/{if (a != "") print a; a=$0; next} {gsub(/^ +| +$/,"",$2);  a=a";"$2} END{print a}' | awk -v prefix="$details" '{print prefix "IOPORTS" $0}' # >> $outpufile
	echo ${log_time} ":Finished Processing: " ${storage_name} >> ${log_file}
	exit;
}

#################################################FUJITSU DX 600 AND 100 STORAGE CHECK ##################################################
########################################################################################################################################
function callFujitsu_DX_600_100_Interface(){
	storage_name=$1
	storage_ip=$2
	storage_brand=$3
	storage_version=$4
	username=$5
	password=$6
	remote_ip=$7
	check_hour=$8
	log_time=$9
	log_file="$10"
	outputfile="$11"
	echo ${log_time} "Fujitsu Check STARTED" >> $log_file
	result='' 
	
	function checkFujitsu_DX_600_100_Processor(){
		
		if [[ $1 == "172.17.141.199" && $2 == "DISKS"  ]]
			then 
			result1=$(sshpass -p $password ssh -t -t  -n "$username"@"${1}" "show disks" < /dev/null | grep -v "CLI" | awk 'NR==2{FB[1]=1; for(i=2;i<=NF;i++){FB[i]=FB[i-1]+index(substr($0,FB[i-1])," "$i); FL[i-1]=FB[i]-FB[i-1]} FL[NF]=length($0)-FB[NF]+1} NR>=2{ res=""; for(i=1;i<=length(FL);i++){	a=substr($0,FB[i],FL[i]); gsub(/^ *| *$/,"",a); if (a != "") FIL[i]=a; res=res""FIL[i]";" } print res }'| grep -v "Location;Status" )
		elif [[ $2 == "ENCLOSURE-STATUS" ]]
			then
			result1=$(sshpass -p $password ssh -t -t  -n  "$username"@"${1}" "show" "${2}" < /dev/null | grep -v ^$ |grep -v "^Enclosure" | awk -F '[' '/\[/ {gsub(/^ *| *$/,"",$1);  gsub(/^ *|] *$/,"",$2); print $1";"$2}' | sed 's/\]//g')
		elif [[ $2 == "FRU-CE" || $2 == "FRU-DE" ]]
			then
			result1=$(sshpass -p $password ssh -t -t  -n "$username"@"${1}" "show" "${2}" < /dev/null | awk 'substr($0,1,1) != " " { pos=0; part=""; for(i=1;i<=NF;i++) {if (index($i,"#")>0) pos=i} for(i=1; i<=pos;i++){part=part"_"$i} part=substr(part,2); next }gsub(/\[/,"[") != 1 {next} { gsub(/^ *| *\[| *].*$/,";",$0); if (part=="") gsub(/^;/,""); print part""$0 }')
		else 
			result1=$(sshpass -p $password ssh  -t -t  -n "$username"@"${1}" "show" "${2}" < /dev/null |grep -v "^CLI"|grep -v ^$| awk '/^-/,0' | awk 'NR==1{FB[1]=1; for(i=2;i<=NF;i++){FB[i]=FB[i-1]+index(substr($0,FB[i-1])," "$i); FL[i-1]=FB[i]-FB[i-1]} FL[NF]=length($0)-FB[NF]+1};NR>=2{ res=""; for(i=1;i<=length(FL);i++){	a=substr($0,FB[i],FL[i]); gsub(/^ *| *$/,"",a); if (a != "") FIL[i]=a; res=res""FIL[i]";" } print res }')
		fi

		echo "$result1" | tr -d '\r'| while read mydata
		do
			printf "%s%s%s%s%s" "${check_hour};"STORAGE";$3;$1;$2;"
			value1=`echo $mydata | cut -d ";" -f1`
			value2=`echo $mydata | cut -d ";" -f2`
			value3=`echo $mydata | cut -d ";" -f3`
			value4=`echo $mydata | cut -d ";" -f4`
			value5=`echo $mydata | cut -d ";" -f5`
			value6=`echo $mydata | cut -d ";" -f6`
			value7=`echo $mydata | cut -d ";" -f7`
			value8=`echo $mydata | cut -d ";" -f8`
			value9=`echo $mydata | cut -d ";" -f9`
			value10=`echo $mydata | cut -d ";" -f10`
			value11=`echo $mydata | cut -d ";" -f11`
			value12=`echo $mydata | cut -d ";" -f12`
			value13=`echo $mydata | cut -d ";" -f13`
			value14=`echo $mydata | cut -d ";" -f14`
			if [[ $2 == "VOLUMES" ]]
			then 
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value2;$value3;$value1;$value4;$value5;$value6;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14" 
			elif [[ $2 == "DISK-ERROR" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value2;$value3;$value4;$value5;$value6;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14" 
			elif [[ $2 == "RAID-GROUPS" ]]
			then
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value2;$value5;$value3;$value1;$value4;$value6;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14" 
			else 
				printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s" "$value1;$value2;$value3;$value4;$value5;$value6;$value7;$value8;$value9;$value10;$value11;$value12;$value13;$value14" 
			fi
			echo ""
		done
	}

	declare -a showCommand=("VOLUMES" "DISK-ERROR" "PORT-ERROR" "RAID-GROUPS" "DISKS" "ENCLOSURE-STATUS" "FRU-CE" "FRU-DE" )
	cd $wd
	storage_name=$(sshpass -p $password ssh -t -t -n  "$username"@"$storage_ip" "show storage-system-name" < /dev/null | grep "Name" | sed 's/\[//g'| sed 's/\]//g'| tr -d '\r'| awk '{print $2}')

	checkFujitsu_DX_600_100_Processor "$storage_ip" ${showCommand[0]} cc $username $password $outputfile
	checkFujitsu_DX_600_100_Processor "$storage_ip" ${showCommand[1]} $storage_name $username $password $outputfile
	checkFujitsu_DX_600_100_Processor "$storage_ip" ${showCommand[2]} $storage_name $username $password $outputfile
	checkFujitsu_DX_600_100_Processor "$storage_ip" ${showCommand[3]} $storage_name $username $password $outputfile
	checkFujitsu_DX_600_100_Processor "$storage_ip" ${showCommand[4]} $storage_name $username $password $outputfile
	checkFujitsu_DX_600_100_Processor "$storage_ip" ${showCommand[5]} $storage_name $username $password $outputfile
	checkFujitsu_DX_600_100_Processor "$storage_ip" ${showCommand[6]} $storage_name $username $password $outputfile
	checkFujitsu_DX_600_100_Processor "$storage_ip" ${showCommand[7]} $storage_name $username $password $outputfile
	echo ${log_time} " :" $storage_name " Storage Check COMMPLETED" >> $log_file
}


#############################################################HP 7200 STORAGE CHECK #####################################################
########################################################################################################################################
function callHP_7200_Interface(){ #Pass  storage_name,storage_ip and username
	storage_name=$1
	storage_ip=$2
	storage_brand=$3
	storage_version=$4
	username="$5"
	password=$6
	remote_ip=$7
	check_hour=$8
	log_time=$9
	log_file="$10"
	outputfile="$11"

	report_printer (){
		cat $1 | grep -v total| grep -v ^"-" | sed 's/\s\+/;/g' | sed 's/^;//' | awk -F ";" '{print $1";"$2";"$3";"$4";"$5";"$6";"$7";"$8";"$9";"$10";"$11";"$12";"$13";"$14}' | grep -v ^";"| awk -v storage_ip="$formatted_server_details" '{print storage_ip";"$0}';
	
}
	echo ${log_time} "Started" ${storage_name} >> ${log_file}
	
	#DISK Status
	check_type="DISKS"
	formatted_server_details=$check_hour";STORAGE;"$storage_name";"$storage_ip";"$check_type
	ssh -n $username@"$storage_ip" showpd -showcols CagePos,Detailed_State,Size_MB,Type,RPM,Nrm_Used_OK,State |grep -v total| grep -v CagePos |  grep -v Id | grep -v ^"-" | report_printer 
	
	#Volumes / Luns Status
	check_type="VOLUME"
	formatted_server_details=$check_hour";STORAGE;"$storage_name";"$storage_ip";"$check_type
	ssh -n $username@"$storage_ip" showvlun -showcols VVName,Status,ID,Type |grep -v ^total |grep -v ^"Active VLUN" |  grep -v ^VVName |grep -v '\-\-\-' | grep -v ^"VLUN Templates" | report_printer 
	
	#Battery Status
	check_type="BATTERY"
	formatted_server_details=$check_hour";STORAGE;"$storage_name";"$storage_ip";"$check_type
	ssh -n $username@"$storage_ip" showbattery -showcols Bat,Detailed_State,Charge_Level,Charge_State,ExpDate|grep -v '\-\-\-' | grep -v ^"Bat" |head -n -1| report_printer 

    #Power Supply Status
	check_type="PS-ACState"
	formatted_server_details=$check_hour";STORAGE;"$storage_name";"$storage_ip";"$check_type
	ssh -n $username@"$storage_ip" shownode -ps -showcols PS,ACState |grep -v Node |grep -v "ACState" | head -n -1|  report_printer # >> outputfile
	check_type="PS-DCState"
	formatted_server_details=$check_hour";STORAGE;"$storage_name";"$storage_ip";"$check_type
	ssh -n $username@"$storage_ip" shownode -ps -showcols PS,DCState |grep -v Node |grep -v "DCState" | head -n -1|  report_printer 
	
	check_type="PS-PSState"
	formatted_server_details=$check_hour";STORAGE;"$storage_name";"$storage_ip";"$check_type
	ssh -n $username@"$storage_ip" shownode -ps -showcols PS,PSState |grep -v Node |grep -v "PSState" | head -n -1|  report_printer
	
	#Enclosure Status
	check_type="ENCLOSURE_STATUS"
	formatted_server_details=$check_hour";STORAGE;"$storage_name";"$storage_ip";"$check_type
	ssh -n $username@$storage_ip shownode -showcols Node,State|grep -v Node | report_printer 
	
	#Ports Status
	check_type="PORTS;PORT;PORT_STATUS"
	formatted_server_details=$check_hour";STORAGE;"$storage_name";"$storage_ip";"$check_type
	ssh -n $username@"$storage_ip" showport -sfp |grep -v ^N | head -n -1| report_printer 
	
	echo ${log_time} "Finished" ${storage_name} >> ${log_file}
	exit;
}


########################################################################################################################################
#################################################MAIN PROGRAM TO CALL STORAGE FUNCTIONS#################################################
########################################################################################################################################
if [ ! -f $inputfile ]; then echo file $inputfile not found; exit; fi

cat $inputfile | grep -v "###" | grep -v ^$ | while read  mydata
do
	storage_name=`echo $mydata | cut -d "|" -f1`
	storage_ip=`echo $mydata | cut -d "|" -f2`
	storage_brand=`echo $mydata | cut -d "|" -f3`
	storage_version=`echo $mydata | cut -d "|" -f4`
	username=`echo $mydata | cut -d "|" -f5`
	password=`echo $mydata | cut -d "|" -f6`
	remote_ip=`echo $mydata | cut -d "|" -f7`
	check_hour=`date +'%Y%m%d%H'`
	log_time=`date +'%Y%m%d%H%M%S'`
	log_file=$wd/log/storage.log
	outputfile=$wd/output/outputfile_storage_${storage_name}_${check_hour}.csv
	
	########################################Process all storage which need remote connection #######################################
	####################################No direct connection between storage & report server #######################################
	if [[ "$remote_ip" != "N/A" ]]; then
		if [[ $storage_brand == "FUJITSU" ]];then
			ssh -n root@"$remote_ip" "$(typeset -f callFujitsu_DX_600_100_Interface);callFujitsu_DX_600_100_Interface "$storage_name" "$storage_ip" "$storage_brand" "$storage_version" "$username" "$password" "$remote_ip" "$check_hour" "$log_time" "$log_file" ${outputfile}"  >> $outputfile
		elif [[ $storage_brand == "HP" ]];then
			ssh -n root@"$remote_ip" "$(typeset -f callHP_7200_Interface);callHP_7200_Interface "$storage_name" "$storage_ip" "$storage_brand" "$storage_version" "$username" "$password" "$remote_ip" "$check_hour" "$log_time" "$log_file" ${outputfile}"  >> $outputfile
		elif [[ $storage_brand == "IBM" ]];then
			ssh -n root@"$remote_ip" "$(typeset -f callIBM_V_7000_Interface);callIBM_V_7000_Interface "$storage_name" "$storage_ip" "$storage_brand" "$storage_version" "$username" "$password" "$remote_ip" "$check_hour" "$log_time" "$log_file" ${outputfile}"  >> $outputfile
		elif [[ $storage_brand =~ "EMC" ]]; then
			if [[ $storage_version =~ "UNITY_300" ]]; then
				ssh -n root@"$remote_ip" "$(typeset -f checkEMC_Unity_300_Interface);checkEMC_Unity_300_Interface "$storage_name" "$storage_ip" "$storage_brand" "$storage_version" "$username" "$password" "$remote_ip" "$check_hour" "$log_time" "$log_file" ${outputfile}"  >> $outputfile
			elif [[ $storage_version =~ "VNXe" ]]; then
				ssh -n root@"$remote_ip" "$(typeset -f checkEMC_VNXe_Interface);checkEMC_VNXe_Interface "$storage_name" "$storage_ip" "$storage_brand" "$storage_version" "$username" "$password" "$remote_ip" "$check_hour" "$log_time" "$log_file" ${outputfile}"  >> $outputfile
			else
				echo $storage_ip ": STOR_ERROR_001C: STORAGE VERSION OPTION NOT FOUND" >> ${log_file}
			fi				
		else
			echo $storage_ip ": STOR_ERROR_001A: STORAGE IP IS REMOTE ACCESSIBLE  BUT OPTION IS NOT DEFINED" >> ${log_file}
		fi
	########################################Process all storage by storage brand then storage version#################################		
	elif [[ $storage_brand =~ "FUJITSU" &&  $remote_ip == "N/A" ]];then
		callFujitsu_DX_600_100_Interface $storage_name $storage_ip $storage_brand $storage_version $username $password $remote_ip $check_hour $log_time "$log_file"  $outputfile  >> $outputfile 
	elif [[ $storage_brand == "HP" ]];then
		callHP_7200_Interface $storage_name $storage_ip $storage_brand $storage_version $username $password $remote_ip $check_hour $log_time "$log_file"  $outputfile  >> $outputfile
	elif [[ $storage_brand == "IBM" ]];then
		callIBM_V_7000_Interface $storage_name $storage_ip $storage_brand $storage_version $username $password $remote_ip $check_hour $log_time "$log_file"  $outputfile  >> $outputfile
	elif [[ $storage_brand =~ "EMC" ]]; then
		if [[ $storage_version =~ "UNITY_300" ]]; then
			checkEMC_Unity_300_Interface $storage_name $storage_ip $storage_brand $storage_version $username $password $remote_ip $check_hour $log_time "$log_file" "$outputfile"  >> $outputfile
		elif [[ $storage_version =~ "VNXe" ]]; then
			checkEMC_VNXe_Interface $storage_name $storage_ip $storage_brand $storage_version $username $password $remote_ip $check_hour $log_time "$log_file" "$outputfile"  >> $outputfile
		else
			echo $storage_ip ": STOR_ERROR_001C: STORAGE VERSION OPTION NOT FOUND" >> ${log_file}
		fi
	else
		echo $storage_ip ": STOR_ERROR_001B: STORAGE OPTION IS NOT DEFINED" >> ${log_file}
	fi 
done	




