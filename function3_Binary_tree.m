function [h,nlabel]= unselect(new_label,nlabel,h)
for nn=1:h
   result = isequal(new_label,nlabel(nn,:));
    if result 
     nlabel(nn,:)=[];  
     h=h-1;
     break;
    end
end      
end
