% Usage:  m = mexp_dist_exp(mexp, param1)
% File:  mexp_dist_exp.m
%
% Description:
% 	Creates simple exponential distribution
%
% Arguments:
%   mexp - empty Distribution object
%	
% Output:
% 	mexp - Distribution object
%
% Parameters:
%   param1 - rate

function [mexp] = mexp_dist_exp (mexp, param1)
    mexp.type_num = 1;
    mexp.type_txt = "Exp";
    
    % ME Parameters
    mexp.B = [param1];
    mexp.e = [1];
    mexp.p = [1];
    mexp.is_ME = 1;
    
    % Traditional Parameters
    mexp.rate = param1;
    mexp.shape = 0;
    %mexp = mexp.proc(mexp);
    mexp = mexp_proc(mexp);
    mexp.comment = strcat(mexp.type_txt,"-",num2str(mexp.B));

endfunction
