#
## Put
```
ubuntu@public-instance-tokunaga-ubuntu2:~/8_stream$ python3 put.py 
{
  "entries": [
    {
      "error": null,
      "error_message": null,
      "offset": 27,
      "partition": "0",
      "timestamp": "2024-05-20T00:41:34.427000+00:00"
    }
  ],
  "failures": 0
}

```
## CreateCursor
```
ubuntu@public-instance-tokunaga-ubuntu2:~/8_stream$ python3 CreateCursor.py 
{
  "value": "eyJjdXJzb3JUeXBlIjoicGFydGl0aW9uIiwidHlwZSI6IlRyaW1Ib3Jpem9uIiwib2Zmc2V0IjpudWxsLCJ0aW1lIjpudWxsLCJwYXJ0aXRpb24iOiIwIiwic3RyZWFtSWQiOiJvY2lkMS5zdHJlYW0ub2MxLmlhZC5hbWFhYWFhYXNzbDY1aXFhbWszeW9vaXluMmtiNjc0cXhqMnlvMmR1bnd3czNsN3FldXozZ2dnNzdpNnEiLCJleHBpcmF0aW9uIjoxNzE2MTY2NzgzMzEzLCJjdXJzb3JUeXBlIjoicGFydGl0aW9uIn0="
}
```

## Get
```
ubuntu@public-instance-tokunaga-ubuntu2:~/8_stream$ python3 get.py 
[{
  "key": "a2V5Mg==",
  "offset": 27,
  "partition": "0",
  "stream": "cn_study_stream",
  "timestamp": "2024-05-20T00:41:34.427000+00:00",
  "value": "YmFuYW5h"
}]
```
