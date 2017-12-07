[_ToC_](../push-server.md) / [_Files_](./index.md)

# PushServer Queue Jobs

In order to separate long-term Push campaign processing the campaign is divided into separate processes managed by various Jobs.

### CampaignJob.php

Queueable Job responsible for handling Push campaign initialisation and dispatching.

### IterationJob.php

Queueable Job responsible for dispatching multiple Push campaign iterations.

Replaced by [PushManager/Jobs]()


[Back](./index.md)