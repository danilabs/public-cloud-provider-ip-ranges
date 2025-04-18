CREATE TABLE ibm_ip_data AS (
  SELECT DISTINCT
    prefixes AS cidr_block,
    STR_SPLIT(prefixes, '/')[1] AS ip_address,
    CAST(STR_SPLIT(prefixes, '/')[2] AS INTEGER) AS ip_address_mask,
    CAST(pow(2, 32-CAST(STR_SPLIT(prefixes, '/')[2] AS INTEGER)) AS INTEGER) AS ip_address_cnt,
    'no-region' AS region
  FROM (
    SELECT
      prefixes
    FROM
      read_csv_auto('/tmp/ibm_ips.txt', columns = {'prefixes': 'VARCHAR'}, ignore_errors = true)
  )
);

--https://cloud.ibm.com/docs/infrastructure-hub?topic=infrastructure-hub-ibm-cloud-ip-ranges