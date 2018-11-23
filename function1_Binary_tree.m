function [bit,D_max]=request(new_label,new_n)
bit=ones(1,8);
 
 for k=1:8
   sum=0;
  for jj=1:new_n
  sum=sum+new_label(jj,k);    
  end
  if sum==0
        bit(1,k)=0;
    elseif sum==new_n 
        bit(1,k)=1;
    else        
        D_max=k;
        bit(1,k)=0;
        break;
  end
 end
end

