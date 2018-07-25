#!/bin/bash                                                                                                 
                                                                                                            
                                                                                                            
FILE="$1"                                                                                          
                                                                                                            
                                                                                                            
ELEMENTS_COUNT=$(xmllint --xpath 'count(//checks/ping/node()/text())' $FILE)                                
echo $ELEMENTS_COUNT                                                                                         
                                                                                                            
for var in $(seq 1 $ELEMENTS_COUNT) do                                                                       
do                                                                                                          
    SITE_NAME=$(xmllint --xpath "name(//checks/ping/*[$var])" $FILE )                                                              
    SITE=$(xmllint --xpath "string(//checks/ping/*[$var]/text())" $FILE | cut -f 1 -d ":")                          
    ping -c1 $SITE 1>/dev/null 2>/dev/null                                                                           
    if [ $? -eq 0 ]                                                                                         
    then                                                                                                    
    echo "$SITE_NAME OK"
    else
    echo "$SITE_NAME KO"                                                                              
    fi                                                                                                                                                                                                             
done                                                                                               