#include <stdio.h>
int test_red()
{
	int a=10;
	int b=20;
	int c=0x10;
	return a+b+c;
}
int test_red_zone()
{
	int a=10;
	int b=20;
	int c=0x10;
	test_red();
	return a+b+c;
}
int main()
{
	printf("result %d\n",test_red_zone());
}
