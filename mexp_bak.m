% Usage:  m = mexp(type_txt, param1, param2,... param4)
% File:  mexp.m
%
% Description:
% 	Constructor for mexp.  Creates distribution with support for a
%   variety of probability distributions and support for 
%   Matrix-Exponential distributions also.
%
% Arguments:
%   type_txt = See Below
%	
% Output:
% 	mexp - Distribution object
%
% Parameters:
%   type_txt (type_num)
%     "None" (0) - empty distribution
%     "Exp" (1)  - Exponential
%     "ME" (100) - with no underlying trad dist


function [mexp] = mexp (type_txt, param1, param2, param3, param4)
  
    % default - empty distribution
    mexp.comment = "empty distribution";
    mexp.type_num = 0;
    mexp.type_txt = type_txt;
    mexp.is_ME = 0;
    
    % ME Parameters - Without change, defaults to exp dist with rate of 1.0
    mexp.p = [1];
    mexp.B = [1];
    mexp.e = [1];
    
    % Traditional Parameters - Without change, default to 0
    mexp.rate = 0;
    mexp.shape = 0;

    
    % Load distributions
    % Exponential %
    if (strcmp(type_txt,"Exp"))
      mexp = mexp_dist_exp(mexp,param1);
    endif
    
    % Matrix-Exponential
    if (strcmp(type_txt,"ME"))
      mexp.type_num = 100;
      mexp.type_txt = type_txt;
    
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
    
    endif
    
endfunction
