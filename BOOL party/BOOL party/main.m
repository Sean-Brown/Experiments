//
//  main.m
//  BOOL party
//
//  Created by Peter Himschoot on 05/03/12.
//  Copyright (c) 2012 U2U. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL areIntsDifferent( int thing1, int thing2 )
{
  if( thing1 == thing2) {
    return (NO);
  } else {
    return (YES);
  }
}

NSString *boolString(BOOL yesNo) {
  if( yesNo == NO ) {
    return (@"No");
  } else {
    return (@"Yes");
  }
}

int main(int argc, const char * argv[])
{
  BOOL areTheyDifferent;
  areTheyDifferent = areIntsDifferent(5, 5);
  NSLog(@"are %d and %d different? %@", 5, 5, boolString(areTheyDifferent));
  areTheyDifferent = areIntsDifferent(23, 42);
  NSLog(@"are %d and %d different? %@", 23, 42, boolString(areTheyDifferent));
  
  return 0;
}

