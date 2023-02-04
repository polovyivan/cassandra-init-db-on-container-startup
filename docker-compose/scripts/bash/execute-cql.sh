#!/bin/bash
echo "Executing scripts"

#nodetool disablegossip
#nodetool disablebinary
#nodetool drain
#kill 'cat cassandra.pid'

while ! cqlsh cassandra -u 'cassandra' -p 'cassandra' -e 'describe cluster' ; do
     sleep 1
done

for cql_file in ./tmp/cql/ax/*.cql;
do
  if !  grep -q "USE ax;" "${cql_file}"; then
     sed -i '1s/^/USE ax; /' "${cql_file}";
  fi
  cqlsh cassandra -u 'cassandra' -p 'cassandra' -f "${cql_file}" ;
  echo "########################Script ""${cql_file}"" executed!!!!!!!!!!!!!!!!!!!!!!"
done
echo "Script execution finished"



#cqlsh cassandra -u 'cassandra' -p 'cassandra';
#Describe keyspaces;

#cat ./tmp/cql/ax*.cql | cqlsh cassandra -u 'cassandra' -p 'cassandra'
#for cql_file in ls ./tmp/cql/ax/*.cql; do cqlsh cassandra -u 'cassandra' -p 'cassandra' -f "${cql_file}" ; done

  # sed -i '1s/^/USE ax; /' "${cql_file}";
  #grep -qxF 'USE ax;'"${cql_file}"'"' foo.bar || sed -i '1s/^/USE ax; /' "${cql_file}";
# "USE ax;" "${cql_file}" || sed -i '1s/^/USE ax; /' "${cql_file}";
