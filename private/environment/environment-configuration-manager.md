---
layout: default
---

# Environment Configuration Manager

The configuration manager is designed to generate configuration files for a specific environment on code deploy using an artisan command that will be run as part of the deploy script in forge. The goal is to put .env values under source control and remove the risk of forgetting crucial .env changes when deploying to multiple servers. 

## Components

The .env manager consists of:
 - An artisan command to generate the .env files
 - A set of configuration templates related to a .env file
 - The App\Environment\Generator class
 
### The Artisan Command

The command has the following pattern

	publish:env {app_name} {environment=local} {mode=API_MODE} {debug=0}
	
`app_name`: this is an identifier that will be printed at the public web root. It should be unique and will be used to populate the `OP_SERV_NAME` variable.
`environment`: this should be the target environment (_uk, dz, beta, dev_ or _local_). It should correspond to a directory in the app code under the `/env` directory (more below).
`mode`: This should be either _API\_MODE_, _SERVICES\_MODE_ or _REGION\_MODE_ and determines which API and Web routes the app exposes (in the case of SERVICES_MODE it is none)
`debug`: If this is set as _1_ then the log level is set to _all_ and the _APP\_DEBUG_ to true. In productin we should pass the default _0_

### The Templates

Templates are stored under the `/env` directory in a directory named as the environment. The structure of `/env` should be:
/env

- /env
	- /beta
		- /versions
		- env.txt
	- /dev
		- ...
	- /dz
		- ...
	- /local
		- ...
	- /templates
		- /aws
		- /config
		- /mysql
		- /providers
		- /redis
	- /uk
		- ...
		
The versions directory will contain any previously overwritten versions timestamped. If .env generation fails it will rollback to the latest version.

The `env.txt` file is the template for the environment and will have a structure similar to this example (from `/env/local/env.txt`)

	# ==============================================================================
	# Application Local
	# ==============================================================================
	?app
	APP_LOG=single
	
	# --- URLS ---
	APP_URL=https://beta-api.onepulse.com/
	API_URL=https://beta-api.onepulse.com/api
	ACTIVATE_LINK=https://beta-api.onepulse.com/activate/
	WEB_SITE_BASE=https://beta.onepulse.com
	
	<mysql/local>
	
	<redis/local>
	
	<aws/local>
	
	<providers/local>
	
	<config/local>
	
The `?app` placeholder will contain generated variables related to debugging and app level settings.

For readability URL's are put in the template file but could as easily be stored in a template snippet.

Template snippets are referenced using the `<dir/environment>` notation. Snippets contain plain .txt files with plain text env configuration values. For example this is the contents of `/templates/mysql/local` which is referenced with `<mysql/local>`

	# ==============================================================================
	# MYSQL LOCAL
	# ==============================================================================
	DB_HOST=localhost
	DB_USERNAME=homestead
	DB_PASSWORD=secret
	DB_DATABASE=onepulse
	
If you need to reference another environments Db just replace the `<mysql/local>` tag with `<mysql/dev>` and re-run the artisan command.

## Example Artisan Calls

For your local:
	
	publish:env "My Local App" local API_MODE 1
	
For prod:

	publish:env "UK_API_1 Label" uk API_MODE