//
//  CppTest_Wrapper.m
//  ObjC_n_cpp
//
//  Created by Mira Young on 11/30/20.
//

#import "CppTest_Wrapper.h"
#import "CppTest.hpp"

@implementation CppTest_Wrapper

-(void) HelloFromCpp_Wrapper {
    CppTest cpptest;
    cpptest.HelloFromCPP();
}

-(void) bubbleSort_Wrapper:
(int *) arr :
(int) n
{
    CppTest cpptest;
    cpptest.bubbleSort(arr, n);
}

@end

