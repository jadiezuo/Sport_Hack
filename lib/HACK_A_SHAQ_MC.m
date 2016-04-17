% Q2Q3
% Monte Carlo Simulation
lambda1=0.4305;
lambda2=0.1778;
alpha1=0.179;
alpha2=0.509;
p=0.696;
NMCout=500;
NMCin=10000;
AttackDist=zeros(NMCout,1);
FreeThrowDist=zeros(NMCout,1);
Attack=zeros(NMCin,1);
FreeThrow=zeros(NMCin,1);  
    for it = 1:NMCin
        N1 = poissrnd(lambda1);
        N2 = poissrnd(lambda2);
        X1 = zeros(N1,1);
        X2 = zeros(N2,1);
        for i = 1:N2
            tempx = binornd(2,p);
            X2(i,1)=tempx;
        end
        for j = 1:N1
            tempu=rand;
            if tempu<alpha1
                X1(j,1)=3;
            elseif tempu<(alpha1+alpha2)&&tempu>alpha1
                X1(j,1)=2;
            else
                X1(j,1)=0;
            end
        end
    Attack(it,1)=sum(X1);
    FreeThrow(it,1)=sum(X2);
    end