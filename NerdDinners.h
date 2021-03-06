/**
*
*Copyright 2010 Microsoft Corp
*
*Licensed under the Apache License, Version 2.0 (the "License");
*you may not use this file except in compliance with the License.
*You may obtain a copy of the License at
*
*http://www.apache.org/licenses/LICENSE-2.0
*
*Unless required by applicable law or agreed to in writing, software
*distributed under the License is distributed on an "AS IS" BASIS,
*WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*See the License for the specific language governing permissions and
*limitations under the License.
*/
/**
* This code was generated by the tool 'odatagen'.
* Runtime Version:1.0
*
* Changes to this file may cause incorrect behavior and will be lost if
* the code is regenerated.
*/
/**
* Defines default Data Service URL for this proxy class
*/
#define DEFAULT_SERVICE_URL @""


#define DataServiceVersion @"1.0"

#import "ODataObject.h"
#import "ObjectContext.h"
#import "DataServiceQuery.h"
#import "ODataGUID.h"
#import "ODataBool.h"
#import  "mProperties.h"


@class NerdDinner_Models_LocationDetail;

/**
 * @interface:LocationDetail
 */
@interface NerdDinner_Models_LocationDetail :ODataObject
{
}


@end

/**
 * @interface:Dinner
 * @Type:EntityType
 
 * @key:DinnerID* 
 */
@interface NerdDinner_Models_Dinner : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_DinnerID;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Title;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.DateTime
	*/
	NSDate *m_EventDate;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Description;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_HostedBy;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_ContactPhone;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Address;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Country;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Double
	*/
	NSDecimalNumber *m_Latitude;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Double
	*/
	NSDecimalNumber *m_Longitude;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_HostedById;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:NerdDinner.Models.LocationDetail
	*/
	NerdDinner_Models_LocationDetail *m_Location;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Dinner_RSVPs
	* @FromRole:Dinner
	* @ToRole:RSVPs
	*/
	NSMutableArray *m_RSVPs;
	
}

@property ( nonatomic , retain , getter=getDinnerID , setter=setDinnerID )NSNumber *m_DinnerID;
@property ( nonatomic , retain , getter=getTitle , setter=setTitle ) NSString *m_Title;
@property ( nonatomic , retain , getter=getEventDate , setter=setEventDate )NSDate *m_EventDate;
@property ( nonatomic , retain , getter=getDescription , setter=setDescription ) NSString *m_Description;
@property ( nonatomic , retain , getter=getHostedBy , setter=setHostedBy ) NSString *m_HostedBy;
@property ( nonatomic , retain , getter=getContactPhone , setter=setContactPhone ) NSString *m_ContactPhone;
@property ( nonatomic , retain , getter=getAddress , setter=setAddress ) NSString *m_Address;
@property ( nonatomic , retain , getter=getCountry , setter=setCountry ) NSString *m_Country;
@property ( nonatomic , retain , getter=getLatitude , setter=setLatitude )NSDecimalNumber *m_Latitude;
@property ( nonatomic , retain , getter=getLongitude , setter=setLongitude )NSDecimalNumber *m_Longitude;
@property ( nonatomic , retain , getter=getHostedById , setter=setHostedById ) NSString *m_HostedById;
@property ( nonatomic ,  retain , getter=getLocation , setter=setLocation )NerdDinner_Models_LocationDetail *m_Location;
@property ( nonatomic , retain , getter=getRSVPs , setter=setRSVPs )NSMutableArray *m_RSVPs;

+ (id) CreateDinnerWithdinnerid:(NSNumber *)aDinnerID eventdate:(NSDate *)aEventDate latitude:(NSDecimalNumber *)aLatitude longitude:(NSDecimalNumber *)aLongitude location:(NerdDinner_Models_LocationDetail *)aLocation;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:RSVP
 * @Type:EntityType
 
 * @key:RsvpID* 
 */
@interface NerdDinner_Models_RSVP : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_RsvpID;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_DinnerID;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_AttendeeName;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_AttendeeNameId;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:RSVP_Dinner
	* @FromRole:RSVP
	* @ToRole:Dinner
	*/
	NSMutableArray *m_Dinner;
	
}

@property ( nonatomic , retain , getter=getRsvpID , setter=setRsvpID )NSNumber *m_RsvpID;
@property ( nonatomic , retain , getter=getDinnerID , setter=setDinnerID )NSNumber *m_DinnerID;
@property ( nonatomic , retain , getter=getAttendeeName , setter=setAttendeeName ) NSString *m_AttendeeName;
@property ( nonatomic , retain , getter=getAttendeeNameId , setter=setAttendeeNameId ) NSString *m_AttendeeNameId;
@property ( nonatomic , retain , getter=getDinner , setter=setDinner )NSMutableArray *m_Dinner;

+ (id) CreateRSVPWithrsvpid:(NSNumber *)aRsvpID dinnerid:(NSNumber *)aDinnerID;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * Container interface NerdDinners, Namespace: NerdDinner.Models
 */
@interface NerdDinners : ObjectContext
{
	 NSString *m_OData_etag;
	 DataServiceQuery *m_Dinners;
	 DataServiceQuery *m_RSVPs;
	
}

@property ( nonatomic , retain , getter=getEtag , setter=setEtag )NSString *m_OData_etag;
@property ( nonatomic , retain , getter=getDinners , setter=setDinners ) DataServiceQuery *m_Dinners;
@property ( nonatomic , retain , getter=getRSVPs , setter=setRSVPs ) DataServiceQuery *m_RSVPs;

- (id) init;
- (id) initWithUri:(NSString*)anUri credential:(id)acredential;
- (NSArray *) GetMostRecentDinners; //GM
- (NSArray *) FindUpcomingDinners;
- (NSArray *) DinnersNearMeWithplaceorzip:(NSString *)placeOrZip;
- (id) dinners;
- (id) rsvps;
- (void) addToDinners:(id)anObject;
- (void) addToRSVPs:(id)anObject;

@end
