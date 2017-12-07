[_ToC_](../../../push-server.md) / [_Files_](../../index.md) / [_PushManager_](../index.md)

# Artisan commands

Artisan CLI commands related to PushManager functionality debugging.

### PushDev.php [push:dev {pulse} {users?} {responded=200} {--offline} {--debug} {--migrate}]

Outputs the list of blacklisted participants to CLI.

| Argument       | Description                                                      |
|:---------------|:-----------------------------------------------------------------|
| pulse          | Pulse model id                                                   |
| users?         | Optional. Predefined list of user(s) to be notified              |
| responded=200  | Optional. Predefined amount of participants already responsded   |
| --offline      | Trigger OfflinePushManager instead of PushManager                |
| --debug        | Output some debug information(s) to CLI                          |
| --migrate      | Migrate data to Elasticsearch                                    |


[Back](../index.md)