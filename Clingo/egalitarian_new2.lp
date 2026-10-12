diff(D) :- D = #sum{1, M : man(M); -1, W : woman(W)}.

:~ prefer(O, P, R), 0 < R. [1, O, P, R]
:~ prefer(1, M, 0), diff(D), D <= 0. [2, M]
:~ prefer(-1, W, 0), diff(D), 0 < D. [2, W]
