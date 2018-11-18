#include <iostream>
#include <list>

using namespace std;

void swap_element(list<int> &);

int main () {
    int x;
    list<int> list;
    
    while ( cin >> x ) {
        list.push_back(x);
    }

    swap_element(list);

    const char * s = " ", * c = ""; 
    for(auto l : list) { cout << c << l; c=s;}
    cout << endl;
    return 0;
}

void swap_element(list<int> & list) {
    typename list<int>::iterator i_0 = list.begin();
    typename list<int>::iterator i_2 = list.begin();

    if ( ! list.size() ) return;
    
    int j = 2;
    while (j-- != 0)
	if ( ++i_2 == list.end() ) return;

    // Seems like elements should be swapped only once
    // 1->2->3->4->5 <=> 3->4->1->2->5
    int c = 0, k = 0;
    for(;i_2 != list.end(); ++i_0, ++i_2, ++c) {
	if (k == 1 || c == 2) {
	    if (k == 0) {
		k = 1;
		c = 0;
	    }
	    if (c < 2) continue;
	    k = c = 0;
	}
	int x = *i_0;
	*i_0 = *i_2;
	*i_2 = x;
    }
}
