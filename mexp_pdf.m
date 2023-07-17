function [y] = mexp_pdf(mexp,x)
	
	% File:  mexp_pdf.m
	% Description:
	% 	Generate based on x input pdf output
	% Input:	mexp, x
	% Output:	mexp f(x)

  y = 0;

  if (mexp.is_ME == 1)
	  B = mexp.B;
	  e = mexp.e;
	  p = mexp.p;
	  szB = size(B,1);
	  I = eye(szB);
    y = (p*B*expm(-B*x)*e);
    
  endif
end
