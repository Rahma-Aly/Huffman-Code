clc;
clear;
p = input('please enter the sybmols probability between 2 brackets []:');
N = length(p);
%----------------------Sorting the input probabilities -----------------%
sorted_p  = sort(p,'descend');
%----------------------- creating the probability matrix -----------------%
i = 1;
sorted_pn = zeros(N-1,N); % contains all calculated probabilities 
sorted_pn(i,:) = sorted_p;
smallest_elements = zeros(N-2,2); %contains the smallest 2 elements after each calculation
while (length(sorted_p) > 2)
    smallest_elements (i,:) = [sorted_p(end) sorted_p(end-1)];
    sumSmallest_p(i) = sorted_p(end)+ sorted_p(end-1);
    sorted_p = sort([sorted_p(1:end-2) sumSmallest_p(i)],'descend');
    sorted_pn(i+1, 1:end-i) = sorted_p;
    i = i+1;
end
%--------------------------------encoding the data---------------------%
coded_p = string(zeros(N-1,N));
coded_p(N-1,2) = 1;
for (i = N-2:-1:1)
    x = find(sorted_pn(i,:) == smallest_elements(i,1)); %location of smallest p in previous row
    y = find(sorted_pn(i+1,:) == sumSmallest_p(i)); %location of sum of smallest elements
    for k = 1:N
      for f = find(sorted_pn(i+1,:))
            if (sorted_pn(i,k) == sorted_pn(i+1,f))
                 coded_p(i, k) = coded_p(i+1,f);
            end
      end
    end   
    coded_p(i,x(end)) = append(coded_p(i+1,y(1)),'1');
    coded_p(i,x(end)-1) = append(coded_p(i+1,y(1)),'0');

end   
fprintf("The encoded symbols are:\n")
for (i = 1:N)
fprintf(" %f : %s\n",p(i),coded_p(1,i))
end
 


