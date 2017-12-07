[_ToC_](../push-server.md) / [_Files_](./index.md)

# PushServer Helper Classes

### AWS/Sns.php

Aws Simple Notification Service Client provider class.

### Redis DB instance instantiator Classes

Various app/Redis package helper classes.

| Class               |                                         |
|:--------------------|:----------------------------------------|
| PulseDataClient.php | Pulse data Redis storage instantiator   |
| RedisKeyHelper.php  | Pulse specific Redis keys provider      |
| UserDataClient.php  | Uer data Redis storage instantiator     |

### ~~CampaignDataSaverHelper.php~~

Deprecated Push campaign data saver class.

Replaced with DataSaver Processor in PushManager

### CLI.php

Command line interface helper wrapper.

Allows prettifying CLI output messages.

[Back](./index.md)