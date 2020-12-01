//
//  CppTest_Wrapper.h
//  ObjC_n_cpp
//
//  Created by Mira Young on 11/30/20.
//

#import <Foundation/Foundation.h>

@interface CppTest_Wrapper : NSObject

-(void) HelloFromCpp_Wrapper;

-(void) bubbleSort_Wrapper:
(int *) arr :
(int) n;

@end
