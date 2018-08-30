#!/bin/bash

QAURL="http://devjira.cnvrmedia.net/rest/api/latest/issue/"
PRODURL="https://jira.cnvrmedia.net/rest/api/latest/issue/"


#USERNAME="INSERT"
#PASSWORD="COIN"
JIRAURL=$PRODURL

if [[ -z "$1" ]];
then
echo "Usage - $0 Summary | example $0 'host.com ipa error'"
else

parentid=SYSADMIN-3775
summary=$1
#read -p "Enter Username: " myusername
#echo -e "\n"
#read -s -p "Enter Password: " mypassword
#USERNAME=$myusername
#PASSWORD=$mypassword


task1=`cat  << EOF
{
    "fields":
  {
       "project":
       {
          "key": "SYSADMIN"
       },
       "parent":
       {
           "key": "$parentid"
       },
       "components":[{"name": "VM"}],
       "summary": "Dracs with Missing IPs: $summary",
       "description": "Dracs with Missing IPs: $summary",
       "issuetype": {
          "name": "SubTask"
       }
   }

}
EOF`

echo $task1 > task1.txt
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task1.txt -H "Content-Type: application/json" $JIRAURL
fi
