### README

## 1) /api/v1/account/:account_num

Parameter | Type | Notes | Required |
--------- | ---- | ----- | -------- |
year  | String |  Filter results by year | X
month | String | Filter results by  month | X
account_num | String | AWS Account number | X

To get billing details for a specific account.

curl -H "Authorization: Token token=some_token" 'http://localhost:3000/api/v1/account/some_account?year=2015&month=1'

## 2) /api/v1/account/:account_num/aggregate

Parameter | Type | Notes | Required |
--------- | ---- | ----- | -------- |
year  | String |  Filter results by year | X
month | String | Filter results by  month | X
account_num | String | AWS Account number | X

To get billing details for a specific account that wil be aggreated by the tag 'Cost Center'

curl -H "Authorization: Token token=some_token" 'http://localhost:3000/api/v1/account/some_account/aggregate?year=2015&month=1'

## 3) /api/v1/current_month/:account_num

To get billing details for a specific account for the current month, this data will be up to date to the previous day.

curl -H "Authorization: Token token=some_token" 'http://localhost:3000/api/v1/current_month/some_account'

### Convert JSON data to CSV
Ingest AWS billing detail json and spit out a pivot table analyzing costs by product and cost center

```
#!/usr/bin/env python
import pandas as pd
df = pd.read_json(<input file URL>)
df.to_csv(<output file name>)
```

The file URL needs to be fully qualified for a local file, i.e. file://localhost/usr/local/data/foo.json). 
