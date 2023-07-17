function [mexp] = mexp_proc(mexp)
	
	% File:  mexp_proc.m
	% Description:
	% 	Calculates moments of Matrix Exp Dist (ME)
	%		defined by <p,B,e>.
  %   Also finds data about trad dists
	% Input:	mexp - ME defined by <p,B,e>
	% Output:	mexp - ME defined by <p,B,e> with moments, C2 added


  if (mexp.is_ME == 1)
	  B = mexp.B;
	  e = mexp.e;
	  p = mexp.p;
	  szB = size(B,1);
	  I = eye(szB);

	  V = inv(B);
	  m1 = p*V*e
	  m2 = 2*p*V*V*e
	  m3 = 6*p*V*V*V*e
	  m4 = 24*p*V*V*V*V*e;
	
	  vrc = m2 - m1^2;
	  c2 = vrc/m1^2;
	  %rate = 1/m1;
	
	  mexp.me.V = V;
	  mexp.me.m1 = m1;
	  mexp.me.m2 = m2;
	  mexp.me.m3 = m3;
	  mexp.me.m4 = m4;
	 	mexp.me.vrc = vrc;
	  mexp.me.c2 = c2;
	  mexp.me.I = I;
	  %mexp.rate = rate;
	  mexp.me.size = szB;
  endif
end
