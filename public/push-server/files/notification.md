[_ToC_](../push-server.md) / [_Files_](./index.md)

# PushServer Notification Payload builder classes

PushServer Notification folder contains all the classes responsible for User's notification payload generation.

Since the Payload structure differs for different mobile device types, this includes separate files for Andriod/iPhone devices Payload message generators.

Both APNS.php and GCM.php builders are implements Messagable interface as it's defined in Messagable.php class.

### Instantiable Payload builders

* APNS.php - iPhone mobile devices payload message builder
* GCM.php - Android mobile devices payload message builder

Both classes extends abstract Message.php class which provides methods required for Payload message generation.

### Abstract Layer: Message.php

Abstract class responsible for common payload data generation

### Helpers

* DataToken.php - Responsible for data_token generation
* Helpers.php - Other helper methods required by Payload generation implementation


[Back](./index.md)