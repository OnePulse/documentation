## Query Based Panels	

Query based panels use Elasticsearch to dynamically populate the members of a panel. The queries are constructed in the panel edit screen in the system admin. Panels can be populated by using pulse,question or answer criteria or by setting date ranges on `users.created_at`, `users.accessed_at`, `users.pushed_at`, `users.paid_at` fields. 

![Query builder](./query-builder.png  "Query builder")

### Adding Panel Members
Panel members are added to the panel by running the artisan command `elasticsearch:apply-query {panel_id}` which can be found in `\App\ElasticSearch\Commands\ApplyPanelQuery`.

The command generates a batch of jobs spread out over 15 minute intervals which trigger the same command to be called. The job that handles the processing of adding panel members is in `\App\Jobs\doApplyQuery`

### Refreshing Panel Members
Panel members can fall out of the defined query criteria and so they need to be refreshed. The job to refresh the panel members runs once over night as a CRON job. The CRON fires the command `elasticsearch:refresh-members`. This command spawns a batch of `\App\Jobs\doApplyQueryRefresh` for each query based panel (identified by querying MySQL for `client_groups.is_initialised =1`).

The `doApplyQueryRefresh` job fires the command `elasticsearch:apply-query` twice once with the `--remove` flag. This process will add any newly qualified members and remove any that are no longer qualified.

### CRON Jobs

The CRONS are configured in `config/forge.php`.