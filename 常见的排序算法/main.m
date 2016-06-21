//
//  main.m
//  常见的排序算法
//
//  Created by wymany on 16/6/20.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import <Foundation/Foundation.h>

void bubbleSort(int a[],int length);

void selectSort(int a[],int length);

void quickSort(int a[],int left,int right);
void merge(int a[],int left,int middle,int right);
void mergeSort(int a[],int left,int right);
void heapSort(int a[]);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int a[] = {10,2,8,17,21,19,7,5};
        
        int length = sizeof(a) / sizeof(int);
        //        bubbleSort(a, length);
        //        selectSort(a, length);
        //        quickSort(a,0,length);
        
        mergeSort(a, 0, length);
        
        for (int i = 0; i < length; i++) {
            printf("%d,",a[i]);
        }
        printf("\n");
    }
    return 0;
}

//1.冒泡排序
void bubbleSort(int a[],int length)
{
    int temp;
    for (int i = 0; i < length - 1; i++) {
        for (int j = 0; j < length - i - 1; j++) {
           if(a[j] < a[j+1])
           {
               temp  = a[j];
               a[j] = a[j+1];
               a[j+1] = temp;
           }
        }
    }
}

//2选择排序
void selectSort(int a[],int length)
{
    int temp;
    for (int  i = 0; i < length - 1; i++) {
        int min = i;
        for (int j = i + 1; j < length; j++) {
            if ( a[min] > a[j] )
                min = j;
        }
        
        if(min != i)
        {
            temp = a[min];
            a[min] = a[i];
            a[i] = temp;
        }
    }
}

//3快速排序
void quickSort(int a[],int left,int right)
{
    if (left >= right) return;
    
    int i = left;
    int j = right;
    int key = a[left];
    
    while (i < j) {
        while (i < j && a[j] >= key) {
            j--;
        }
        a[i] = a[j];
        
        while (i < j && a[i] <= key) {
            i++;
        }
        a[j] = a[i];
    }
    
    a[i] = key;
    
    quickSort(a, left, i-1);
    quickSort(a, i+ 1, right);
}

//4归并排序

void mergeSort(int a[],int left,int right)
{
    int mid = (left + right) / 2;
    if(left < right)
    {
        mergeSort(a, left, mid);
        mergeSort(a, mid+1, right);
        merge(a, left, mid, right);
    }
    
}

void merge(int a[],int left,int middle,int right)
{
    int i = left;
    int j = middle + 1;
    int p  = 0;
    int *M  = (int *) malloc(sizeof(right - left +1));
    
    while (i <= middle && j <= right) {
        M[p++] = a[i] <= a[j] ? a[i++] : a[j++];
    }
    while (i <= middle) {
        M[p++] = a[i++];
    }
    
    while (j <= right) {
        M[p++] = a[j++];
    }
    
    for (int i = left,p = 0; i <=right; i++,p++) {
        a[i] = M[p];
    }
    

}

//5堆排序

void heapSort(int a[])
{
    
}

//6基数排序

//7桶排序


