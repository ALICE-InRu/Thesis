function y=funs(x1,x2,type)


for i=1:length(x1),
  for j=1:length(x2)
    if strcmpi(type,'sphere')
      y(i,j)=x1(i)^2+x2(j)^2;
    elseif strcmpi(type,'nsphere')
      y(i,j)=x1(i)^2+x2(j)^2;
      err=normrnd(0,1,1,1); eps=0.1;
      y(i,j)=y(i,j)*(1+eps*err);
    elseif strcmpi(type,'rosen')
      y(i,j)=100*(x1(i)^2-x2(j))^2+(x1(i)-1)^2;
    elseif strcmpi(type,'schwefel')
      y(i,j)=x1(i)^2+(x1(i)+x2(j))^2;
    elseif strcmpi(type,'ellipsoid')
      y(i,j)=(100^((1-1)/(2-1))*x1(i))^2+(100^((2-1)/(2-1))*x1(i))^2;
    elseif strcmpi(type,'ackley')
      y(i,j)=20-20*exp(-0.2*sqrt(1/2*(x1(i)^2+x2(j)^2)))+exp(1)-exp(1/2*(cos(2*pi*x1(i))+cos(2*pi*x2(j))));
    elseif strcmpi(type,'rastrigin')
      y(i,j)=10*2+(x1(i)^2-10*cos(2*pi*x1(i)))+(x2(j)^2-10*cos(2*pi*x2(j)));
    end
  end
end

end