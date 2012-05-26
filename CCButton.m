//
//  CCButton.m
//  CCButton
//
//  Created by Shotaro Emori on 12/02/18.
//  Copyright Shotaro Emori 2012. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton

@synthesize node = node_;

#pragma mark - cycle

- (id)initWithNode:(CCNode *)node contentSize:(CGSize)size action:(ccbutton_block_t)action
{
    self = [self init];
    if (self) {
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:1-self.zOrder swallowsTouches:YES];
        self.node = node;
        contentSize_ = size;
        action_ = Block_copy(action);
        [self addChild:self.node];
    }
    return (self);
}

- (void)dealloc {
    if (node_ != nil) {
        [node_ release], node_ = nil;
    }
    [self removeAllChildrenWithCleanup:YES];
    [super dealloc];
}

#pragma mark - public method

- (BOOL)containsTouchLocation:(UITouch *)touch {
    return CGRectContainsPoint(CGRectMake(0, 0, self.contentSize.width, self.contentSize.height), [self convertTouchToNodeSpaceAR:touch]);
}

#pragma mark - CCTargetedTouchDelegate

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    bool isTouch = [self containsTouchLocation:touch];
    if (isTouch) {
        action_();
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
