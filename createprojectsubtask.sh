#!/bin/bash

QAURL="http://devjira.cnvrmedia.net/rest/api/latest/issue/"
PRODURL="https://jira.cnvrmedia.net/rest/api/latest/issue/"


#USERNAME="INSERT"
#PASSWORD="COIN"
JIRAURL=$PRODURL
#JIRAURL=$QAURL

if [[ -z "$1" ]];
then
echo "Usage - $0 project-ticket | example $0 'SYSADMIN-0101'"
else 

parentid=$1
read -p "Enter Project Summary: " summary
echo -e "\n"
read -s -p "Enter Username: " myusername
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
       "components":[{"name": "Hardware Request and Procurement"}],
       "summary": "$summary Create Buy Ticket",
       "description": "$summary Create Buy Ticket",
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
       "summary": "$summary Update OpenDCIM",
       "description": "$summary Update OpenDCIM",
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
       "components":[{"name": "Documentation"}],
       "summary": "$summary Update Runbook",
       "description": "$summary Update Runbook",
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
       "components":[{"name": "Documentation"}],
       "summary": "$summary Update Iris Hostgroup",
       "description": "$summary Update Iris Hostgroup",
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
       "components":[{"name": "Account Management"}],
       "summary": "$summary User Access",
       "description": "$summary User Access",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task6=`cat  << EOF
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
       "components":[{"name": "DNS"}],
       "summary": "$summary Update DNS",
       "description": "$summary Update DNS",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task7=`cat  << EOF
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
       "components":[{"name": "Remote Hands"}],
       "summary": "$summary Rack and Stack",
       "description": "$summary Rack and Stack",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task8=`cat  << EOF
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
       "components":[{"name": "Remote Hands"}],
       "summary": "$summary Cable Servers",
       "description": "$summary Cable Servers",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task9=`cat  << EOF
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
       "components":[{"name": "Kickstart"}],
       "summary": "$summary Network Config",
       "description": "$summary Network Config",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task10=`cat  << EOF
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
       "components":[{"name": "Kickstart"}],
       "summary": "$summary Kickstart servers",
       "description": "$summary Kickstart servers",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task11=`cat  << EOF
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
       "components":[{"name": "Server Hardware Issues"}],
       "summary": "$summary Bonding",
       "description": "$summary Bonding",
       "issuetype": {
          "name": "SubTask"
       }
   }
}
EOF`
task12=`cat  << EOF
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
       "components":[{"name": "Documentation"}],
       "summary": "$summary Hand-off",
       "description": "$summary Hand-ff",
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
echo $task6 > task6.txt
echo $task7 > task7.txt
echo $task8 > task8.txt
echo $task9 > task9.txt
echo $task10 > task10.txt
echo $task11 > task11.txt
echo $task12 > task12.txt
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task1.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task2.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task3.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task4.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task5.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task6.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task7.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task8.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task9.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task10.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task11.txt -H "Content-Type: application/json" $JIRAURL
curl -D- -u $USERNAME:$PASSWORD -X POST --data @task12.txt -H "Content-Type: application/json" $JIRAURL
fi
 
