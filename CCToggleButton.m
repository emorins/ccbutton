//
//  CCToggleButton.m
//  CCButton
//
//  Created by Shotaro Emori on 12/02/18.
//  Copyright Shotaro Emori 2012. All rights reserved.
//

#import "CCToggleButton.h"

@implementation CCToggleButton

@synthesize toggle = toggle_;

#pragma mark - cycle

- (id)initWithSpriteBatchNode:(CCSpriteBatchNode *)node contentSize:(CGSize)size action:(ccbutton_block_t)action offAction:(ccbutton_block_t)offAction
{
    self = [self init];
    if (self) {
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:1-self.zOrder swallowsTouches:YES];
        self.spriteBatchNode = node;
        contentSize_ = size;
        self.toggle = NO;
        action_ = Block_copy(action);
        offAction_ = Block_copy(offAction);
        [self addChild:self.spriteBatchNode];
    }
    return (self);
}

#pragma mark - public method

- (BOOL)toggle
{
    return toggle_;
}

- (void)setToggle:(BOOL)toggle
{
    if (toggle == YES) {
        [self.spriteBatchNode getChildByTag:CCTOGGLEBUTTON_OFF_SPRITE_TAG].visible = NO;
        [self.spriteBatchNode getChildByTag:CCTOGGLEBUTTON_ON_SPRITE_TAG].visible = YES;
    } else {
        [self.spriteBatchNode getChildByTag:CCTOGGLEBUTTON_OFF_SPRITE_TAG].visible = YES;
        [self.spriteBatchNode getChildByTag:CCTOGGLEBUTTON_ON_SPRITE_TAG].visible = NO;
    }
    toggle_ = toggle;
}

#pragma mark - CCTargetedTouchDelegate

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    bool isTouch = [self containsTouchLocation:touch];
    if (isTouch) {
        self.toggle = !self.toggle;
        if (self.toggle) {
            action_();
        } else {
            offAction_();
        }
    }
    return isTouch;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

@end
