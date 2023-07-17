function [mexp] = mexp_spectrum(mexp)
	
	B = mexp.B;
	p = mexp.p;
	e = mexp.e;
	
	[V,lam] = eig(B);
	Px = p*V;
	Ex = inv(V)*e;
	comp = [];
	compnum = 0;
	for i = 1:mexp.me.size
		al(i) = Px(i)*Ex(i);
		ev(i) = lam(i,i);
		
		'spectrum'
		imag(ev(i));
		if (imag(ev(i)) == 0)
			% real component
			'here'
			c.exp = real(ev(i));
			c.freq = imag(ev(i));
			c.realp = real(al(i));
			c.imagp = imag(al(i));
			c.a = c.realp;
			c.b = c.imagp;
			c.c = c.exp;
			c.d = c.freq;
      c.A = sqrt(c.a^2 + c.b^2);
 			%c.theta =  atan(-(c.a*c.d+c.b*c.c)/(c.a*c.c-c.b*c.d));
      c.theta = atan(c.b/c.a);
      c.psi = atan(-(c.d/c.c));
      c.B = sqrt(c.c^2 + c.d^2);
      c.H = sqrt((c.a*c.c-c.b*c.d)^2 + (c.a*c.d+c.b*c.c)^2);
      c.phi = atan((c.a*c.c-c.b*c.d)/(c.a*c.d+c.b*c.c));
      comp = [comp c];
		end
			
		if (imag(ev(i)) != 0)
			% real component
			'here2'
			compnum=compnum + 1;
			c.exp = real(ev(i));
			c.freq = imag(ev(i));
			c.realp = real(al(i));
			c.imagp = imag(al(i));
			c.a = c.realp;
			c.b = c.imagp;
			c.c = c.exp;
			c.d = c.freq;
      c.A = sqrt(c.a^2 + c.b^2);
 			%c.theta =  atan(-(c.a*c.d+c.b*c.c)/(c.a*c.c-c.b*c.d));
      c.theta = atan(c.b/c.a);
      c.psi = atan(-(c.d/c.c));
      c.B = sqrt(c.c^2 + c.d^2);
      c.H = sqrt((c.a*c.c-c.b*c.d)^2 + (c.a*c.d+c.b*c.c)^2);
      c.phi = atan((c.a*c.c-c.b*c.d)/(c.a*c.d+c.b*c.c));
			comp = [comp c];
		end		
	mexp.ev = ev;
	mexp.al = al;
	mexp.lam = lam;
	mexp.comp = comp;


end