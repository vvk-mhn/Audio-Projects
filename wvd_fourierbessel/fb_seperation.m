function [F1_r , F2_r]=fb_seperation(f,s1,e1,s2,e2)


a=length(f);

nb=1:a;

alfa=bessel_roots(a);
a3=zeros(1,a);
%decomposition into bessel coeficients
for m1=1:a
    a3(m1)=(2/(a^2*(besselj(1,alfa(m1))).^2))*sum(nb.*f.*besselj(0,alfa(m1)/a*nb));
end
%figure; plot(a3);

%Reconstructions of first part
F1_r=zeros(1,a);
F2_r=zeros(1,a);

for mm=1:a
    g1_r=(alfa(s1:e1))/a ;
    F1_r(mm)=sum(a3(s1:e1).*besselj(0,g1_r*mm));
end

%Reconstructions of second part
for mm=1:a
    g2_r=(alfa(s2:e2))/a ;
    F2_r(mm)=sum(a3(s2:e2).*besselj(0,g2_r*mm));
end


end
