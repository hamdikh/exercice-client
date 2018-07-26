# exercice-client

Please write a program that reads a file with following information:

 

checks:

     ping:

          google: google.com:443

          mysite: gooassdfqsdfq.com:443

 

(It might be yaml, json, or any other text format of your choice, just keep the structure.)

 

A program shall checks connectivity to sites and shows an output similar to this:

 

./myceck.sh myinput

✔           google

✗           mysite

 

Context : rhel/centos 6/7, any language (bash, java, go, python rugy, erlang or any other language of your choice). Dependencies allowed but should be explicitly described.

Estimated time for execution : 15-20 minutes. Bonus points for code quality and a git repo with commit history.



Solution in mycheck script

To install dependencies ( xmllint ) you need to 
Centos/RHEL
yum -y install libxml2
Debian/Ubuntu
apt-get install libxml-utils


