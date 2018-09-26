## Elasticsearch Cheat Sheet

### Re-Index
Re-indexing involves migrating the MySQL records into the ES index. If a field value is wrong this can be run while the platform is live.
If the field is new and is not included in the mapping then follow the instructions for live updating the mapping. Once the mapping is good and the existing data is present a re-index can be run to update the incorrect field.

    `php artisan elasticsearch:migrate mobile_users --reset --info`

### Live Update Mappings
First create a new index
	`php artisan elasticsearch:mapping mobile_users_2`

Then copy the existing index into the new index. This step can be done in prep for a maintenance window and should take roughly 3-5mins.

	POST _reindex
	{
	  "source": {
	    "index": "mobile_users"
	  },
	  "dest": {
	    "index": "mobile_users_2"
	  }
	}
	
Check the document count between indexes to ensure its the same. If different run the following to just add missing documents. Ideally this step would be run in a maintenance window. The delta should take less than a minute to complete

	POST _reindex
	{
	  "conflicts": "proceed",
	  "source": {
	    "index": "mobile_users"
	  },
	  "dest": {
	    "index": "mobile_users_2",
	    "op_type": "create"
	  }
	}

Once document count is correct find the index behind the alias

	GET mobile_users/_aliases
	
Response will look like this:

	{
	  "mobile_users_1": {
	    "aliases": {
	      "mobile_users": {}
	    }
	  }
	}
	
In this case the underlying index is called `mobile_users_1`. Swap the alias over to the new index. 

	POST /_aliases
	{
	    "actions" : [
		{ "remove" : { "index" : "mobile_users_1", "alias" : "mobile_users" } },
		{ "add" : { "index" : "mobile_users_2", "alias" : "mobile_users" } }
	    ]
	}
	
Check the doc count by querying the alias and the underlying index:

	GET mobile_users/mobile_user/_search
	GET mobile_users_2/mobile_user/_search
	
If all good the original index can be deleted.

And remove the original
	DELETE mobile_users_1



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
