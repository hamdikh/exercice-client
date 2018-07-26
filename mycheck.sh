    #!/bin/bash                                                                                                 

    # Dependencies libxml2-utils     
    # To install them just use apt-get install libxml2-utils / yum install libxml2  

    ##
    ## Usage Function
    ##
    usage(){ 
        echo "Usage $0 sourcefile"
        exit 1
    } 

    # Pas de paramètre 
    [[ $# -lt 1 ]] && usage
                                                                                                                
    FILE="$1"                                                                                          
                                                                                                                

    # Count elements under ping node                                                                                                    
    ELEMENTS_COUNT=$(xmllint --xpath 'count(//checks/ping/node()/text())' $FILE)                                

    for (( var=1; var<=$ELEMENTS_COUNT; var++ ))                                                               
    do                      
        # extract element name under ping node                                                                                    
        SITE_NAME=$(xmllint --xpath "name(//checks/ping/*[$var])" $FILE )                  
        # extract element content under ping node                                              
        SITE=$(xmllint --xpath "string(//checks/ping/*[$var]/text())" $FILE | cut -f 1 -d ":")                          
        ping -c1 $SITE 1>/dev/null 2>/dev/null                                                                           
        if [ $? -eq 0 ]                                                                                         
        then                                                                                                    
            echo "$SITE_NAME OK"
        else
            echo "$SITE_NAME KO"                                                                              
        fi                                                                                                                                                                                                             
    done                                                                                               
