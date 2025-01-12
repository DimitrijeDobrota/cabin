@title: Index sort
@date: 2025-01-12
@language: en
@categories: c++, algorithms, leetcode


# Index sort

Today I am going to share my all-time favorite algorithm with a lot of
flexibility and use cases. Say for example you need to sort an array but also
need to keep track of the original index for each element, or there are
multiple arrays that need to be sorted on the same criteria. This is where
index sorts steps in.


## Algorithm

```c++
#include <vector> // vector
#include <algorithm> // sort
#include <numeric> // iota

void do_something(const std::vector<int>& vec) {
    const int n = vec.size();

    static int idxs[100001];
    std::iota(idxs, idxs + n, 0);
    std::sort(idxs, idxs + n, [&](int i, int j) {
        return vec[i] < vec[j];
    });

    ...
}

void do_something(const std::vector<int>& vec1, std::vector<int>& vec2) {
    const int n = vec1.size(); // vec1.size() == vec2.size()

    static int idxs[100001];
    std::iota(idxs, idxs + n, 0);
    std::sort(idxs, idxs + n, [&](int i, int j) {
        return vec1[i] != vec1[j] ? vec1[i] < vec1[j] : vec2[i] < vec2[j];
    }); // sort based on vec1, or on vec2 if equal

    ...
}

```

The main idea of the algorithm is that instead of sorting the array itself, we
make a separate array that will represent all of the indices into the original
array, and then we sort them instead. Here are the steps:

1) In the examples above I've created a static array idxs, since I know the
maximum value of N. If that isn't the case a dynamic vector can be used
instead.
2) With the std::iota I fill the idxs array with numbers from 0 to n - 1
3) Use std::sort on idxs array with a custom comparator function, that indexes
into the original array(s). The result is an array of indices that is
rearranged in a way that represents the order that the original array
should be in order for it to be sorted.

The following snippets can be used to index both original and sorted array in
the way you see fit.

```C++
for (int i = 0; i < n; i++) {
	const int j = idxs[i];
	// i - position in the sorted array
	// j - position in the original array
}
```

```C++
#include <span> // C++20

for (const int i: std::span(idxs, n)) {
	// iterate over indices in original array, in sorted order
}
```


## Interesting Usage

### Minimum number of swaps to make array sorted

```C++

...

int res = 0;
for (int i = 0; i < n; i++) {
	while (idxs[i] != i) {
		swap(idxs[i], idx[idx[i]]);
		res++;
	}
}

return res;
```

This cute algorithm can be used to determine the number of swaps needed to sort
an array. It's complexity is O(n), but since we had to sort the index array
first, overall complexity is O(sort).

It leverages the fact that in one swap we can put the element in it's place,
since we know where it belongs. Element at position i, belongs at position
idxs[i], so we swap it with the element at position idxs[idxs[i]], to get it in
place. We repeat this procedure until the current position is satisfied, then
we go to the next position.


### Range compression

```C++

...

int cnt = 0;
vector<int> compressed(n);
for (int i = 1; i < n; i++) {
	if (idxs[i] != idxs[i - 1]) cnt++;
	compressed[idxs[i]] = cnt;
}

```

Sometimes we don't care about the values themselves, but about their relation
to one another (greater, less and equal). We can use this trick to compress the
range of values of any size, to the one sized at most N, for later use with some
special data structure like Segment Tree.

