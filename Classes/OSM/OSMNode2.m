//
//  OSMNode2.m
//  Mapzen
//
//  Created by CloudMade Inc. on 2/15/10.
//	Copyright (c) 2011, CloudMade Inc.
//	All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted provided that the following conditions are met:
//		*	Redistributions of source code must retain the above copyright
//			notice, this list of conditions and the following disclaimer.
//		*	Redistributions in binary form must reproduce the above copyright
//			notice, this list of conditions and the following disclaimer in the
//			documentation and/or other materials provided with the distribution.
//		*	Neither the name of the CloudMade Inc. nor the
//			names of its contributors may be used to endorse or promote products
//			derived from this software without specific prior written permission.
//
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//	DISCLAIMED. IN NO EVENT SHALL CLOUDMADE INC BE LIABLE FOR ANY
//	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "OSMNode2.h"


@implementation OSMNode2

@synthesize	lat = _lat; 
@synthesize	lon = _lon;

- (NSString*) toOsmXmlWithChangeset:(NSString *) changeset asNewNode:(BOOL)asNew
{
	NSMutableString* preformat = [NSMutableString stringWithCapacity: 256];
								  
	[preformat appendString: @"<osm version=\"0.6\"><node"];
	
	if(changeset)	[preformat appendFormat:@" changeset='%@' ", changeset];
	if(_lat)		[preformat appendFormat:@" lat='%@' ", _lat];
	if(_lon)		[preformat appendFormat:@" lon='%@' ", _lon];
	
	if(!asNew) [preformat appendString: [self xmlGenericItemProperties]];
	
	[preformat appendString: @">"];
	
	[preformat appendString: [self xmlSerializeDictionary:_allTags xmlContainer: @"tag"]];
	
	[preformat appendString:@"</node></osm>"];
	
	return preformat;
	
}


@end
