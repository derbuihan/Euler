
#include <iostream>
#include <cmath>

using namespace std;

int main() {
	int p[100000];
	p[0] = 2;
	int k = 0;
	for (int i = 1; i < 2000100; i += 2) {
		int j;
		for (j = 2; j < i; j++) {
			if (i % j == 0) {
				break;
			}
		}
		if (j == i) {
			k++;
			p[k] = i;
		}
	}
	int i = 0;
	long m = 0;
	while ( p[i] <= 10 ) {
		m += p[i];
		i++;
	}
	cout << m << endl;
	return 0;
}
