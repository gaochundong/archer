# Terms 查询

```json
GET /my-data-index-*/_search
{
  "from": 0,
  "size": 10,
  "query": {
    "bool": {
      "must": [
        {
          "range": {
            "timestamp": {
              "from": "2020-08-02T16:00:00.000Z",
              "to": "2020-08-04T15:59:59.999Z",
              "include_lower": true,
              "include_upper": true,
              "time_zone": "UTC",
              "boost": 1
            }
          }
        },
        {
          "terms": {
            "my_event_type.keyword": [
              "TYPE-666"
            ],
            "boost": 1
          }
        }
      ],
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "sort": [
    {
      "timestamp": {
        "order": "desc"
      }
    }
  ]
}
```
