//
//  AppDelegate.m
//  TTFileProvider
//
//  Created by dingjie.triste on 2023/7/7.
//

#import "AppDelegate.h"
#import <FileProvider/FileProvider.h>

@implementation AppDelegate

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);

    NSFileProviderDomain *domain = [[NSFileProviderDomain alloc] initWithIdentifier:[NSUUID UUID].UUIDString
                                                                        displayName:@"provider"];

    [NSFileProviderManager removeAllDomainsWithCompletionHandler:^(NSError * _Nullable error) {
         if (error) {
             NSLog(@"remove error: %@", error);
         } else {
             NSLog(@"remove success");
         }
         dispatch_semaphore_signal(sem);
     }];
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    [NSFileProviderManager addDomain:domain completionHandler:^(NSError * _Nullable error) {
         if (error) {
             NSLog(@"add %@ error: %@", domain.displayName, error);
         } else {
             NSLog(@"add %@ success", domain.displayName);
         }
         dispatch_semaphore_signal(sem);
     }];
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    [NSFileProviderManager getDomainsWithCompletionHandler:^(NSArray<NSFileProviderDomain *> * _Nonnull domains, NSError * _Nullable error) {
         if (error) {
             NSLog(@"get domains error:%@", error);
         } else {
             NSLog(@"get domains success:");
             for (NSFileProviderDomain *d in domains) {
                 NSLog(@"%@", d.displayName);
             }
         }
     }];
}

@end
