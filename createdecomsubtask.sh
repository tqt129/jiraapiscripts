#!/bin/bash

QAURL="http://devjira.cnvrmedia.net/rest/api/latest/issue/"
PRODURL="https://jira.cnvrmedia.net/rest/api/latest/issue/"


#USERNAME="INSERT"
#PASSWORD="COIN"
JIRAURL=$PRODURL

if [[ -z "$1" ]];
then
echo "Usage - $0 Master-ticket | example $0 'SYSADMIN-0101'"
else 

parentid=$1
read -p "Enter Master Ticket Summary: " summary
echo -e "\n"
read -p "Enter Username: " myusername
echo -e "\n"
read -s -p "Enter Password: " mypassword
USERNAME=$myusername
PASSWORD=$mypassword

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
       "components":[{"name": "Inventory"}],
       "summary": "$summary Schedule Downtime in Nagios",
       "description": "$summary Schedule Downtime in Nagios ",
       "issuetype": {
          "name": "SubTask"
       }
   }

}
EOF`

task2=`cat  << EOF
{
    "fields": {
       "project":
       {
          "key": "SYSADMIN"
       },
       "parent":
       {
           "key": "$parentid"
       },
       "components":[{"name": "Inventory"}],
       "summary": "$summary Shutdown Host(s)",
       "description": "$summary Shutdown server using DRAC for CNVR or Run decomm.sh for CRM/ESG",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task3=`cat  << EOF
{
    "fields": {
       "project":
       {
          "key": "SYSADMIN"
       },
       "parent":
       {
           "key": "$parentid"
       },
       "components":[{"name": "Inventory"}],
       "summary": "$summary Remove DNS",
       "description": "$summary Remove all DNS records",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task4=`cat  << EOF
{
    "fields": {
       "project":
       { 
          "key": "SYSADMIN"
       },
       "parent":
       {
           "key": "$parentid"
       },
       "components":[{"name": "Inventory"}],
       "summary": "$summary Remove Host(s) from IRIS",
       "description": "$summary Remove Hosts(s) from IRIS",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task5=`cat  << EOF
{
    "fields": {
       "project":
       { 
          "key": "SYSADMIN"
       },
       "parent":
       {
           "key": "$parentid"
       },
       "components":[{"name": "Inventory"}],
       "summary": "$summary Update OpenDCIM",
       "description": "$summary Mark Host(s) as spare in OPENDCIM",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
echo $task1 > task1.txt
echo $task2 > task2.txt
echo $task3 > task3.txt
echo $task4 > task4.txt
echo $task5 > task5.txt
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task1.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task2.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task3.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task4.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task5.txt -H "Content-Type: application/json" $JIRAURL
fi
