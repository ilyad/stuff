/* extern "C" { int x; } */
extern int x;
int *p1 = &x;
int *p2 = &x;

extern int *a_x;
extern int *b_x;

#include <stdio.h>
int main()
{
    printf("x=*%p=%d\n", &x, x);
    printf("*p1=*%p=%d\n", p1, *p1);
    printf("*p2=*%p=%d\n", p2, *p2);
    printf("a_x=%p\n", a_x);
    printf("b_x=%p\n", b_x);
    return 0;
}
