//
//  main.m
//  3.常见的链表面试题
//
//  Created by wymany on 16/6/20.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import <Foundation/Foundation.h>

 struct ListNode {
    int m_nValue;
    struct ListNode *m_pNext;
};

typedef struct ListNode ListNode;

void AddToTail(ListNode **pHead,int value);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}

//添加一个结点到尾结点
//main 函数中
/*
ListNode *linkNodes = malloc(sizeof(ListNode));
ListNode *newNodes = malloc(sizeof(ListNode));
linkNodes->m_nValue = 12;
linkNodes->m_pNext = newNodes;
newNodes->m_nValue = 18;
newNodes->m_pNext = NULL;

AddToTail(&linkNodes, 21);

ListNode *temp = linkNodes;
printf("value= %d->",temp->m_nValue);
while (temp->m_pNext !=NULL) {
    temp = temp->m_pNext;
    printf("value= %d->",temp->m_nValue);
}
printf("\n");
 
 */
void AddToTail(ListNode **pHead,int value)
{
    ListNode * pNew = malloc(sizeof(ListNode));
    pNew->m_nValue = value;
    pNew->m_pNext = NULL;
    
    if(*pHead == NULL)
    {
        *pHead = pNew;
    }
    else
    {
        ListNode *node = *pHead;
        if (node->m_pNext != NULL) {
            node = node->m_pNext;
        }
        
        node->m_pNext = pNew;
    }
}

//删除值为 value 的结点
void RemoveNode(ListNode **pHead,int value)
{
    if (pHead== NULL || *pHead == NULL) return;
    
    ListNode *pTobeDeleted = NULL;
    
    ListNode *headNode = *pHead;
    if (headNode->m_nValue == value) {
        pTobeDeleted = *pHead;
        *pHead = headNode->m_pNext;
    }
    else{
        while (headNode->m_pNext !=NULL && headNode->m_pNext->m_nValue != value) {
            headNode = headNode->m_pNext;
        }
        if(headNode->m_pNext!=NULL && headNode->m_nValue == value)
        {
            pTobeDeleted = headNode;
            headNode->m_pNext = headNode->m_pNext->m_pNext;
        }
        
    }
    
    if(pTobeDeleted != NULL)
    {
        free(pTobeDeleted);
        pTobeDeleted = NULL;
    }
        
    
  
}
