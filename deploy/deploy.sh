#!/bin/sh

help(){
  echo "usage: `basename $0` -d [mysql|postgres|sqlite]"
  echo ""
  echo "easy deployment script for ci_status"
  echo "arguments:"
  echo "  -d [mysql|postgres|sqlite]: database type"
  exit 1
}

while getopts ":hd:" opt; do
  case $opt in

    h) help
        ;;
    d)
        DB_TYPE="$OPTARG"
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        help
        exit 1
        ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
        help
        exit 1
        ;;
  esac
done

reinit_mysql(){
   mysql -e 'DROP USER "ci_status"@"localhost";'
   mysql -e 'DROP DATABASE IF EXISTS ci_status;
        CREATE DATABASE ci_status;
        CREATE USER "ci_status"@"localhost" IDENTIFIED BY "ci-password";
        GRANT SELECT,INSERT,UPDATE,DELETE,CREATE ON ci_status.* TO "ci_status"@"localhost";
';
    mysql ci_status < ../web/sql/db.sql
}

reinit_mysql
