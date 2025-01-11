/*
-- -- -- -- VineRedirect -- -- -- --
     -- -- -- bag.xml -- -- --
       -- -- 2024-08-19 -- --
            -- v2.0 --
*/

%group version112
%hook NSURL

+ (instancetype)URLWithString:(NSString *)URLString {
    NSString *settingsPath = @"/var/mobile/Library/Preferences/bag.xml.vinepref.plist";
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
    NSString *modifiedURLString = URLString;
    
    if ([URLString rangeOfString:@"https://api.vineapp.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://api.vineapp.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }

    if ([URLString rangeOfString:@"https://vine.co"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://vine.co" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    if ([URLString rangeOfString:@"https://vines.s3.amazonaws.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://vines.s3.amazonaws.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    if ([URLString rangeOfString:@"https://media.vineapp.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://media.vineapp.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    NSURL *modifiedURL = %orig(modifiedURLString);

    return modifiedURL;
}

%end
%end


%group version133
%hook NSURL

+ (instancetype)URLWithString:(NSString *)URLString {
    NSString *settingsPath = @"/var/mobile/Library/Preferences/bag.xml.vinepref.plist";
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
    NSString *modifiedURLString = URLString;
    
    if ([URLString rangeOfString:@"https://api.vineapp.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://api.vineapp.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }

    if ([URLString rangeOfString:@"https://vine.co"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://vine.co" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    if ([URLString rangeOfString:@"https://media.vineapp.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://media.vineapp.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    NSURL *modifiedURL = %orig(modifiedURLString);

    return modifiedURL;
}

%end
%end


%group version148
%hook NSURL

+ (instancetype)URLWithString:(NSString *)URLString {
    NSString *settingsPath = @"/var/mobile/Library/Preferences/bag.xml.vinepref.plist";
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
    NSString *modifiedURLString = URLString;
    
    if ([URLString rangeOfString:@"https://api.vineapp.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://api.vineapp.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }

    if ([URLString rangeOfString:@"https://vine.co"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://vine.co" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    if ([URLString rangeOfString:@"https://media.vineapp.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://media.vineapp.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    NSURL *modifiedURL = %orig(modifiedURLString);

    return modifiedURL;
}

%end
%end

//diff
%group unknownVersion
%hook NSURL

+ (instancetype)URLWithString:(NSString *)URLString {
    NSString *settingsPath = @"/var/mobile/Library/Preferences/bag.xml.vinepref.plist";
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
    NSString *modifiedURLString = URLString;
    
    if ([URLString rangeOfString:@"https://api.vineapp.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://api.vineapp.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }

    if ([URLString rangeOfString:@"https://vine.co"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://vine.co" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    if ([URLString rangeOfString:@"https://vines.s3.amazonaws.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://vines.s3.amazonaws.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    if ([URLString rangeOfString:@"https://media.vineapp.com"].location != NSNotFound) {
        modifiedURLString = [URLString stringByReplacingOccurrencesOfString:@"https://media.vineapp.com" withString:[NSString stringWithFormat:@"%@", [prefs objectForKey:@"URLEndpoint"]]];
    }
    
    NSURL *modifiedURL = %orig(modifiedURLString);

    return modifiedURL;
}

%end
%end

%ctor {
    NSString *vineVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    if ([vineVersion compare:@"1.1.2" options:NSNumericSearch] == NSOrderedAscending) {
        %init(version112);
    } else if ([vineVersion compare:@"1.3.3" options:NSNumericSearch] == NSOrderedAscending) {
        %init(version133);
    } else if ([vineVersion compare:@"1.4.8" options:NSNumericSearch] == NSOrderedAscending) {
    %init(version148);
    } else {
        %init(unknownVersion);
    }
}
