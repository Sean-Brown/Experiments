//
//  main.m
//  ObjectsIntro
//
//  Created by Peter Himschoot on 05/03/12.
//  Copyright (c) 2012 U2U. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  kCircle,
  kRectangle,
  kOblateSpheroidEgg } ShapeType;

typedef enum {
  kRedColor,
  kGreenColor,
  kBlueColor } ShapeColor;

NSString *colorName (ShapeColor colorName) {
  switch (colorName) { case kRedColor:
      return @"red";
      break;
    case kGreenColor:
      return @"green";
      break;
    case kBlueColor:
      return @"blue";
    break; }
  return @"no clue";
} // colorName

typedef struct {
  int x, y, width, height;
} ShapeRect;

@interface Shape : NSObject
{
  ShapeColor fillColor;
  ShapeRect bounds; 
}
- (void) setFillColor: (ShapeColor) color;
- (void) setBounds: (ShapeRect) bounds;
- (void) draw;
@end

@interface Circle : Shape
@end

@interface Rectangle : Shape
@end

@implementation Shape
- (void) setFillColor: (ShapeColor) color
{
  fillColor = color;
}
- (void) setBounds:(ShapeRect)b
{
  bounds = b;
}
- (void) draw
{
  NSLog (@"drawing a shape at (%d %d %d %d) in %@", bounds.x, bounds.y,
         bounds.width, bounds.height, colorName(fillColor));
}
@end

@implementation Circle
- (void) draw
{
  NSLog (@"drawing a circle at (%d %d %d %d) in %@", bounds.x, bounds.y,
         bounds.width, bounds.height, colorName(fillColor));
}
@end

@implementation Rectangle
- (void) draw
{
  NSLog (@"drawing a rectangle at (%d %d %d %d) in %@", bounds.x, bounds.y,
         bounds.width, bounds.height, colorName(fillColor));
}
@end

void drawShapes(id shapes[], int count) {
  int i;
  for( i = 0; i < count; i++ ) {
    id shape = shapes[i];
    if( shape != nil ) {
      [shape draw];
    }
  }
}

int main(int argc, const char * argv[])
{
  id shapes[3];
  shapes[0] = [Circle new];
  ShapeRect rect0 = { 0, 0, 10, 30 };
  [shapes[0] setBounds:rect0];
  [shapes[0] setFillColor: kRedColor];
  ShapeRect rect1 = { 30, 40, 50, 60 };
  shapes[1] = [Rectangle new];
  [shapes[1] setBounds:rect1];
  [shapes[1] setFillColor: kGreenColor];
  
  drawShapes(shapes, 2);

  return 0;
}

