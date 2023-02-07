
CREATE COLUMNFAMILY iot.sensors (
                             device_id text PRIMARY KEY,
                             device_name text,
                             ip_address inet,
                             latitude float,
                             longitude float,
                             temperature int,
                             humidity  int,
                             pressure int,
                             datetime timestamp
);

