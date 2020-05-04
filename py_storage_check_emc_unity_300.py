import json  
import pandas as pd  
import requests
import sys 
import os
import csv
from pprint import pprint
from py_storageDeclarations_emc_unity_300 import *

server_ip=sys.argv[1]
server_name=sys.argv[2]
check_time=sys.argv[3]
username=sys.argv[4]
password=sys.argv[5]
result_file=sys.argv[6]

def genericParser(server_ip,server_name,check_time,uri,field_list,module_name,cols):	
	api_url_base = 'https://'+server_ip
	headers = {'Content-Type': 'application/json',		'X-EMC-REST-CLIENT': 'true',	'Accept': 'application/json',					'compact':'true'}
	api_url = api_url_base+uri+"?fields="+",".join(field_list)
	response = requests.get(api_url,verify=False, headers=headers,auth=(username, password))
	raw_input=json.loads(response.text)
	normalized_data = pd.json_normalize(data = raw_input['entries'])
	df= normalized_data[list(normalized_data.columns[3:])]
	df.insert(0, 'object_group', module_name)
	df.insert(0, 'server_ip', server_ip)
	df.insert(0, 'server_name',server_name)
	df.insert(0, 'check_type', 'STORAGE')
	df.insert(0, 'check_time', check_time)	
	formatted_data=pd.DataFrame(df, columns = cols)
	#formatted_data.to_csv('outputfile_storage_'+server_name+'_'+check_time,mode='a', header=False,index=None)
	formatted_data.to_csv(result_file,mode='a', header=False,index=None)
	
					
genericParser(server_ip,server_name,check_time,BATTERY_URI,BATTERY,"BATTERY",BATTERY_COLS)
genericParser(server_ip,server_name,check_time,DISK_URI,DISK,"DISK",DISK_COLS)
genericParser(server_ip,server_name,check_time,POWER_SUPPLIES_URI,POWER_SUPPLIES,"POWER_SUPPLY",POWER_SUPPLIES_COLS)
genericParser(server_ip,server_name,check_time,MEMORY_MODULE_URI,MEMORY_MODULE,"MEMORY_MODULE",MEMORY_MODULE_COLS)
genericParser(server_ip,server_name,check_time,IO_MODULE_URI,IO_MODULE,"IO_MODULE",IO_MODULE_COLS)
genericParser(server_ip,server_name,check_time,HOST_URI,HOST,"HOSTS",HOST_COLS)
genericParser(server_ip,server_name,check_time,FANS_URI,FANS,"FANS",FANS_COLS)
genericParser(server_ip,server_name,check_time,SAS_PORT_URI,SAS_PORT,"SAS_PORTS;PORT_STATUS",SAS_PORT_COLS)
genericParser(server_ip,server_name,check_time,FCPORT_URI,FCPORT,"FCPORTS;PORT_STATUS",FCPORT_COLS)
genericParser(server_ip,server_name,check_time,ETHERNET_PORTS_URI,ETHERNET_PORTS,"ETHERNET_PORTS;PORT_STATUS",ETHERNET_PORTS_COLS)
genericParser(server_ip,server_name,check_time,LINK_CONTROL_CARDS_URI,LINK_CONTROL_CARDS,"LINK_CONTROL_CARDS",LINK_CONTROL_CARDS_COLS)
genericParser(server_ip,server_name,check_time,LUN_URI,LUN,"LUNS",LUN_COLS)
genericParser(server_ip,server_name,check_time,POOLS_URI,POOLS,"POOLS",POOLS_COLS)
genericParser(server_ip,server_name,check_time,DISK_PROCESSOR_ENCLOSURES_URI,DISK_PROCESSOR_ENCLOSURES,"DISK_PROCESSOR_ENCLOSURES",DISK_PROCESSOR_ENCLOSURES_COLS)
genericParser(server_ip,server_name,check_time,DISKGROUP_URI,DISKGROUP,"DISKGROUPS",DISKGROUP_COLS)
genericParser(server_ip,server_name,check_time,SSD_URI,SSD,"SSDS",SSD_COLS)
genericParser(server_ip,server_name,check_time,DISK_ARRAY_ENCLOSURES_URI,DISK_ARRAY_ENCLOSURES,"DISK_ARRAY_ENCLOSURES",DISK_ARRAY_ENCLOSURES_COLS)
genericParser(server_ip,server_name,check_time,STORAGE_PROCESSOR_URI,STORAGE_PROCESSOR,"STORAGE_PROCESSORS",STORAGE_PROCESSOR_COLS)
genericParser(server_ip,server_name,check_time,BASIC_SYSTEM_INFORMATION_URI,BASIC_SYSTEM_INFORMATION,"BASIC_SYSTEM_INFORMATION",BASIC_SYSTEM_INFORMATION_COLS)
genericParser(server_ip,server_name,check_time,RAID_GROUP_URI,RAID_GROUP,"RAID_GROUPS",RAID_GROUP_COLS)



