//
//  Ctest.c
//  ObjC_n_cpp
//
//  Created by Mira Young on 11/30/20.
//

#include "Ctest.h"

void HelloFromC() {
    printf("hello from C");
}


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

void bubbleSortC(int *arr, int n) {
    int i, j;
    int swapped;
    
    for (i = 0; i < n - 1; i++) {
        swapped = 0;
        for(j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(&arr[j], &arr[j+1]);
                swapped = 1;
            }
        }
        if (swapped == 0) {
            break;
        }
    }
    
    printf("sorted array from c: ");
    printArray(arr, n);
};
