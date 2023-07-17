function [ret] = mexp_plot(fig,np,del, numpl, m1, p1t, m2, p2t, m3, p3t, m4, p4t)
	
	% File:  mexp_plot.m
	% Description:
	% 	Generate plot with multiple traces based on mexp, pdf or cdf, num_points, and delta
	% Input:	mexp, pdf_cdf (1 or 0), num_points, delta
	% Output:	
  
  ret = 0;
  figure(fig);
  
    if(strcmp(p1t,"pdf"))
      p1 = 1;
    else
      p1 = 0;
    endif  
    if(strcmp(p2t,"pdf"))
      p2 = 1;
    else
      p2 = 0;
    endif
    if(strcmp(p3t,"pdf"))
      p3 = 1;
    else
      p3 = 0;
    endif
    if(strcmp(p4t,"pdf"))
      p4 = 1;
    else
      p4 = 0;
    endif
    
  if (numpl == 1)
    [desc,y,t] = mexp_trace(m1, p1, np, del);
    plot(t,y,"b-");
    legend(desc);
  elseif (numpl == 2)
    [desc,y,t] = mexp_trace(m1, p1, np, del);
    [desc2,y2,t2] = mexp_trace(m2, p2, np, del);
    plot(t,y,"b-",t2,y2,"r.");
    legend(desc,desc2);
  elseif (numpl == 3)
    [desc,y,t] = mexp_trace(m1, p1, np, del);
    [desc2,y2,t2] = mexp_trace(m2, p2, np, del);
    [desc3,y3,t3] = mexp_trace(m3, p3, np, del);
    plot(t,y,"b-",t2,y2,"r.",t3,y3,"g-");
    legend(desc,desc2,desc3);
  elseif (numpl == 4)
    [desc,y,t] = mexp_trace(m1, p1, np, del);
    [desc2,y2,t2] = mexp_trace(m2, p2, np, del);
    [desc3,y3,t3] = mexp_trace(m3, p3, np, del);
    [desc4,y4,t4] = mexp_trace(m4, p4, np, del);
    plot(t,y,"b-",t2,y2,"r.",t3,y3,"g-",t4,y4,"m-.");
    legend(desc,desc2,desc3,desc4); 
  endif
endfunction
