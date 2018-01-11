## Http Error Codes

### Client 

#### 401: Expired token
#### 403: Logout
#### 406: User does not exist (Preview Pulse)
#### 409: User already logged in
#### 415: Elasticsearch Query Parse Error
#### 417: Live edit Pulse status error
#### 422: Unprocessable Entity

A validation error occurred. This will always return JSON similar to this:
```
{
	"message": "422 Unprocessable Entity",
	"errors": {
		"query": ["The query field is required."]
	},
	"status_code": 422
}
```
#### 503: Maintenance
#### 591: Braintree Payment error


### Mobile

#### 403: Logout
#### 412: Invalid Facebook User
Tells the mobile to direct the user to register their facebook
#### 422: Unprocessable Entity
#### 428: Invalid Token Version
Tells the token to pass the currently held access token to the token exchange endpoint `/api/token/exchange`

#### 503: Maintenance
