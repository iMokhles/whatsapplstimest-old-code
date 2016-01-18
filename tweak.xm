#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

%hook ChatManager

- (BOOL)lastSeenEnabled {

	NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.whatsapplstimest.plist"];
	static BOOL value = NO;
	value = [[plist objectForKey:@"enabled"]boolValue];	

	if (value) {
	[self setUserInteractionEnabled:YES];
	return YES;
	}
else if (!value) {
     return %orig;
 }
}

- (BOOL)lastSeenChangeAllowed {

	NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.whatsapplstimest.plist"];
	static BOOL value = NO;
	value = [[plist objectForKey:@"enabled"]boolValue];	

	if (value) {
	[self setUserInteractionEnabled:YES];
	return YES;
	}
else if (!value) {
     return %orig;
 }
}



%end

%hook AdvancedChatSettingsContoller

static UIAlertView *alertit = nil;

- (void)lastSeenRequestFailedWithError:(id)fp8 userData:(id)fp12 {

NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.whatsapplstimest.plist"];
	static BOOL value = NO;
	value = [[plist objectForKey:@"enabled"]boolValue];	

	if (value) {

UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"WhatsApp LSeen TimeStamp"
														  message: @"iMokhles WhatsApp LSeen TimeStamp Working Perfectly."
														 delegate: nil
												cancelButtonTitle: nil
												otherButtonTitles: @"Ok", nil];
	[alert show];
	[alert release];

    }
else if (!value) {
     %orig;
 }
}

- (void)switchLastSeenAction:(id)fp8 {

%orig;

}

- (void)viewDidLoad {

 alertit = [[UIAlertView alloc] initWithTitle: @"WhatsApp LSeen TimeStamp"
														  message: @"iMokhles WhatsApp LSeen TimeStamp Working Perfectly."
														 delegate: nil
												cancelButtonTitle: nil
												otherButtonTitles: @"Enable", nil];
	[alertit show];
	[alertit release];

}

%new
- (void)alertView:(UIAlertView *)alert didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (alert == alertit) {
		
		if (buttonIndex == 1) { 
	  [self switchLastSeenAction:nil];
    }
  }
}
%end

%hook XMPPConnection

- (id)createPresence:(int)fp8 withNickname:(id)fp12 {

NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.whatsapplstimest.plist"];
	static BOOL valuee = NO;
	valuee = [[plist objectForKey:@"enabledit"]boolValue];

	if (valuee) {
    return NO;
    }
else if (!valuee) {
     return %orig;
     }
}
%end

%hook TimestampBubbleView

- (BOOL)showDate {

	NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.whatsapplstimest.plist"];
	static BOOL valueee = NO;
	valueee = [[plist objectForKey:@"enabledDate"]boolValue];

	if (valueee) {
	[self setUserInteractionEnabled:YES];
	return YES;
	}
else if (!valueee) {
     return %orig;
 }
}

- (BOOL)showTime {

	NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.whatsapplstimest.plist"];
	static BOOL valueee = NO;
	valueee = [[plist objectForKey:@"enabledTime"]boolValue];     

	if (valueee) {
	[self setUserInteractionEnabled:YES];
	return YES;
	}
else if (!valueee) {
     return %orig;
 }
}

- (BOOL)showTimestamp {

	NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.whatsapplstimest.plist"];
	static BOOL valueee = NO;
	valueee = [[plist objectForKey:@"enabledTimestamp"]boolValue];	   

	if (valueee) {
	[self setUserInteractionEnabled:YES];
	return YES;
	}
else if (!valueee) {
     return %orig;
 }
}

%end
