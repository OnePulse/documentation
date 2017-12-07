[_ToC_](../../push-server.md) / [_Files_](../index.md)

# PushServer PushManager

Base Push campaign processing class.

Implements and handles whole of the Push campaign process by separating it to a tasks by using various helpers in order to dispatch and serve campaign jobs using Aws queue.

| Helpers                            | Description                                                  |
|:-----------------------------------|:-------------------------------------------------------------|
| [Processors](./processors.md)      | Push campaign tasks processors                               |
| [Providers](./providers.md)        | Push campaign data providers                                 |
| [Jobs](./jobs.md)                  | Queueable Push campaign job(s)                               |
| [Payload Generators](./payload.md) | Push Notification message payload builders                   |
| [Mutators](./mutators.md)          | PushCampaign object(s) mutators                              |
| [Console Commands](./console.md)   | Push campaign initialisation Artisan commands                |
| [Contracts](./contracts.md)        | Push campaign object interfaces                              |
| *Managers*                         |                                                              |
| [PushManager](./push-manager.md)   | Base Push campaign processing class                          |
| [OfflinePushManager](./offline.md) | PushManager extension used for purpose of testing            |
| ~~LongPollDevPushManager~~         | PushManager extension used for testing LongPoll campaigns    |


[Back](../index.md)