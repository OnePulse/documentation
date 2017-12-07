[_ToC_](../push-server.md) / [_Files_](./index.md)

# Artisan commands

Artisan CLI commands related to Push functionality.

### PushBlacklisted.php [push:blacklisted {--debug}]

Outputs the list of blacklisted participants to CLI.

| Argument       | Description                                          |
|:---------------|:-----------------------------------------------------|
| --debug        | Output some debug information(s) to CLI              |


### ~~PushFirst.php~~ [push:first {pulse}]

Outputs First push timing test.

| Argument       | Description                                          |
|:---------------|:-----------------------------------------------------|
| pulse          | Pulse model id                                       |

### PushLogs.php [push:logs {id} {--pulse} {--user} {--debug=true}]

Artisan command used to archive PushServer Redis logs to file(s).

Logs could be separated by provided command arguments: Pulse logs, Participant logs.

| Argument       | Description                                          |
|:---------------|:-----------------------------------------------------|
| pulse          | Pulse model id                                       |
| --debug        | Output some debug information(s) to CLI              |
| --skip_queue   | Prevent Push process' Jobs Queue functionality       |
| --preview      | Flag Preview pulse mode                              |

### *PushPulse.php* [push:pulse {pulse} {--skip_queue} {--debug} {--preview}]

PushServer campaign triggering Artisan command.

| Argument       | Description                                          |
|:---------------|:-----------------------------------------------------|
| pulse          | Pulse model id                                       |
| --debug        | Output some debug information(s) to CLI              |
| --skip_queue   | Prevent Push process' Jobs Queue functionality       |
| --preview      | Flag Preview pulse mode                              |


### *PushSingle.php* [push:single {pulse} {user} {--debug} {--skip_queue} {--force} {--preview}]

PushServer single campaing triggering Artisan command.

| Argument       | Description                                              |
|:---------------|:---------------------------------------------------------|
| pulse          | Pulse model id                                           |
| user           | User model id                                            |
| --debug        | Output some debug information(s) to CLI                  |
| --skip_queue   | Prevent Push process' Jobs Queue functionality           |
| --force        | Force re-pushing even if participant is already notified |
| --preview      | Flag Preview pulse mode                                  |

[Back](./index.md)