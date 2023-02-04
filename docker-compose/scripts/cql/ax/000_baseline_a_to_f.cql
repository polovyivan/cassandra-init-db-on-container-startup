-- USE ax;
CREATE KEYSPACE ax
    WITH REPLICATION = {
        'class' : 'NetworkTopologyStrategy',
        'datacenter1' : 1
        };
