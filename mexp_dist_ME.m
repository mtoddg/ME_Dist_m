% Usage:  m = mexp_dist_ME(mexp, param1, param2, param3)
% File:  mexp_dist_exp.m
%
% Description:
% 	Creates ME distribution
%
% Arguments:
%   mexp - empty Distribution object
%	
% Output:
% 	mexp - Distribution object
%
% Parameters:
%   param1 - p matrix
%   param2 - B matrix
%   param3 - e matrix


function [mexp] = mexp_dist_ME (mexp, param1, param2, param3)
    mexp.type_num = 100;
    mexp.type_txt = "ME";
    
    % ME Parameters
    mexp.p = [param1];
    mexp.B = [param2];
    mexp.e = [param3];
    mexp.is_ME = 1;
    
    % Traditional Parameters
    mexp.rate = 0;
    mexp.shape = 0;
    %mexp = mexp.proc(mexp);
    mexp = mexp_proc(mexp);
      
    tempstr = "";
    for i = 1:mexp.me.size
      for j = 1:mexp.me.size
        tempstr = strcat(tempstr,num2str(mexp.B(i,j)),"-");
      endfor
      tempstr = strcat(tempstr,"/");
    endfor
    mexp.comment = strcat(mexp.type_txt,"-",tempstr);

endfunction
