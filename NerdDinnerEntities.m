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
#import "NerdDinnerEntities.h"
/**
 * @interface:Dinner
 * @key:DinnerID
 */
@implementation NerdDinnerModel_Dinner
	@synthesize m_DinnerID;
	@synthesize m_Title;
	@synthesize m_EventDate;
	@synthesize m_Description;
	@synthesize m_HostedBy;
	@synthesize m_ContactPhone;
	@synthesize m_Address;
	@synthesize m_Country;
	@synthesize m_Latitude;
	@synthesize m_Longitude;
	@synthesize m_HostedById;
	@synthesize m_Picture_Filename;
	@synthesize m_Picture_File;
	@synthesize m_DinnerType;
	@synthesize m_RSVPs;

/**
 *Method to create an instance of Dinner
 */
+ (id) CreateDinnerWithdinnerid:(NSNumber *)aDinnerID title:(NSString *)aTitle eventdate:(NSDate *)aEventDate description:(NSString *)aDescription hostedby:(NSString *)aHostedBy contactphone:(NSString *)aContactPhone address:(NSString *)aAddress country:(NSString *)aCountry latitude:(NSDecimalNumber *)aLatitude longitude:(NSDecimalNumber *)aLongitude picture_filename:(NSString *)aPicture_Filename dinnertype:(NSString *)aDinnerType
{
	NerdDinnerModel_Dinner *aDinner = [[NerdDinnerModel_Dinner alloc]init];
	
	aDinner.m_DinnerID = aDinnerID;

	
	aDinner.m_Title = aTitle;

	
	aDinner.m_EventDate = aEventDate;

	
	aDinner.m_Description = aDescription;

	
	aDinner.m_HostedBy = aHostedBy;

	
	aDinner.m_ContactPhone = aContactPhone;

	
	aDinner.m_Address = aAddress;

	
	aDinner.m_Country = aCountry;

	
	aDinner.m_Latitude = aLatitude;

	
	aDinner.m_Longitude = aLongitude;

	
	aDinner.m_Picture_Filename = aPicture_Filename;

	
	aDinner.m_DinnerType = aDinnerType;

	return aDinner;
}
/**
 * Initialising object for Dinner
 */
- (id) init
{
	self=[self initWithUri:nil];
	return self;
}

- (id) initWithUri:(NSString*)anUri 
{
	if(self=[super initWithUri:anUri])
	{
		[self setBaseURI:anUri];
		m_OData_hasStream.booleanvalue=NO;
		[m_OData_entityMap setObject:@"RSVP" forKey:@"RSVPs"];
		mProperties *obj;
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Int32" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:NO Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_DinnerID"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"50" MinLength:@"" FixedLength:NO Nullable:NO Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_Title"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.DateTime" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:NO Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_EventDate"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"256" MinLength:@"" FixedLength:NO Nullable:NO Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_Description"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"256" MinLength:@"" FixedLength:NO Nullable:NO Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_HostedBy"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"20" MinLength:@"" FixedLength:NO Nullable:NO Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_ContactPhone"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"50" MinLength:@"" FixedLength:NO Nullable:NO Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_Address"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"30" MinLength:@"" FixedLength:NO Nullable:NO Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_Country"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Double" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:NO Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_Latitude"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Double" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:NO Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_Longitude"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"256" MinLength:@"" FixedLength:NO Nullable:YES Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_HostedById"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"50" MinLength:@"" FixedLength:NO Nullable:NO Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_Picture_Filename"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Binary" MaxLength:@"Max" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_Picture_File"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"50" MinLength:@"" FixedLength:NO Nullable:NO Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_DinnerType"];
		[obj release];
		
		[m_OData_entityFKRelation setObject:@"FK_RSVP_Dinners" forKey:@"RSVP"];

		NSMutableArray *anEntityKey=[[NSMutableArray alloc]init];
		[anEntityKey addObject:@"DinnerID"];
		[m_OData_entityKey setObject:anEntityKey forKey:@"Dinner"];
		[anEntityKey release];
	}
	return self;
}

-(NSMutableArray *)getSyndicateArray
{
	NSMutableArray *syndicateArray=[[NSMutableArray alloc]init];
	
	return [syndicateArray autorelease];
}
-(NerdDinnerModel_Dinner *)getDeepCopy
{
	NerdDinnerModel_Dinner *obj=[[NerdDinnerModel_Dinner alloc]initWithUri:[self getBaseURI]];
	[obj setDinnerID:[self getDinnerID]];
	[obj setTitle:[self getTitle]];
	[obj setEventDate:[self getEventDate]];
	[obj setDescription:[self getDescription]];
	[obj setHostedBy:[self getHostedBy]];
	[obj setContactPhone:[self getContactPhone]];
	[obj setAddress:[self getAddress]];
	[obj setCountry:[self getCountry]];
	[obj setLatitude:[self getLatitude]];
	[obj setLongitude:[self getLongitude]];
	[obj setHostedById:[self getHostedById]];
	[obj setPicture_Filename:[self getPicture_Filename]];
	[obj setPicture_File:[self getPicture_File]];
	[obj setDinnerType:[self getDinnerType]];
	[obj setRSVPs:[self getRSVPs]];

	return [obj autorelease];
}
- (void) dealloc
{
	[m_DinnerID release];
	m_DinnerID = nil;
	[m_Title release];
	m_Title = nil;
	[m_EventDate release];
	m_EventDate = nil;
	[m_Description release];
	m_Description = nil;
	[m_HostedBy release];
	m_HostedBy = nil;
	[m_ContactPhone release];
	m_ContactPhone = nil;
	[m_Address release];
	m_Address = nil;
	[m_Country release];
	m_Country = nil;
	[m_Latitude release];
	m_Latitude = nil;
	[m_Longitude release];
	m_Longitude = nil;
	[m_HostedById release];
	m_HostedById = nil;
	[m_Picture_Filename release];
	m_Picture_Filename = nil;
	[m_Picture_File release];
	m_Picture_File = nil;
	[m_DinnerType release];
	m_DinnerType = nil;
	
	[m_RSVPs release];
	m_RSVPs = nil;
	[super dealloc];
}

@end
/**
 * @interface:RSVP
 * @key:RsvpID
 */
@implementation NerdDinnerModel_RSVP
	@synthesize m_RsvpID;
	@synthesize m_DinnerID;
	@synthesize m_AttendeeName;
	@synthesize m_AttendeeNameId;
	@synthesize m_Dinner;

/**
 *Method to create an instance of RSVP
 */
+ (id) CreateRSVPWithrsvpid:(NSNumber *)aRsvpID dinnerid:(NSNumber *)aDinnerID attendeename:(NSString *)aAttendeeName
{
	NerdDinnerModel_RSVP *aRSVP = [[NerdDinnerModel_RSVP alloc]init];
	
	aRSVP.m_RsvpID = aRsvpID;

	
	aRSVP.m_DinnerID = aDinnerID;

	
	aRSVP.m_AttendeeName = aAttendeeName;

	return aRSVP;
}
/**
 * Initialising object for RSVP
 */
- (id) init
{
	self=[self initWithUri:nil];
	return self;
}

- (id) initWithUri:(NSString*)anUri 
{
	if(self=[super initWithUri:anUri])
	{
		[self setBaseURI:anUri];
		m_OData_hasStream.booleanvalue=NO;
		[m_OData_entityMap setObject:@"Dinners" forKey:@"Dinner"];
		mProperties *obj;
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Int32" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:NO Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_RsvpID"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Int32" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:NO Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_DinnerID"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"30" MinLength:@"" FixedLength:NO Nullable:NO Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_AttendeeName"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"256" MinLength:@"" FixedLength:NO Nullable:YES Unicode:YES ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_AttendeeNameId"];
		[obj release];
		
		[m_OData_entityFKRelation setObject:@"FK_RSVP_Dinners" forKey:@"Dinners"];

		NSMutableArray *anEntityKey=[[NSMutableArray alloc]init];
		[anEntityKey addObject:@"RsvpID"];
		[m_OData_entityKey setObject:anEntityKey forKey:@"RSVP"];
		[anEntityKey release];
	}
	return self;
}

-(NSMutableArray *)getSyndicateArray
{
	NSMutableArray *syndicateArray=[[NSMutableArray alloc]init];
	
	return [syndicateArray autorelease];
}
-(NerdDinnerModel_RSVP *)getDeepCopy
{
	NerdDinnerModel_RSVP *obj=[[NerdDinnerModel_RSVP alloc]initWithUri:[self getBaseURI]];
	[obj setRsvpID:[self getRsvpID]];
	[obj setDinnerID:[self getDinnerID]];
	[obj setAttendeeName:[self getAttendeeName]];
	[obj setAttendeeNameId:[self getAttendeeNameId]];
	[obj setDinner:[self getDinner]];

	return [obj autorelease];
}
- (void) dealloc
{
	[m_RsvpID release];
	m_RsvpID = nil;
	[m_DinnerID release];
	m_DinnerID = nil;
	[m_AttendeeName release];
	m_AttendeeName = nil;
	[m_AttendeeNameId release];
	m_AttendeeNameId = nil;
	
	[m_Dinner release];
	m_Dinner = nil;
	[super dealloc];
}

@end

 
/**
 * Container interface NerdDinnerEntities, Namespace: NerdDinnerModel
 */
@implementation NerdDinnerEntities 

	@synthesize m_OData_etag;

	@synthesize m_Dinners;
	@synthesize m_RSVPs;
/**
 * The initializer for NerdDinnerEntities accepting service URI
 */
- (id) init
{
	NSString* tmpuri =[[NSString alloc]initWithString:DEFAULT_SERVICE_URL];
	self=[self initWithUri:tmpuri credential:nil];
	[tmpuri release];
	return self;
}

- (id) initWithUri:(NSString*)anUri credential:(id)acredential
{
	NSString* tmpuri=nil;
	if([anUri length]==0)
	{
	 	tmpuri = DEFAULT_SERVICE_URL;
	}
	else
	{
		tmpuri =[NSString stringWithString:anUri];
	}
	if(![tmpuri hasSuffix:@"/"])
	{
		tmpuri=[tmpuri stringByAppendingString:@"/"];
	}

	if(self=[super initWithUri:tmpuri credentials:acredential dataServiceVersion:DataServiceVersion])
	{
		[super setServiceNamespace:@"NerdDinnerModel"];

		NSMutableArray* tempEntities=[[NSMutableArray alloc]init];
		
		[tempEntities addObject:@"Dinners"];
		[tempEntities addObject:@"RSVPs"];

		if([tempEntities count] > 0 )
		{
			[super setEntitiesWithArray:tempEntities];
		}
		[tempEntities release];

		NSMutableArray* tempEntitiySetKey=[[NSMutableArray alloc]init];
		
		[tempEntitiySetKey addObject:@"dinners"];
		[tempEntitiySetKey addObject:@"rsvps"];

		NSMutableArray* tempEntitiyTypeobj=[[NSMutableArray alloc]init];
		
		[tempEntitiyTypeobj addObject:@"Dinner"];
		[tempEntitiyTypeobj addObject:@"RSVP"];

		if( ( [tempEntitiySetKey count] > 0 ) && ( [tempEntitiyTypeobj count] > 0 ) )
		{
			[super setEntitySet2TypeWithObject:tempEntitiyTypeobj forKey:tempEntitiySetKey];

		}

		[tempEntitiySetKey release];
		[ tempEntitiyTypeobj release];

		NSMutableArray* tempEntitiyTypeKey=[[NSMutableArray alloc]init];
		
		[tempEntitiyTypeKey addObject:@"dinner"];
		[tempEntitiyTypeKey addObject:@"rsvp"];
		NSMutableArray* tempEntitySetObj=[[NSMutableArray alloc]init];
		
		[tempEntitySetObj addObject:@"Dinners"];
		[tempEntitySetObj addObject:@"RSVPs"];

		if( ( [tempEntitiyTypeKey count] > 0 ) && ( [tempEntitySetObj count] > 0 ) )
		{
			[super setEntityType2SetWithObject:tempEntitySetObj forKey:tempEntitiyTypeKey];

		}
    	[tempEntitiyTypeKey release];
		[tempEntitySetObj release];

		NSMutableArray* foreignKeys=[[NSMutableArray alloc]init];		
		[foreignKeys addObject:@"FK_RSVP_Dinners"];

		NSMutableArray *arrOfDictionaries=[[NSMutableArray alloc]initWithCapacity:[foreignKeys count]];

		NSMutableArray *arr;
 
		arr=[[NSMutableArray alloc]init];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"Dinners",@"EndRole",@"Dinner",@"Type",@"1",@"Multiplicity",nil] autorelease]];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"RSVP",@"EndRole",@"RSVP",@"Type",@"*",@"Multiplicity",nil] autorelease]];
		[arrOfDictionaries addObject:arr];
		[arr release];

		if( ( [foreignKeys count] > 0 ) && ( [arrOfDictionaries count] > 0 ) )
		{
			[super setAssociationforObjects:arrOfDictionaries forKeys:foreignKeys];
		}
		[foreignKeys release];
		[arrOfDictionaries release];

		m_Dinners = [[DataServiceQuery alloc]initWithUri:@"Dinners" objectContext: self];
		m_RSVPs = [[DataServiceQuery alloc]initWithUri:@"RSVPs" objectContext: self];
		
	}
	return self;
}

/*
 * Method for service operation
 */
- (NSArray *) FindUpcomingDinners
{
	NSString *aQuery=[self prepareQuery:@"FindUpcomingDinners" parameters:nil];
	return [self executeServiceOperation:aQuery httpMethod:@"GET" isReturnTypeCollection:YES];
}
/*
 * Method for service operation
 */
- (NSArray *) DinnersNearMeWithplaceorzip:(NSString *)placeOrZip
{
	NSDictionary *params=[[NSDictionary alloc] initWithObjectsAndKeys:placeOrZip,@"placeOrZip",nil];
	NSString *aQuery=[self prepareQuery:@"DinnersNearMe" parameters:params];
	[params release];

	return [self executeServiceOperation:aQuery httpMethod:@"GET" isReturnTypeCollection:YES];
}
/*
 * Method for service operation
 */
- (NSString *) SetFileWithdinnerid:(NSNumber *)dinnerID file:(NSData *)file
{
	NSDictionary *params=[[NSDictionary alloc] initWithObjectsAndKeys:dinnerID,@"dinnerID",file,@"file",nil];
	NSString *aQuery=[self prepareQuery:@"SetFile" parameters:params];
	[params release];

	return [self executeServiceOperation:aQuery httpMethod:@"POST" isReturnTypeCollection:NO];
}
/*
 * Method for service operation
 */
- (NSString *) GetFileWithdinnerid:(NSNumber *)dinnerID
{
	NSDictionary *params=[[NSDictionary alloc] initWithObjectsAndKeys:dinnerID,@"dinnerID",nil];
	NSString *aQuery=[self prepareQuery:@"GetFile" parameters:params];
	[params release];

	return [self executeServiceOperation:aQuery httpMethod:@"GET" isReturnTypeCollection:NO];
}

/**
 * Method returns DataServiceQuery reference for
 * the entityset Dinners
 */
- (id) dinners
{
	[self.m_Dinners clearAllOptions];
	return self.m_Dinners;
}

/**
 * Method returns DataServiceQuery reference for
 * the entityset RSVPs
 */
- (id) rsvps
{
	[self.m_RSVPs clearAllOptions];
	return self.m_RSVPs;
}

/**
 * Methods for adding object to the entityset/collection
 */

- (void) addToDinners:(id)anObject
{
	[super addObject:@"Dinners" object:anObject];
}

- (void) addToRSVPs:(id)anObject
{
	[super addObject:@"RSVPs" object:anObject];
}

- (void) dealloc
{
	[ m_OData_etag release];
	m_OData_etag = nil;
	
	[m_Dinners release];
	m_Dinners = nil;
	[m_RSVPs release];
	m_RSVPs = nil;

	[super dealloc];
}

@end
