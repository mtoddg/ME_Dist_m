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
      mexp = mexp_dist_ME(mexp, param1, param2, param3);
    endif
endfunction
