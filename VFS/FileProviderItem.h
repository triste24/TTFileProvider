//
//  FileProviderItem.h
//  VFS
//
//  Created by dingjie.triste on 2023/7/7.
//

#import <FileProvider/FileProvider.h>

@interface FileProviderItem : NSObject<NSFileProviderItem>

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier NS_DESIGNATED_INITIALIZER;

@end
