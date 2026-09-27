sign(-1;1).

bound(O, 1..B) :- sign(O), B = #count{P, R : acceptable(O, P, R), 1 < R}.

:~ bound(O, B), B #sum{1, P, R : prefer( O, P, R), 0 < R;
                      -1, P, R : prefer(-O, P, R), 0 < R}. [1, B]
