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
    bool toggle_;
    @protected
    ccbutton_block_t offAction_;
}

@property (assign, readonly) bool toggle;

#pragma mark - cycle

- (id)initWithSpriteBatchNode:(CCSpriteBatchNode *)node contentSize:(CGSize)size action:(ccbutton_block_t)action offAction:(ccbutton_block_t)action;

@end
