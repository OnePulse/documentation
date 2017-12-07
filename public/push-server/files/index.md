[_ToC_](../push-server.md)

# OnePulse PushServer Structure

All PushServer files are organized under the `app/PushServer` folder.

| Path                                           | Description                                                          |
|:-----------------------------------------------|:---------------------------------------------------------------------|
| [Admin](./admin.md)                            | SysAdmin reporting builders                                          |
| [Console/Commands](./commands.md)              | Artisan console commands                                             |
| [Exceptions](./exceptions.md)                  | PushServer specific Exceptions                                       |
| [Helpers](./helpers.md)                        | Various Helper classes                                               |
| [Models](./models.md)                          | Eloquent models                                                      |
| [Notification](./notification.md)              | Replaced by [PushManager/Jobs](./push-manager/payload.md)            |
| [PushManager](./push-manager/index.md)         | Latest PushServer Manager classes                                    |
| [Tests](./tests.md)                            | Various PushServer Unit tests                                        |
| [Traits](./traits.md)                          | Various PushServer tasks related Traits                              |
| [Validators](./validators.md)                  | PushServer validators                                                |
| [PushNotification.php](./push-notification.md) | Main Push notification Payload generator class                       |
| [PushServer.php](./push-server.md)             | PushServer entry point                                               |
| *Deprecated*                                   |                                                                      |
| [~~Jobs/Push~~](./jobs.md)                     | Replaced by [PushManager/Jobs](./push-manager/jobs.md)               |
| [~~Selection~~](./selection.md)                | Push selection helper classes used with Redis storage implementation |
| [~~Debug~~](./debug.md)                        | Classes used to debug functionality                                  |
| [~~Handlers~~](./handlers.md)                  | Classes used by previous PushServer implementation                   |
| [~~Providers~~](./providers.md)                | Classes responsible for Redis<->Eloquent transformations             |
| ~~RedisModels~~                                | Redis storage models implementation                                  |

[Back](../push-server.md)