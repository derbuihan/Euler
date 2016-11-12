
#include <iostream>
using namespace std;

int main() {
	int s;
	for ( int i = 1; i < 1000; i ++ ) {
		if ( i % 3 == 0 ) {
			s += i;
		}
		if ( i % 5 == 0 ) {
			s += i;
		}
		if ( i % 15 == 0 ) {
			s -= i;
		}
	}
	cout << s << endl;
	return 0;
}
