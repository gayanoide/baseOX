fx_version 'bodacious'
game 'gta5'
this_is_a_map 'yes'

author 'Map4All Interiors'
description 'Pillbox Hill Medical Center MLO'
version '1.0.1'
-- Fixed morque rm detail file colliding w/ world

files {
    'hedwig_pillbox_tc.xml'
}

data_file 'TIMECYCLEMOD_FILE' 'hedwig_pillbox_tc.xml'

file 'stream/basemap/ymt/pillbox_hill.ymt'

data_file 'SCENARIO_INFO_FILE' 'pillbox_hill.ymt'               
data_file 'SCENARIO_POINTS_PSO_FILE' 'pillbox_hill.ymt'        
data_file 'FIVEM_LOVES_YOU_A01627E3E5FC490A' 'pillbox_hill.ymt'      
data_file 'FIVEM_LOVES_YOU_399915A5EEB45A2B' 'pillbox_hill.ymt'      
data_file 'FIVEM_LOVES_YOU_A9E8B9F6EEB35186' 'pillbox_hill.ymt'       
data_file 'FIVEM_LOVES_YOU_DB4D236636684A3F' 'pillbox_hill.ymt'  

file 'stream/basemap/ymt/downtown.ymt'

data_file 'SCENARIO_INFO_FILE' 'downtown.ymt'               
data_file 'SCENARIO_POINTS_PSO_FILE' 'downtown.ymt'        
data_file 'FIVEM_LOVES_YOU_A01627E3E5FC490A' 'downtown.ymt'      
data_file 'FIVEM_LOVES_YOU_399915A5EEB45A2B' 'downtown.ymt'      
data_file 'FIVEM_LOVES_YOU_A9E8B9F6EEB35186' 'downtown.ymt'       
data_file 'FIVEM_LOVES_YOU_DB4D236636684A3F' 'downtown.ymt'  


escrow_ignore {
    'stream/basemap/meta/*.ymap',
    'stream/basemap/meta/*.ymf',
    'stream/basemap/ybn/*.ybn',
    'stream/basemap/ydr/*.ydr',
    'stream/basemap/ydr/*.ydd',
    'stream/basemap/ymf/*.ymt',
    'stream/basemap/ynv/*.ynv',
    
    'stream/custom/ytd/*.ytd'
}
dependency '/assetpacks'