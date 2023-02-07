#!/bin/bash
echo "Executing scripts"
USER_NAME='cassandra'
PASSWORD='cassandra'

while ! cqlsh cassandra -u "${USER_NAME}" -p "${PASSWORD}" -e 'describe cluster' ; do
     sleep 1
done

for cql_file in ./tmp/cql/ax/*.cql;
do
  cqlsh cassandra -u "${USER_NAME}" -p "${PASSWORD}" -f "${cql_file}" ;
  echo "########################Script ""${cql_file}"" executed!!!!!!!!!!!!!!!!!!!!!!"
done
echo "Script execution finished"
