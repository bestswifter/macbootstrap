//
//  main.m
//  DockIconHider
//
//  Created by Zhang,Xingyu(DAPTD) on 2018/1/31.
//  Copyright © 2018年 Zhang,Xingyu(DAPTD). All rights reserved.
//

#import <Foundation/Foundation.h>

static NSArray<NSString *> *appsToRemoveIcon;
BOOL shouldRemoveIconWithFile(NSString *file) {
    if (!appsToRemoveIcon) {
        appsToRemoveIcon = @[@"Siri", @"Contacts", @"Notes", @"Reminders", @"Maps", @"Photos", @"Messages", @"FaceTime", @"Pages", @"Numbers", @"Keynote", @"iTunes", @"iBooks", @"App%20Store"];
    }

    for (NSString *appName in appsToRemoveIcon) {
        NSString *fullName = [NSString stringWithFormat:@"file:///Applications/%@.app/", appName];
        if ([fullName isEqualToString:file]) {
            return YES;
        }
    }
    return NO;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *plistPath = [NSHomeDirectory() stringByAppendingString:@"/Library//Preferences/com.apple.dock.plist"];
        NSDictionary *plistData = [[NSDictionary dictionaryWithContentsOfFile:plistPath] mutableCopy];
        [plistData setValue:@"left" forKey:@"orientation"];  // Move plist data to left
        NSArray *persistentApps = [plistData objectForKey:@"persistent-apps"];
        if (![persistentApps isKindOfClass:[NSArray class]] || [persistentApps count] == 0) {
            return 0;
        }

        NSMutableArray *filteredPersistentApps = [NSMutableArray array];
        for (NSDictionary *appInfo in persistentApps) {
            if (![appInfo isKindOfClass:[NSDictionary class]]) {
                continue;
            }
            NSDictionary *tileData = [appInfo objectForKey:@"tile-data"];
            if (![tileData isKindOfClass:[NSDictionary class]]) {
                continue;
            }

            // File Label may be Chinese so cannot be used to dermine a specific app
            // Use fileURLString, which is the location of executable file instead
            NSDictionary *fileData = [tileData objectForKey:@"file-data"];
            if (![fileData isKindOfClass:[NSDictionary class]]) {
                continue;
            }
            NSString *fileURLString = [fileData objectForKey:@"_CFURLString"];
            if (!shouldRemoveIconWithFile(fileURLString)) {
                [filteredPersistentApps addObject:appInfo];
            }
        }

        if ([filteredPersistentApps count] > 0) {
            [plistData setValue:filteredPersistentApps forKey:@"persistent-apps"];
        }
        [plistData writeToFile:plistPath atomically:YES];
    }
    return 0;
}
