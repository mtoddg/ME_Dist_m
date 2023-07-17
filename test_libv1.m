clear all
close all
more off

%define distributions
a = mexp("None");
b = mexp("Exp",4);

p = [.1 .9];
B = [3 0;0 8];
e = [1;1];

c = mexp("ME",p,B,e);

c = mexp_spectrum(c);


num_points = 100;
delta = .005;
mexp_plot(3,num_points,delta,4,b,"pdf",b ,"cdf",c,"pdf",c,"cdf");