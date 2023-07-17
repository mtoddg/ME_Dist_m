function [desc,y,t] = mexp_trace(mexp, pdf_cdf, num_points, delta)
	
	% File:  mexp_trace.m
	% Description:
	% 	Generate trace based on mexp, pdf or cdf, num_points, and delta
	% Input:	mexp, pdf_cdf (1 or 0), num_points, delta
	% Output:	y,t

  y = [];
  t = [];
  
  for i = 1:num_points
    t(i) = 0+i*delta;
    if (pdf_cdf == 1)
      y(i) = mexp_pdf(mexp,t(i));
      tempstr = "PDF ";
    else
      y(i) = mexp_cdf(mexp,t(i));
      tempstr = "CDF ";
    endif
  endfor  

  desc = strcat(tempstr,"-",mexp.comment);
end
