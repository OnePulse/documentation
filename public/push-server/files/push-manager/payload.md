[_ToC_](../../../push-server.md) / [_Files_](../../index.md) / [_PushManager_](../index.md)

# PushServer Notification Payload builder classes

PushServer Notification folder contains all the classes responsible for User's notification payload generation/validation.

Since the Payload structure differs for different mobile device types, this includes separate files for Andriod/iPhone devices Payload message generators.

Both Message/APNS.php and Message/GCM.php builders are implements Messagable interface as it's defined in Message/Messagable.php class.

### Instantiable Payload builders

* Message/APNS.php - iPhone mobile devices payload message builder
* Message/GCM.php - Android mobile devices payload message builder

Both classes extends abstract Message.php class which provides methods required for Payload message generation.

### Abstract Layer: Message/Message.php

Abstract class responsible for common payload data generation

### Validators

* PayloadGeneratorDataValidator.php - Responsible for generated payload validation


[Back](../index.md)