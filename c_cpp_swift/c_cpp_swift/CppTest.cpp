//
//  CppTest.cpp
//  ObjC_n_cpp
//
//  Created by Mira Young on 11/30/20.
//


#include "CppTest.hpp"
#include <iostream>

void CppTest::HelloFromCPP() {
    std::cout << "Hello from CPP" << std::endl;
};


void swap(int *xp, int *yp) {
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
};


void printArray(int *arr, int size) {
    int i;
    for (i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("n");
};

void CppTest::bubbleSort(int *arr, int n) {
    int i, j;
    bool swapped;
    
    for (i = 0; i < n - 1; i++) {
        swapped = false;
        for(j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(&arr[j], &arr[j+1]);
                swapped = true;
            }
        }
        if (swapped == false) {
            break;
        }
    }
    
    printf("sorted array from c++: ");
    printArray(arr, n);
};
