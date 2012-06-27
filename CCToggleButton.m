//
//  CCToggleButton.m
//  CCButton
//
//  Created by Shotaro Emori on 12/02/18.
//  Copyright Shotaro Emori 2012. All rights reserved.
//

#import "CCToggleButton.h"

@implementation CCToggleButton

@synthesize offSelector = offSelector_, toggle = toggle_;

#pragma mark - cycle

- (id)initWithNode:(CCNode *)node contentSize:(CGSize)size target:(id)target selector:(SEL)selector offSelector:(SEL)offSelector
{
    self = [self init];
    if (self) {
        self.node = node;
        contentSize_ = size;
        self.toggle = NO;
        self.target = target;
        selector_ = selector;
        offSelector_ = offSelector;
        [self addChild:self.node];
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
        [self.node getChildByTag:CCTOGGLEBUTTON_OFF_SPRITE_TAG].visible = NO;
        [self.node getChildByTag:CCTOGGLEBUTTON_ON_SPRITE_TAG].visible = YES;
    } else {
        [self.node getChildByTag:CCTOGGLEBUTTON_OFF_SPRITE_TAG].visible = YES;
        [self.node getChildByTag:CCTOGGLEBUTTON_ON_SPRITE_TAG].visible = NO;
    }
    toggle_ = toggle;
}

#pragma mark - CCTargetedTouchDelegate

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (!self.visible) {
        return NO;
    }
    bool isTouch = [self containsTouchLocation:touch];
    if (isTouch) {
        self.toggle = !self.toggle;
        if (self.toggle) {
            [target_ performSelector:selector_];
        } else {
            [target_ performSelector:offSelector_];
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
