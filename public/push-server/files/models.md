[_ToC_](../push-server.md) / [_Files_](./index.md)

# PushServer Eloquent Models

In order to persist Push campaign data/logging in database various Eloquent Models are defined.

Push Campaign workfklow consists of top-level PushCampaign model,

which further should be related to more PushIteration(s) Models,

which afterward should be related to more PushNotification(s).


                    PushCampaign

                       /  |  \

                 ... PushIteration ...

                       /  |  \

                ... PushNotification ...



### PushCampaign.php

Base Push campaign class holding the  top-level data for each campaign (table: push_campaigns).

### PushIteration.php

Push campaign iteration Model responsible for persistance of Push Campaign Iterations (table: push_iterations).

### PushNotification.php

Push campaign single User's notification data (table: push_notifications).

### PushExceptionLog.php

Push campaign exceptions logging data (table: push_exception_logs).

### ~~PushLog.php~~

Push campaign workflow logging (table: push_logs).

[Back](./index.md)