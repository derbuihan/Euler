#include<iostream>
#include<cmath>

using namespace std;

int main() {
	for ( int n = 2 ; n < 2017 ; n ++ ) {
		long s = 0;
		for ( int i = 0 ; i < 20 ; i ++ ) {
			s += pow ( n , i );
			for ( int j = 1 ; j < 100000; j ++ ) {
				if (2017 * j == s) {
					printf("%d,%d\n",n,i);
				}
			}
		}
	}
}
