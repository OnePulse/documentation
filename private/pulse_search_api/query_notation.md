## Pulse Query API

The pulse query API is at `/api/pulses/query` and accepts 3 parameters; `query`, `sort`, `fields` and `page`.

#### Query Param
The `query` param is required and will accept a string query using the ElasticSearch notation described [here](https://www.elastic.co/guide/en/elasticsearch/reference/5.5/query-dsl-query-string-query.html).

#### Sort Param
The sort accepts a JSON that describes the fields and order to sort the results on. Leaving this empty will default to sorting on the Elasticsearch relavence `_score` attribute (more [here](https://www.elastic.co/guide/en/elasticsearch/guide/current/relevance-intro.html)). This is the equivilant of sending the following JSON:

```
[
	{ 
		"_score": {
	 		"order": "desc" 
	 	}
 	}
]
```

Any combination of fields can be sent within the JSON array. Empty fields can be handled using either the `_first` or `_last` flags like so:

```
[
	{
		"pulse.ended_at": {
			"order": "asc",
			"missing": "_first"
		}	
	},
	{ 
		"_score": {
	 		"order": "desc" 
	 	}
	}	
]
```

For more sort options read [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-sort.html).

#### Fields Param
Querys can be constructed by passing document fields into the query string (see examples below) or by specifying a CSV of fields that can be optionally included under the `fields` param. The examples below only use the embedded fields notation as this is the simplest approach.

#### Page Param
The page param is optional and can be used as expected to provide pagination of the results. 

:pencil2: Querys will be limited to a max of 2000 results. This mean pagination may not return all the pulses that match a query if it is too loose.  A more specific query should be used in this case.

### Query Examples

These examples show how to pass fields inside the query string and the alternative approach using the `fields` param. 

##### Find pulses which have any combination of the strings "Branch" "3," and "choice" in any text field
```
{
    "query": "(*Branch* *3,* *choice*)"
}
```

##### Find active and closed pulses that have the gender demographic set
```
{
    "query": "pulse_status:(Active Closed) AND _exists_:pulse_demographics.gender"
}
```

##### Find pulses that published or closed in August 2017
```
{
    "query": "pulse.published_at:[2017-08-01 TO 2017-08-31] OR pulse.ended_at:[2017-08-01 TO 2017-08-31]"
}
```

[Ref](https://www.elastic.co/guide/en/elasticsearch/reference/5.5/query-dsl-query-string-query.html#query-string-syntax) 

### Available Fields

```
{
  "pulse": {
    "id": 17408,
    "client_id": 11196,
    "title": "Beta test commit 7f06bd3",
    "intro": "",
    "intro_image": "",
    "message": "",
    "message_url": "",
    "link_url": "",
    "link_type_id": null,
    "participants": 12,
    "value": "0.00",
    "panel_id": null,
    "pulse_type_id": 5,
    "group_id": 10697,
    "language_id": 1,
    "status_id": 5,
    "notification_status_id": 14,
    "parent_pulse_id": null,
    "parent_answer_id": null,
    "image": "",
    "color": "#ffab00",
    "is_result_shareable": 1,
    "is_brand_shareable": 1,
    "is_preview": 0,
    "is_updatable": 0,
    "is_sellable": 0,
    "loop_iteration": 0,
    "expired_at": "2017-08-18T09:59:42+00:00",
    "ended_at": "2017-08-11T10:01:04+00:00",
    "started_at": "2017-08-11T09:59:44+00:00",
    "created_at": "2017-08-11T09:58:29+00:00",
    "updated_at": "2017-08-11T10:01:04+00:00",
    "published_at": "2017-08-11T09:59:47+00:00",
    "client": "OnePulse Official Test",
    "language": "en",
    "notification_status": "Completed",
    "group_name": "Testing Panel",
    "group_code": "PQQFL2",
    "obf_id": "1zoBQoElmxGN"
  },
  "pulse_title": "Beta test commit 7f06bd3",
  "pulse_status": "Closed",
  "pulse_tags": null,
  "pulse_store": null,
  "pulse_full_text": "Beta test commit 7f06bd3",
  "pulse_regions": [
    "UK",
    "INT",
    "US"
  ],
  "pulse_demographics": {
    "gender": [
      "male",
      "female"
    ],
    "age": [
      "16-17",
      "18-21",
      "22-25",
      "26-34",
      "35-44",
      "45-54",
      "55-64",
      "65+"
    ]
  }
}
```