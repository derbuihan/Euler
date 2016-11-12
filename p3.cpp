
#include <iostream>
#include <cmath>

#define SIZE 10000;
using namespace std;

long long int n = 600851475143;

int main() {
	int p[100000];
	int k = 0;
	for (int i = 1; i < 10000; i += 2) {
		int j;
		for (j = 2; j < i; j++) {
			if (i % j == 0) {
				break;
			}
		}
		if (j == i) {
			p[k] = i;
			k++;
		}
	}

	for ( int i = 1; i < k; i++ ){
		if ( n % p[i] == 0 ) {
			cout << p[i] << endl;
		}
	}

	return 0;
}
