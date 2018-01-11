## Elasticsearch Cheat Sheet

### Bulk append value to an array:
    GET mobile_users/mobile_user/_update_by_query
	{
	  
	  "script": {
	    "inline": "ctx._source.groups.add(7)"
	  },
	  "query": {
	    "bool": {
	      "must": [
		{
		  "terms": {
		    "groups": [
		      "10000007"
		    ]
		  }
		}
	      ]
	    }
	  }
	}
	
### Bulk remove value from array:

	GET mobile_users/mobile_user/_update_by_query
	{
	  
	  "script": {
	    "inline": "ctx._source.groups.remove(ctx._source.groups.indexOf(10000007))"
	  },
	  "query": {
	    "bool": {
	      "must": [
			{
			  "terms": {
			    "groups": [
			      "10000007"
			    ]
			  }
			}
	      ]
	    }
	  }
	}
