[_ToC_](../../../push-server.md) / [_Files_](../../index.md) / [_PushManager_](../index.md)

# PushServer PushManager data providers

Helpers responsible for Push campaign temporary data storage.

Since the storage couls be implemented in a varios storage options (Database, Redis, Elasticsearch) providers should separate actual storage implementation from the other parts of the campaign process.

### Cache/RedisCacheProvider.php

Redis cache storage provider implements temporary campaign data storage/retrieval/expiration.


[Back](../index.md)