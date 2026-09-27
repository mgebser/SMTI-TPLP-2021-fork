diff(D) :- D = #sum{1, M : man(M); -1, W : woman(W)}.

:~ diff(D). [|D|]
:~ diff(D), D <= 0, man(M), not prefer(1, M, 0). [2, M]
:~ diff(D), 0 < D, woman(W), not prefer(-1, W, 0). [2, W]
