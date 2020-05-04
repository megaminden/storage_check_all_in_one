BATTERY=['health','needsReplacement','parent','slotNumber','name','manufacturer','model','firmwareVersion','emcPartNumber','emcSerialNumber','vendorPartNumber','vendorSerialNumber','parentStorageProcessor']
BATTERY_URI="/api/types/battery/instances"
BATTERY_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.emcPartNumber','content.emcSerialNumber']

DISK=['health','needsReplacement','parent','slotNumber','busId','name','manufacturer','model','version','emcPartNumber','emcSerialNumber','tierType','diskGroup','rpm','isSED','currentSpeed','maxSpeed','pool','isFastCacheInUse','size','rawSize','vendorSize','wwn','diskTechnology','parentDae','parentDpe']
DISK_URI="/api/types/disk/instances"
DISK_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.health.descriptionIds','content.size','content.diskTechnology','content.currentSpeed','content.slotNumber','content.needsReplacement','content.manufacturer','content.model','content.version','content.emcPartNumber','content.emcSerialNumber','content.rpm','content.isSED','content.maxSpeed','content.isFastCacheInUse','content.pool.id']

POWER_SUPPLIES=['id','health','needsReplacement','parent','slotNumber','name','manufacturer','model','firmwareVersion','emcSerialNumber','vendorPartNumber','vendorSerialNumber','emcPartNumber','parentDae','parentDpe']
POWER_SUPPLIES_URI="/api/types/powerSupply/instances"
POWER_SUPPLIES_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.emcSerialNumber','content.emcPartNumber']


HOST=['id','health','name','description','type','osType','hostUUID','lastPollTime','autoManageType','registrationType','hostContainer']
HOST_URI="/api/types/host/instances"
HOST_COLS=['check_time','check_type','server_name','server_ip','object_group','content.name','content.health.descriptionIds','content.type','content.autoManageType','content.description','content.osType']

FANS=['id','health','parent','slotNumber','emcPartNumber','emcSerialNumber','manufacturer','model','vendorPartNumber','vendorSerialNumber','needsReplacement','parentDpe']
FANS_URI="/api/types/fan/instances"
FANS_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.emcPartNumber','content.parent.resource','content.slotNumber','content.emcSerialNumber','content.manufacturer','content.model']

SAS_PORT=['id','health','needsReplacement','parent','name','port','currentSpeed','connectorType']
SAS_PORT_URI="/api/types/sasPort/instances"
SAS_PORT_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.connectorType','content.port','content.currentSpeed']

FCPORT=['id','health','parent','slotNumber','wwn','availableSpeeds','currentSpeed','requestedSpeed','sfpSupportedSpeeds','connectorType','needsReplacement','nPortId','name','parentIOModule']
FCPORT_URI="/api/types/fcPort/instances"
FCPORT_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.connectorType','content.slotNumber','content.currentSpeed']

ETHERNET_PORTS=['id','health','needsReplacement','name','portNumber','speed','mtu','connectorType','bond','macAddress','isRSSCapable','isRDMACapable','requestedSpeed','parentIOModule','supportedSpeeds','requestedMtu','supportedMtus','parent']
ETHERNET_PORTS_URI="/api/types/ethernetPort/instances"
ETHERNET_PORTS_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.connectorType','content.portNumber','content.speed']

LUN=['id','health','name','description','type','sizeTotal','sizeUsed','sizeAllocated','storageResource','pool','wwn','defaultNode','isReplicationDestination','currentNode','snapSchedule','isSnapSchedulePaused','metadataSize','metadataSizeAllocated','snapWwn','snapsSize','snapsSizeAllocated']
LUN_URI="/api/types/lun/instances"
LUN_COLS=['check_time','check_type','server_name','server_ip','object_group','content.name','content.health.descriptionIds','content.type','content.defaultNode','content.currentNode','content.description','content.sizeTotal','content.sizeAllocated','content.wwn','content.isReplicationDestination','content.isSnapSchedulePaused','content.metadataSize','content.metadataSizeAllocated','content.snapWwn','content.snapsSize','content.snapsSizeAllocated','content.storageResource.id','content.pool.id']

POOLS=['id','health','name','description','raidType','sizeFree','sizeTotal','sizeUsed','sizeSubscribed','alertThreshold','creationTime','isEmpty','isHarvestEnabled','harvestState','poolSpaceHarvestHighThreshold','poolSpaceHarvestLowThreshold','snapSpaceHarvestHighThreshold','snapSpaceHarvestLowThreshold','metadataSizeSubscribed','snapSizeSubscribed','metadataSizeUsed','snapSizeUsed','rebalanceProgress']
POOLS_URI="/api/types/pool/instances"
POOLS_COLS=['check_time','check_type','server_name','server_ip','object_group','content.name','content.health.descriptionIds','content.description','content.raidType','content.harvestState','content.sizeFree','content.sizeTotal','content.sizeUsed','content.sizeSubscribed','content.alertThreshold','content.creationTime','content.isEmpty','content.isHarvestEnabled','content.poolSpaceHarvestHighThreshold','content.poolSpaceHarvestLowThreshold','content.snapSpaceHarvestHighThreshold','content.snapSpaceHarvestLowThreshold','content.metadataSizeSubscribed','content.snapSizeSubscribed','content.metadataSizeUsed','content.snapSizeUsed']

DISKGROUP=['id','name','emcPartNumber','tierType','diskTechnology','diskSize','advertisedSize','rpm','speed','totalDisks','minHotSpareCandidates','hotSparePolicyStatus','unconfiguredDisks']
DISKGROUP_URI="/api/types/diskGroup/instances"
DISKGROUP_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.tierType','content.diskTechnology','content.hotSparePolicyStatus','content.emcPartNumber','content.diskSize','content.advertisedSize','content.rpm','content.speed','content.totalDisks','content.minHotSpareCandidates','content.unconfiguredDisks']

SSD=['id','health','needsReplacement','parent','slotNumber','name','manufacturer','model','firmwareVersion','emcPartNumber','emcSerialNumber','vendorPartNumber','vendorSerialNumber']
SSD_URI="/api/types/ssd/instances"
SSD_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.firmwareVersion','content.emcPartNumber','content.emcSerialNumber']

DISK_ARRAY_ENCLOSURES=['id','health','needsReplacement','parent','slotNumber','name','manufacturer','model','emcPartNumber','emcSerialNumber','vendorPartNumber','vendorSerialNumber','enclosureType','busId','driveTypes','currentPower','avgPower','maxPower','currentTemperature','avgTemperature','maxTemperature','currentSpeed','maxSpeed']
DISK_ARRAY_ENCLOSURES_URI="/api/types/dae/instances"
DISK_ARRAY_ENCLOSURES_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.emcPartNumber','content.emcSerialNumber','content.busId','content.currentPower','content.avgPower','content.maxPower','content.currentTemperature','content.avgTemperature','content.maxTemperature','content.currentSpeed','content.maxSpeed']

DISK_PROCESSOR_ENCLOSURES=['id','health','needsReplacement','parent','slotNumber','name','manufacturer','model','emcPartNumber','emcSerialNumber','vendorPartNumber','vendorSerialNumber','enclosureType','busId','driveTypes','currentPower','avgPower','maxPower','currentTemperature','avgTemperature','maxTemperature','currentSpeed','maxSpeed','parentSystem']
DISK_PROCESSOR_ENCLOSURES_URI="/api/types/dpe/instances"
DISK_PROCESSOR_ENCLOSURES_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.emcPartNumber','content.emcSerialNumber','content.busId','content.currentPower','content.avgPower','content.maxPower','content.currentTemperature','content.avgTemperature','content.maxTemperature','content.currentSpeed','content.maxSpeed']

STORAGE_PROCESSOR=['id','health','parent','needsReplacement','isRescueMode','model','slotNumber','name','emcPartNumber','emcSerialNumber','manufacturer','vendorPartNumber','vendorSerialNumber','sasExpanderVersion','biosFirmwareRevision','postFirmwareRevision','memorySize','parentDpe']
STORAGE_PROCESSOR_URI="/api/types/storageProcessor/instances"
STORAGE_PROCESSOR_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.emcPartNumber','content.emcSerialNumber','content.memorySize','content.isRescueMode']

LINK_CONTROL_CARDS=['id','health','needsReplacement','parent','slotNumber','name','manufacturer','model','emcPartNumber','emcSerialNumber','vendorPartNumber','vendorSerialNumber','currentSpeed','maxSpeed','parentDae']
LINK_CONTROL_CARDS_URI="/api/types/lcc/instances"
LINK_CONTROL_CARDS_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.emcPartNumber','content.emcSerialNumber','content.currentSpeed','content.maxSpeed']

MEMORY_MODULE=['id','health','needsReplacement','parent','slotNumber','name','manufacturer','model','firmwareVersion','size','emcPartNumber','emcSerialNumber','vendorPartNumber','vendorSerialNumber','parentStorageProcessor']
MEMORY_MODULE_URI="/api/types/memoryModule/instances"
MEMORY_MODULE_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.emcPartNumber','content.emcSerialNumber','content.size','content.firmwareVersion']

IO_MODULE=['id','health','needsReplacement','parent','slotNumber','name','manufacturer','model','emcPartNumber','emcSerialNumber','vendorPartNumber','vendorSerialNumber','systemName','parentStorageProcessor']
IO_MODULE_URI="/api/types/ioModule/instances"
IO_MODULE_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.name','content.health.descriptionIds','content.needsReplacement','content.slotNumber','content.manufacturer','content.model','content.emcPartNumber','content.emcSerialNumber']

BASIC_SYSTEM_INFORMATION=['id','model','name','softwareVersion','earliestApiVersion']
BASIC_SYSTEM_INFORMATION_URI="/api/types/basicSystemInfo/instances"
BASIC_SYSTEM_INFORMATION_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.model','content.name','content.softwareVersion','content.apiVersion','content.earliestApiVersion']

RAID_GROUP=['id','health','type','name','description','wwn','sizeTotal','tierType','pool','diskGroup','raidType','stripeWidth','parityDisks']
RAID_GROUP_URI="/api/types/raidGroup/instances"
RAID_GROUP_COLS=['check_time','check_type','server_name','server_ip','object_group','content.id','content.health.descriptionIds','content.type','content.raidType','content.diskGroup.id','content.sizeTotal','content.tierType','content.stripeWidth','content.type','content.tierType','content.raidType','content.stripeWidth','content.wwn','content.parityDisks','content.pool.id']
