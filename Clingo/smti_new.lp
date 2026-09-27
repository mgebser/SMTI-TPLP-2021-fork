% DEFINE

% acceptability
acceptable(M, W, RM, RW) :- man(M), woman(W), mrank(M, W, RM), wrank(W, M, RW).
acceptable( 1, M, RM)    :- acceptable(M, W, RM, RW).
acceptable(-1, W, RW)    :- acceptable(M, W, RM, RW).

% GENERATE

% generate matching
{marry(M, W)} :- acceptable(M, W, RM, RW).

% preferred/lower ranks w.r.t. matching (preferred rank 0 indicates non-singles)
prefer( 1, M, RM-1) :- acceptable(M, W, RM, RW), marry(M, W).
prefer(-1, W, RW-1) :- acceptable(M, W, RM, RW), marry(M, W).
prefer( O, P, R-1)  :- prefer(O, P, R), 0 < R.

% ensure monogamy
:- acceptable(M, W, RM, RW), marry(M, W), prefer( 1, M, RM).
:- acceptable(M, W, RM, RW), marry(M, W), prefer(-1, W, RW).
:- acceptable( 1, M, RM), 2 #count{W : acceptable(M, W, RM, RW), marry(M, W)}.
:- acceptable(-1, W, RW), 2 #count{M : acceptable(M, W, RM, RW), marry(M, W)}.

% forbid blocking pairs
:- acceptable(M, W, RM, RW), prefer(1, M, RM), prefer(-1, W, RW).
:- acceptable(M, W, RM, RW), prefer(1, M, RM), not prefer(-1, W, 0).
:- acceptable(M, W, RM, RW), prefer(-1, W, RW), not prefer(1, M, 0).
:- acceptable(M, W, RM, RW), not prefer(1, M, 0), not prefer(-1, W, 0).

% SHOW

#show marry/2.
#show msingle(M) : man(M), not prefer(1, M, 0).
#show wsingle(W) : woman(W), not prefer(-1, W, 0).
