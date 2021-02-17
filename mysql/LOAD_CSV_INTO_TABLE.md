# 将csv文件数据导入至table中

```bash
mysql --host=1.1.1.1 --port=3306 --user=xxxxx --password='xxxxx' --database=xxx --show-warnings

load data local infile '/tmp/a.csv' into table xxx_abc columns terminated by ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';
```
