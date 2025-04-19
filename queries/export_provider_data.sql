COPY (SELECT * FROM ip_data ORDER BY cloud_provider, cidr_block) TO 'data/providers/all.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data ORDER BY cloud_provider, cidr_block) TO 'data/providers/all.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM ip_data) TO 'data/providers/all.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'AWS' ORDER BY cloud_provider, cidr_block) TO 'data/providers/aws.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'AWS' ORDER BY cloud_provider, cidr_block) TO 'data/providers/aws.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM aws_ip_data) TO 'data/providers/aws.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Azure' ORDER BY cloud_provider, cidr_block) TO 'data/providers/azure.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Azure' ORDER BY cloud_provider, cidr_block) TO 'data/providers/azure.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM azure_ip_data) TO 'data/providers/azure.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Cloudflare' ORDER BY cloud_provider, cidr_block) TO 'data/providers/cloudflare.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Cloudflare' ORDER BY cloud_provider, cidr_block) TO 'data/providers/cloudflare.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM cloudflare_ip_data) TO 'data/providers/cloudflare.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'DigitalOcean' ORDER BY cloud_provider, cidr_block) TO 'data/providers/digitalocean.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'DigitalOcean' ORDER BY cloud_provider, cidr_block) TO 'data/providers/digitalocean.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM digitalocean_ip_data) TO 'data/providers/digitalocean.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Fastly' ORDER BY cloud_provider, cidr_block) TO 'data/providers/fastly.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Fastly' ORDER BY cloud_provider, cidr_block) TO 'data/providers/fastly.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM fastly_ip_data) TO 'data/providers/fastly.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Google Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/googlecloud.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Google Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/googlecloud.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM google_ip_data) TO 'data/providers/googlecloud.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Linode' ORDER BY cloud_provider, cidr_block) TO 'data/providers/linode.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Linode' ORDER BY cloud_provider, cidr_block) TO 'data/providers/linode.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM linode_ip_data) TO 'data/providers/linode.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Oracle' ORDER BY cloud_provider, cidr_block) TO 'data/providers/oracle.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Oracle' ORDER BY cloud_provider, cidr_block) TO 'data/providers/oracle.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM oracle_ip_data) TO 'data/providers/oracle.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Vercel' ORDER BY cloud_provider, cidr_block) TO 'data/providers/vercel.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Vercel' ORDER BY cloud_provider, cidr_block) TO 'data/providers/vercel.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM vercel_ip_data) TO 'data/providers/vercel.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'IBM Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/ibm.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'IBM Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/ibm.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM ibm_ip_data) TO 'data/providers/ibm.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Clever Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/clevercloud.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Clever Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/clevercloud.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM clevercloud_ip_data) TO 'data/providers/clevercloud.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Outscale' ORDER BY cloud_provider, cidr_block) TO 'data/providers/outscale.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Outscale' ORDER BY cloud_provider, cidr_block) TO 'data/providers/outscale.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM outscale_ip_data) TO 'data/providers/outscale.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'WPEngine' ORDER BY cloud_provider, cidr_block) TO 'data/providers/wpengine.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'WPEngine' ORDER BY cloud_provider, cidr_block) TO 'data/providers/wpengine.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM wpengine_ip_data) TO 'data/providers/wpengine.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Vultr' ORDER BY cloud_provider, cidr_block) TO 'data/providers/vultr.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Vultr' ORDER BY cloud_provider, cidr_block) TO 'data/providers/vultr.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM vultr_ip_data) TO 'data/providers/vultr.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Arsys' ORDER BY cloud_provider, cidr_block) TO 'data/providers/arsys.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Arsys' ORDER BY cloud_provider, cidr_block) TO 'data/providers/arsys.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM arsys_ip_data) TO 'data/providers/arsys.json' (ARRAY true);