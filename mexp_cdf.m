function [y] = mexp_cdf(mexp,x)
	
	% File:  mexp_cdf.m
	% Description:
	% 	Generate based on x input cdf output
	% Input:	mexp, x
	% Output:	mexp F(x)

  y = 0;

  if (mexp.is_ME == 1)
	  B = mexp.B;
	  e = mexp.e;
	  p = mexp.p;
	  szB = size(B,1);
	  I = eye(szB);
    y = (p*expm(-B*x)*e);
  endif
end
