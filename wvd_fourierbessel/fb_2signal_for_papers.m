close all ;

tic

rn=0;

% for j=1:100

for i=1:500
    sig1(i)=(cos(9*pi*(i*i)/30000+.6*i)+cos(0.0009443*(i*i)+1.883*i))/100;
end


sig=sig1;

f=abs(fb1(sig'));
N=length(sig);

[F1_r , F2_r]=fb_seperation(sig,100,260,291,450); %sig1


wd=abs(tfrwv(hilbert(F1_r'))+tfrwv(hilbert(F2_r')));

wd=wd/max(max(wd));

rn1=rn_c_sig1(wd);

% end

% rn1=sum(rn)/100


toc


figure; contour(1:N,(1:N)./(N*2),abs(wd),5);
xlabel('Time','FontSize',14);
ylabel('Frequency','FontSize',14);
%set(gca,'Xdir','reverse','FontSize',13);
set(gca,'FontSize',13);
set(gca,'xtick',0:50:500);
set(gca,'ytick',0:.05:.5);
ylim([0 .50001])
grid on;
% fb4_0=wd;
% save('tf_ops','fb4_0','-append')
