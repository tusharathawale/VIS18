function probability = yNegativeRFiniteStandard(k, a, b, c, d, p, critical, start, finish)

c1 = critical(1,1);
c2 = critical(1,2);
c3 = critical(1,3);
c4 = critical(1,4);

%  R strictly positive
if(start>0)
        probability = 0;
        
% R crosses zero
elseif (start <= 0) && (finish >0)
       if(c3 > 1)           
           % Changed this in the revision. Previous probability values is
           % commented
           %probability = -d/(k*(a - b)*(c - d));
           probability = 0;
       elseif (c3 <= 1) && (1 <= c4)
           % Changed this in the revision. Previous probability values is
           % commented
           %probability = -(d - k*log(d + k) + k*log((k^2 + p)/(b + k)))/(k*(a - b)*(c - d));
           % p4FiniteA           
           probability = (log(d + k) - log((k^2 + p)/(b + k)))/((a - b)*(c - d));
       elseif (c4 < 1)
           % Changed this in the revision. Previous probability values is
           % commented
           %probability = -(d + k*log(c + k) - k*log(d + k))/(k*(a - b)*(c - d));
           % p2FiniteB
           probability = -(log(c + k) - log(d + k))/((a - b)*(c - d));
       end
    
% R strictly negative
elseif (finish <= 0)
        if(c4 <= c2)
            
            if(c3 > 1)
                 probability = 0;
            elseif (c3 <= 1) && (1 < c4)
                % p4FiniteA
                 probability =(log(d + k) - log((k^2 + p)/(b + k)))/((a - b)*(c - d));
            elseif (c4 <= 1) && (1 < c2)
                % p2FiniteB
                probability = -(log(c + k) - log(d + k))/((a - b)*(c - d));
            elseif (c2 <= 1) && (1 <= c1)
                % p1FiniteB
                 probability = -(log(c + k) - log((k^2 + p)/(a + k)))/((a - b)*(c - d));
            elseif (c1 < 1) 
                probability = 0;
            end
            
        elseif (c2 < c4)
            
            if(c3 > 1)
                 probability = 0;
            elseif (c3 <= 1) && (1 < c2)
                 % p4FiniteA
                 probability = (log(d + k) - log((k^2 + p)/(b + k)))/((a - b)*(c - d));
            elseif (c2 <= 1) && (1 < c4)
                 % p3FiniteA
                 probability = (log((k^2 + p)/(a + k)) - log((k^2 + p)/(b + k)))/((a - b)*(c - d));
            elseif (c4 <= 1) && (1 <= c1)
                 % p1FiniteB
                 probability = -(log(c + k) - log((k^2 + p)/(a + k)))/((a - b)*(c - d));
            elseif (c1 < 1)
                 probability = 0;
            end
            
        end
    
end