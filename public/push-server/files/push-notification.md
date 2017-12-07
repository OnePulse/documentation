[_ToC_](../push-server.md) / [_Files_](./index.md)

# PushNotification.php

One of the main PushServer classes.

Responsible for:

- Participant's data collection/transformation
- Participant's data validation
    - validate participant's current status,
    - validate participant's current push_setting_id value,
    - validate participant's device SnsArn,
    - validate that the participant is not yet notified for the selected Pulse
- Store notification data to persistant storage
- Push Notification payload message generation
- Dispatching Single Push notification message
- Preparation of the promise for asynchronous bulk messages sending process
- Resolving promises retrieved from the processing endpoint (Aws Sns in this case)


[Back](./index.md)