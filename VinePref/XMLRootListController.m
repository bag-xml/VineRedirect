#import <Foundation/Foundation.h>
#import "XMLRootListController.h"

@implementation XMLRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
