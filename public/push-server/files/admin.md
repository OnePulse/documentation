[_ToC_](../push-server.md) / [_Files_](./index.md)

# SysAdmin Report Builders

SysAdmin Push related reports builder classes.

### UserSnsArnReport.php

Builds and compares number of Enabled|Disable UserSnsArns.

Displays results separately for DB and Redis.


### UsersPushSettingsReport.php

Builds and compares number of

* Disabled participants  (db: push_setting_id=1, Redis: settings:push:1)
* Want Push participants (db: push_setting_id=2, Redis: settings:push:2)
* Want Paid participants (db: push_setting_id=3, Redis: settings:push:3)

Displays results separately for DB and Redis.

[Back](./index.md)