#include<incmode>.

sign(-1;1).

#program check(b).

:- sign(O), query(b), b+1 #sum{1, P, R : prefer( O, P, R), 0 < R;
                              -1, P, R : prefer(-O, P, R), 0 < R}.
