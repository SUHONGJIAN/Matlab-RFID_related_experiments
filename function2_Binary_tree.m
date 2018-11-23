function [new_label2,new_n]=select(new_label,new_bit,new_max,nn)
new_n=0;
for a=1:nn
      if new_label(a,new_max)==new_bit(new_max)
       new_n=new_n+1;
       new_label2(new_n,:)=new_label(a,:);  
      else
      end
end
end    
