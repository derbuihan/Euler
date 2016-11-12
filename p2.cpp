
#include <iostream>
using namespace std;
#define ARRAY_MAX 100000

int main() {
	int s = 2;
	int f[ARRAY_MAX];
	f[0] = 1;
	f[1] = 2;
	for ( int i = 2; i < ARRAY_MAX; i++ ) {
		f[i] = f[i - 1] + f[i - 2];
		cout << f[i] << endl;
		if(f[i] > 4000000){
			break;
		}
		if(f[i] % 2 == 0){
			s += f[i];
		}
	}

	cout << s << endl;
	return 0;
}
