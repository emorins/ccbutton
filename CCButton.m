//
//  CCButton.m
//  CCButton
//
//  Created by Shotaro Emori on 12/02/18.
//  Copyright Shotaro Emori 2012. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton

@synthesize target = target_, selector = selector_, node = node_, enable = enable_;

#pragma mark - cycle

- (id)initWithNode:(CCNode *)node contentSize:(CGSize)size target:(id)target selector:(SEL)selector
{
    self = [self init];
    if (self) {
        node_ = node;
        contentSize_ = size;
        self.target = target;
        selector_ = selector;
        enable_ = YES;
        [self addChild:self.node];
    }
    return (self);
}

- (void)dealloc {
    [target_ release], target_ = nil;
    [super dealloc];
}

#pragma mark - access method

- (void)setVisible:(BOOL)visible
{
    [super setVisible:visible];
    CCNode *node = nil;
    CCARRAY_FOREACH(self.children, node) {
        node.visible = visible;
    }
}

- (GLubyte)opacity
{
    return opacity_;
}

- (void)setOpacity:(GLubyte)opacity
{
    opacity_ = opacity;
    
    for (CCSprite *node in [self children]) {
        if ([node respondsToSelector:@selector(setOpacity:)]) {
            node.opacity = opacity;
        }
    }
}

#pragma mark - CCNode method

- (void)onEnter
{
    [super onEnter];
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:1-self.zOrder swallowsTouches:YES];
}

- (void)onExit
{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

#pragma mark - public method

- (BOOL)containsTouchLocation:(UITouch *)touch {
    return CGRectContainsPoint(CGRectMake(0, 0, self.contentSize.width, self.contentSize.height), [self convertTouchToNodeSpaceAR:touch]);
}

#pragma mark - CCTargetedTouchDelegate

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (!self.visible || !self.enable) {
        return NO;
    }
    bool isTouch = [self containsTouchLocation:touch];
    if (isTouch) {
        [target_ performSelector:selector_ withObject:self];
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
