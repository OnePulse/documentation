# NLP Configuration
Currently OnePulse suppports NLP using the Google Cloud Platform https://cloud.google.com/natural-language/docs/basics.

The API client uses this client https://github.com/GoogleCloudPlatform/google-cloud-php#google-cloud-natural-language-beta. 

The `Google\Cloud\Language\LanguageClient` can be accessed using the `\NLP` facade.

To add NLP to an application model follow these steps:

1 - Add the `GoogleCloudNlpTrait` to the model

2 - Implement the `NlpInterface` on the model

3 - Add the `annotateFields` property to the model*

4 - Run `php artisan install:nlp "App\Model\Namespace"` **



*This should contain an array of model fields that will be concatentated with a line break and passed as a string to the NLP service.

**This command will add the required db schema for the model (new model fields and many-to-many table)

Once implmented the model will automatically update the associated fields by calling the google API on the model `saved` event. You can see this in `\App\GoogleCloud\Traits\GoogleCloudNlpTrait::bootGoogleCloudNlpTrait`.

In some cases (for example saving a Pulse) it will not be desirable to call the API on every save. If this is an issue then the add `protected $annotate_on_save = false;` to the model. The model can then be annotated by manually calling `$model->annotate()`. 

If the model is already annotated no action will be taken. To force an overwrite pass `true` to the annotate call like `$model->annotate(true)`. 

## MySQL
All calls to the NLP service are logged to the `nlp_history` table and linked to the model via the `nlp_history_id` FK.

All text 'entities' (https://cloud.google.com/natural-language/docs/analyzing-entities) are stored in the `sentiment_entities` table and linked via a many-to-many relationship with the model via this method of the trait `\App\GoogleCloud\Traits\GoogleCloudNlpTrait::entities`

The sentiment score and sentiment magnitude values (https://cloud.google.com/natural-language/docs/analyzing-sentiment) are stored on the model in `sentiment_score` and `sentiment_magnitude` fields.
