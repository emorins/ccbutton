//
//  CCButton.h
//  CCButton
//
//  Created by Shotaro Emori on 12/02/18.
//  Copyright Shotaro Emori 2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#ifdef __BLOCKS__
typedef void (^ccbutton_block_t)(void);
#endif

@interface CCButton : CCNode<CCTargetedTouchDelegate>
{
    @public
    CCSpriteBatchNode *spriteBatchNode_;
    @private
    ccbutton_block_t action_;
}

/*
 * Button image
 */
@property (retain, readwrite) CCSpriteBatchNode *spriteBatchNode;

- (id)initWithSpriteBatchNode:(CCSpriteBatchNode *)node contentSize:(CGSize)size action:(ccbutton_block_t)action;

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;
@end
