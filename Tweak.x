@interface UIKeyboard : UIView
@end
@interface UIKeyboardDockView : UIView
@end
    
@interface NSUserDefaults (Tweak_Category)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString *nsNotificationString = @"com.patrick.lightkeys/preferences.changed";
static BOOL enabled;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    NSNumber *n = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enable" inDomain:@"com.patrick.lightkeys"];
    enabled = (n) ? [n boolValue]:YES;
}

%group LKXIII
    %hook UIKeyboard
        -(void)layoutSubviews {
            %orig;
            self.backgroundColor = [UIColor whiteColor];
        }
    %end

    %hook UIKBRenderConfig
        -(void)setLightKeyboard:(BOOL)arg1 {
            %orig(YES);
        }
    %end

    %hook UIKeyboardDockView
        -(void)layoutSubviews {
            %orig;
            self.backgroundColor = [UIColor whiteColor];
        }
    %end
%end

%ctor
{
    notificationCallback(NULL,NULL,NULL,NULL,NULL);
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString,NULL,CFNotificationSuspensionBehaviorCoalesce);
    
    if(enabled) {
        %init(LKXIII);
    }
}
