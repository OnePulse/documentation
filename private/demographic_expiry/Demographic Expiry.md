## Demographic Expiry

### How it works
 Each users ES document contains an array called `expiry` which contains many HashMap objects indexed by the `demographics.text` value. Each of these HashMaps contains a key value pair of `demographic_values.text`=>`expiry date` (in W3C date format).
 
 The ES document also contains an array called `demographics` which contains many arrays also indexed by `demographics.text` which contain a ArrayList of `demographic_values.text` to show which values the user has set for a particular demographic. 
 
 When the user enrols in a pulse the contents of the `demographics` array is compared to the required `pulse_demographics`. Any cases where the pulse requires a demographic but the user holds no values for that demographic the user is considered "unknown" for that demographic. In this case a potential question is generated for the user.
 
 Before the `demographics` from the users ES doc are compared to the `pulse_demographics` the `expiry` array is parsed. Any values that have an expiry date that is in the past are stripped from the users demographics putting those demographics into an unknown state and triggering the potential question to be generated.
 
### How expiry date is calculated
 The expiry date is associated with a `user_profile_demographic` and is the result of the following code:
 
     \Carbon\Carbon::parse($user_profile_demographic->created_at)->addDays($demographic_value->expires_in);
 It is therefore the defined number of days after the user added the demographic value to their profile.
 
### Updated Profile Cases
 
#### Exclusive
 In the case of an exclusive choice demographic changing value the original value will be removed the the deleted method of `UserProfileDemographicObserver::deleted` will ensure the old value is archived.
 
### Multiple
 In the case of multiple choice demographics. If existing values are re-written with the same value they will not need to be archived. The date in `user_profile_demographics.updated_at` will indicate it has been re-written. Additional values added for that demographic will show with later dates in `user_profile_demographics.created_at` than other values for the same demographic. If any values are removed they will be picked up by the  `UserProfileDemographicObserver::deleted` method and archived.
 
###Classes
 
#### DemographicValue
 The DemographicValue model contains a set of functions to manage the bulk expiry of users profile values from sys admin.
 
##### DemographicValue::expire() 
Chunks all users which hold a demographic value and bulk updates ES with the expiry date
##### DemographicValue::dispatchExpirationJob() 
Dispatches the queued job that calls the long running `DemographicValue::expire()` method

#### UserProfileDemographicObserver
Individual demographic values are handled via the observer. When a new value is inserted into `user_profile_demographics` the observer fires some update scripts on ES via the `App\ElasticSearch\Models\MobileUser` model.

#### App\ElasticSearch\Models\MobileUser
#####App\ElasticSearch\Models\MobileUser::addToDemographics
If the `demographic_values.expires_in` is not null then the script will add an expiry date to the users ES doc
#####App\ElasticSearch\Models\MobileUser::deleteFromDemographics
This will remove demographic value entries from both the demographics and expiry ES arrays if they exist.
#####App\ElasticSearch\Models\MobileUser::deleteDemographics
This will remove entire demographic entries from both the demographics and expiry ES arrays if they exist.

Each of these methods use an ES DSL query object that generate the scripts to pass to ES.

#####App\ElasticSearch\Models\MobileUser::userDemographics
When the users ES document is created for the first time (either as part of a sync merge or when the user is new to the system) this function generates the contents of the ES `demographics` and `expiry` arrays.

####App\Api\Version1\Classes\ElasticPotentialQuestions
This class is responsible for the analysis of the pulse and user demographics and for generating the potential questions. If it finds demographic values in the `expiry` array which have dates in the passed it strips them out and treats those demographics as "unknown" and generates an associated potential question.


