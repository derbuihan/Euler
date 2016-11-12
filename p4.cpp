
#include <iostream>
#include <string>
#include <cmath>

#define SIZE 10000;
using namespace std;

int main() {
	
	int m = 0;
	for ( int i = 100; i < 1000; i++ ) {
		for ( int j = 100; j < 1000; j++ ) {
			int n = i * j;
			string s = to_string( n );
			if ( n < 100000 ) {
				if ( (s[0] == s[4]) && (s[1] == s[3]) ) {
					m = (m > n)? m: n;
				}
			}else{
				if ( (s[0] == s[5]) && (s[1] == s[4]) && (s[2] == s[3]) ) {
					m = (m > n)? m: n;
				}
			}
		}
	}
	cout << m << endl;


	return 0;
}
