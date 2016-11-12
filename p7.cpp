#include <iostream>
#include <cmath>

using namespace std;

int main() {
	int p[100000];
	int k = 0;
	for (int i = 1; i < 1000000; i += 2) {
		int j;
		for (j = 2; j < i; j++) {
			if (i % j == 0) {
				break;
			}
		}
		if (j == i) {
			p[k] = i;
			k++;
			if ( k == 10010) {
				break;
			}
		}
	}

	cout << p[9999] << endl;
	return 0;
}
