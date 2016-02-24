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
