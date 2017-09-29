#!/bin/bash
function swap(){

echo  'User   Node  Swap,Gb'

for i in  cn001 cn002 cn003 cn004 cn005 cn006 cn007 cn008 cn009 cn010 cn011 cn012 cn013 cn014 cn015cn016 cn017 cn018 cn019 cn020 cn021 cn022 cn023 cn024 cn025 cn026 cn027 cn028 cn029 cn030 cn031 cn032cn033 cn034 cn035 cn036 cn037 cn038 cn039 cn040 cn041 cn042 cn043 cn044 cn045 cn046 cn047 cn048 cn049cn050 cn051 cn052 cn053 cn054 cn055 cn056 cn057 cn058 cn059 cn060 cn061 cn062 cn063 cn064 cn065 cn066cn067 cn068 cn069 cn070 cn071 cn072 cn073 cn074 cn075 cn076 cn077 cn078 cn079 cn080 cn081 cn082 cn083cn084 cn085 cn086 cn087 cn088 cn089 cn090 cn091 cn092 cn093 cn094 cn095 cn096 cn097 cn098 cn099 cn100ncn001 ncn002 ncn003 ncn004 ncn005 ncn006 ncn007 ncn008 ncn009 ncn010 ncn011 ncn012 gcn001 gcn002
do
    sw=$(ssh $i  "free -g | tail -1 " | awk '{print $3}' )
    us=$(sacct -N $i -o User | tail -3 | head -1)
    if [ $sw -ne 0 ]; then
        echo "$us $i  $sw "
    fi
done
}
