//
//  CCToggleButton.h
//  CCButton
//
//  Created by Shotaro Emori on 12/02/18.
//  Copyright Shotaro Emori 2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCButton.h"

#define CCTOGGLEBUTTON_OFF_SPRITE_TAG 0
#define CCTOGGLEBUTTON_ON_SPRITE_TAG 1

@interface CCToggleButton : CCButton
{
    @public
    BOOL toggle_;
    SEL offSelector_;
}

@property (assign, readwrite) BOOL toggle;
@property (assign, readwrite) SEL offSelector;

#pragma mark - cycle

- (id)initWithNode:(CCNode *)node contentSize:(CGSize)size target:(id)target selector:(SEL)selector offSelector:(SEL)offSelector;

@end
