[_ToC_](../../../push-server.md) / [_Files_](../../index.md) / [_PushManager_](../index.md)

# PushServer PushManager Mutators

Mutators role in Push campaign is to mutate data from database to temporary storage in order to prevent further database queries once the Push campaign processing is initialised.

| Mutator               | Description                               |
|:----------------------|:------------------------------------------|
| PulseMutator.php      | App\Pulse and/or App\Services\Pulse data  |
| UserMutator.php       | App\User and/or App\MobileUser data       |
| ConfigMaskMutator.php | App\ConfigMask data                       |


[Back](../index.md)