function a3=fb1(s)
%  y=4.*cos((2*pi/8*n).*n/256)+4.*cos(((2*pi.*(512-n)./8)+40).*n/256);
MM=length(s); %order of FB expansion
%computation of roots of bessel function Jo(x)
if exist('alfa') == 0
    x=2;
    alfa=zeros(1,MM);
    for i=1:MM
        ex=1;
        while abs(ex)>.00001
            ex=-besselj(0,x)/besselj(1,x);
            x=x-ex;
        end
        alfa(i)=x;
        %fprintf('Root # %g  = %8.5f ex = %9.6f \n',i,x,ex)
        x=x+pi;
    end
end
 
 
N=length(s);
nb=1:N;
 
 
a=N;
 
for m1=1:MM
    a3(m1)=(2/(a^2*(besselj(1,alfa(m1))).^2))*sum(nb.*s'.*besselj(0,alfa(m1)/a*nb));
end
end