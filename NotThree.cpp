#include <iostream>

using namespace std;

int main () {
    int m=0, n=0, x = 0, r = 3;
    cin >> m;

    int * list = new int[m];
    
    while ( cin >> x ) {
        list[n++]=x;
        if ( n == m ) break;
    }

    int c=0, i = 0;
    for( i = 0; i < n; i++ ) {
        if ( c == 0 || list[i-1] == list[i] ) {
            c++;
        } else if ( c < r ) {
            break;
        }
	if ( c == r ) {
            c = 0;
        }
    }

    if (c != 0) cout << list[i-1] << endl;

    delete list;

    return 0;
}
