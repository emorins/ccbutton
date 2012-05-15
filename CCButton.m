//
//  CCButton.m
//  CCButton
//
//  Created by Shotaro Emori on 12/02/18.
//  Copyright Shotaro Emori 2012. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton

@synthesize spriteBatchNode = spriteBatchNode_;

#pragma mark - cycle

- (id)initWithSpriteBatchNode:(CCSpriteBatchNode *)node contentSize:(CGSize)size action:(ccbutton_block_t)action
{
    self = [self init];
    if (self) {
        self.spriteBatchNode = node;
        contentSize_ = size;
        action_ = Block_copy(action);
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:1-self.zOrder swallowsTouches:YES];
        [self addChild:self.spriteBatchNode];
    }
    return (self);
}

- (void)dealloc {
    if (spriteBatchNode_ != nil) {
        [spriteBatchNode_ release], spriteBatchNode_ = nil;
    }
    [self removeAllChildrenWithCleanup:YES];
    [super dealloc];
}

- (BOOL)containsTouchLocation:(UITouch *)touch {
    return CGRectContainsPoint(CGRectMake(self.position.x, 
                                          self.position.y, 
                                          self.contentSize.width, 
                                          self.contentSize.height), [self convertTouchToNodeSpaceAR:touch]);
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
