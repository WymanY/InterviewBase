//
//  main.m
//  2.常见的字符串面试题
//
//  Created by wymany on 16/6/20.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import <Foundation/Foundation.h>

char FirstNotRepatingChar(char *pString);

int countOfStrInDestenStr(char *desStr,char *searchStr);
unsigned long indexOfMatchStrInStr(char *str,char *matchStr);

char* strcopy(char *destination, const char *source);
int strcmp11(char *s1,char *s2);
void reverse(char * str);
char *maxCommonSubStr(char *shortStr,char *longStr);
int isRevesedStr(char *str);
int continumax(char *outputstr,char *intputstr);
char * search(char *cpSource,char ch);
char * reverseSentence(char * pData);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char senctece[]  = "i love you";
        printf("senctece = %s\n",senctece);
        char *newSentect = reverseSentence(senctece);
        printf("newSentect = %s",newSentect);
        printf("\n");
    }
    return 0;
}

//1第一个只出现一次的字符
//题目：在字符串中找出第一个只出现一次的字符。如输入“abaccdeff”，则输出‘b’。

//算法1
/*
char FirstNotRepatingChar(char *pString)
{
    if(pString == NULL)
    return '\0';
    
    unsigned long len  = strlen(pString);
    for(int i = 0;i < len; i++)
    {
        int flag = 0;//标识符，
        for (int j = 0; j < len; j++) {
            if(pString[i] == pString[j] && j!= i)
            {
                flag = 1;
                break;
            }
        }
        if(flag == 0)
        {
            return pString[i];
        }
            
    }
    
    return '\0';
        
}
 */

/*算法2
 1.main 函数输入
 char *s = "abacdeffk";
 char c = FirstNotRepatingChar(s);
 printf("first not repeat char %c",c);
 printf("\n");
 */
char FirstNotRepatingChar(char *pString)
{
    //如果是空指针，返回\0
    if(pString==NULL)
        return '\0';
    
    const int len = 256;
    int hashTable[len];
    for (int i = 0; i < len; i++) {
        hashTable[i] = 0;
    }
    
    char *pHashKey = pString;
    while ((*pHashKey) != '\0') {
        hashTable[*(pHashKey++)]++;
    }
    
    pHashKey = pString;
    while (*pHashKey!= '\0') {
        if(hashTable[*pHashKey] == 1)
        {
            return *pHashKey;
        }
        pHashKey++;
    }

    return '\0';
}

//2.写出在母串中查找子串出现次数的代码.
//main 函数输入如下
//char *desStr = "aabbbccebbccffedbb";
//char *searchStr = "cc";
//int count = countOfStrInDestenStr(desStr, searchStr);
//printf("searchStr %s出现的次数为%d\n",searchStr,count);
int countOfStrInDestenStr(char *desStr,char *searchStr)
{
    char *s1;
    char *s2;
    int count = 0;
    
    while (*desStr !='\0') {
        
        s1 = desStr;
        s2 = searchStr;
        
        while (*s1 == *s2 && s1 !='\0' && s2 !='\0') {
            s1++;
            s2++;
        }
        if(*s2 == '\0')
        {
            count++;
        }
        
        desStr++;
    }
    return count;
}


//3）查找第一个匹配子串位置,如果返回的是s1长度len1表示没有找到
//char *str = "abcdesssnnjkik";
//char *matchStr = "hj";
//unsigned long index = indexOfMatchStrInStr(str, matchStr);
//printf("matchStr index = %zd\n",index);

unsigned long indexOfMatchStrInStr(char *str,char *matchStr)
{
    unsigned long len1 = strlen(str);
    unsigned long len2 = strlen(matchStr);
    if(len1 < len2) return len1;
    int i = 0;
    for(;i < len1 - len2; i++)
    {
        int m = i;
        int j = 0;
        for (; j < len2; j++) {
            if (str[m] != matchStr[j]) {
                break;
            }
            m++;
        }
        
        if(j == len2)
        {
            break;
        }
            
    }
    
    return i < len1 - len2 ? i: len1;
   
}

//3)实现strcpy函数

//char *str = "abcnnn";
//char *newStr = (char *)malloc(sizeof(str));
//strcopy(newStr,str);
//printf("newStr = %s,str = %s\n",str,newStr);


//实现字符串 copy
char *strcopy(char *destination, const char *source)
{
    assert(destination!=NULL && source!= NULL);
    
    char *target = destination;
    while ((*destination++=*source++));
    return target;
}

//实现字符串 比较
//char *s1 = "hello";
//char *s2 = "hello";
//printf("比较结果自己%d,系统%d  \n",strcmp11(s1, s2),strcmp(s1,s2));
int strcmp11(char *s1,char *s2)
{
    assert(s1!=NULL && s2 != NULL);
    while (*s1==*s2 && *s1!= '\0') {
        s1++;
        s2++;
    }
    return (*s1- *s2);
    /*
    if(*s1 > *s2){
        return 1;
    }
    else if( *s1 == *s2){
        return 0;
    }else{
        return -1;
    }
    */
    
    
        
}

//实现字符串翻转
//char str[] = "hello";
//printf("before reverse:str = %s\n",str);
//reverse(str);
//printf("after reverse:str = %s\n",str);

void reverse(char *s)
{
    assert(s);
    
//    char * p1 = str;
//    char * p2 = str-1;
//    while(*++p2);         //一般要求不能使用strlen
//    p2 -= 1;
//    
//    while(p1<p2)
//    {
//        char c = *p1;
//        *p1++ = *p2;
//        *p2-- = c;
//    }
    
    int i, j, c, n=0;

    while(s[n]!='\0')
        n++;
    /*i<j的判断是必须的，若没有，则会又将原本置换的部分又置换回去，实则没变*/
    
    for(i=0,j = n-1;i < j; i++,j--)
    {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
    
}

/*
 求两个字符串的最大公共子串
 char *longStr = "hello world,everybody";
 char *shortStr = "wored";
 char *commonStr = maxCommonSubStr(shortStr, longStr);
 
 NSLog(@"commonStr = %s\n",commonStr);
*/
char *maxCommonSubStr(char *shortStr,char *longStr)
{
    if(strstr(longStr, shortStr) != NULL)
    {
        return shortStr;
    }
    
    int len = (int)strlen(shortStr);
    
    char *subStr = (char *)malloc(len * sizeof(char));
    
    for (int i = len - 1; i >= 0 ; i--) {
        for (int j  = 0; j < len - 1; j++) {
            memcpy(subStr, &shortStr[j], i);
            subStr[i] = '\0';
            
            if(strstr(longStr, subStr)!= NULL)
                return subStr;
        }
    }
    
    return NULL;
        
    
}

/*
 8) 判断一个字符串是不是回文
 */
//char *str = "howwoh";
//int isRevesed =  isRevesedStr(str);
//printf("isRevesed = %d\n",isRevesed);

int isRevesedStr(char *str)
{
    int found = 1;
    if (str == NULL) {
        return -1;
    }
    
    char *p = str - 1;
    
    while (*++p !='\0');
    --p;
    while (*str== *p && str < p) {
        str++;
        p--;
    }
    if(str < p){
        found =0;
    }
    
    return found;
}

/*
 写一个函数,它的原形是int continumax(char *outputstr,char *intputstr)
 功能：
 在字符串中找出连续最长的数字串，并把这个串的长度返回，并把这个最长数字串付给其中一个函数参数outputstr所指内存。例如："abcd12345ed125ss123456789"的首地址传给intputstr后，函数将返回
 9，outputstr所指的值为123456789
 */

/*
 输入为
 char *inStr = "abcd12345ed125ss123456789";
 int l = (int)strlen(inStr);
 char *outStr = malloc(l);
 int len = continumax(outStr, inStr);
 printf("len = %d,outStr = %s\n",len,outStr);
 */

int continumax(char *outputstr,char *intputstr)
{
    char *inS = intputstr,*outS = outputstr,*temp = NULL,*final =NULL;
    int count = 0,maxlen = 0;
    while (*inS != '\0') {
        
        if(*inS >= '0' && *inS <= '9')
        {
            for (temp = inS; *inS >= '0' && *inS <= '9'; inS++) {
                count++;
            }
        }
        else
            inS++;
        if (maxlen < count) {
            maxlen = count;
            count = 0;
            final = temp;
        }
            
    }
    
    for (int i = 0; i < maxlen; i++) {
        *outS = *final;
        outS++;
        final++;
    }
    return maxlen;
}

//11) 编写一个 C 函数，该函数在一个字符串中找到可能的最长的子字符串，且该字符串是由同一字符组成的。
// char *cpSource = "hellowwwwddduuu";
//char ch = 'u';
//char *dest =   search(cpSource, ch);
//printf("ch = %c dest = %s\n",ch,dest);
char * search(char *cpSource,char ch)
{
    char *cpTemp=NULL, *cpDest = NULL;
    
    int iTemp, iCount=0;
    while(*cpSource)
    {
        if(*cpSource == ch)
        {
            iTemp = 0;
            cpTemp = cpSource;
            while(*cpSource == ch)
                ++iTemp, ++cpSource;
            if(iTemp > iCount)
                iCount = iTemp, cpDest = cpTemp;
            if(!*cpSource)
                break;
        }
        ++cpSource;
    }
    
    char *outStr = malloc(sizeof(char) *iCount);
    memcpy(outStr, cpDest, iCount);
    
    
    return outStr;
}

//给一个句子，翻转其中的每一个单词
void Reverse(char* pb , char* pe)    //将某一段字符串翻转过来
{
//    char *pl = pb;
//    char *pr = pe;
//    char ch;
//    while (pl < pr) {
//        ch = *pl;
//        *pl++ = *pr;
//        *pr-- = ch;
//    }
    
    char *pl = pb;
    char *pr = pe;
    char ch;
    while (pl < pr) {
        ch = *pl;
        *pl++= *pr;
        *pr--= ch;
    }
    
}

char * reverseSentence(char * pData)
{
//    if (pData == NULL) {
//        return NULL;
//    }
//    
//    char *pBegin = pData;
//    char *pEnd = pData;
//    while (*pEnd  != '\0') pEnd++;
//    pEnd--;
//    Reverse(pBegin, pEnd);
//    
//    pBegin = pEnd = pData;
//    while (*pEnd != '\0' && pEnd) {
//        while (*pEnd != ' ' &&*pEnd !='\0') pEnd++;
//        pEnd--;
//        Reverse(pBegin, pEnd);
//        ++pEnd;
//        while (*pEnd ==' ' && *pEnd !='\0') pEnd++;
//        pBegin = pEnd;
//    }
//    
//    return pData;
    
    if (pData == NULL) {
        return NULL;
    }
    
    char *pBegin = pData;
    char *pEnd = pData;
    while (*pEnd != '\0') pEnd++;
    pEnd--;
    Reverse(pBegin, pEnd);
    pBegin = pEnd = pData;
    while (*pEnd != '\0') {
        while (*pEnd != ' '&& *pEnd !='\0')pEnd++;
        pEnd--;
        Reverse(pBegin, pEnd);
        ++pEnd;
        while (*pEnd ==' '&& *pEnd !='\0')pEnd++;
        pBegin = pEnd;
    }
    return pData;
    

}









