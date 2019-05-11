function probability = yNegativeRInfiniteFlipped(k, a, b, c, d, p, critical, start, finish)

c1 = critical(1,1);
c2 = critical(1,2);
c3 = critical(1,3);
c4 = critical(1,4);

%  R strictly positive
if(start>0)
    % p6InfiniteB
    probability = -(log(c + k) - log(d + k))/((a - b)*(c - d));
    
% R crosses zero
elseif (start <= 0) && (finish >0)
    if c3 > 1
       % p6InfiniteB
       probability = -(log(c + k) - log(d + k))/((a - b)*(c - d));
    elseif (c3 <= 1) && (1 <= c4)
       % p5InfiniteB
       probability = -(log(c + k) - log((k^2 + p)/(a + k)))/((a - b)*(c - d));
    elseif (c4 < 1)
       probability = 0;
    end
        
% R strictly negative
elseif (finish <= 0)
    if (c4 < c2)
        
        if(c3 > 1)
            % p6InfiniteB
             probability = -(log(c + k) - log(d + k))/((a - b)*(c - d));
            
        elseif (c3 <= 1) && (1< c4)     
            % p5InfiniteB
             probability =-(log(c + k) - log((k^2 + p)/(a + k)))/((a - b)*(c - d));
            
        elseif (c4 <= 1) && (1 < c2)
            % p3InfiniteA
               probability =0;
            
        elseif (c2 <= 1) && (1 <= c1)
             % p2InfiniteA
              probability =(log(d + k) - log((k^2 + p)/(b + k)))/((a - b)*(c - d));
             
        elseif (c1 < 1)
             % p1Infinite
              probability =-(log(c + k) - log(d + k))/((a - b)*(c - d));
             
        end
            
    elseif (c2 < c4)
        
        if(c3 > 1)
            % p6InfiniteB
             probability =-(log(c + k) - log(d + k))/((a - b)*(c - d));
             
        elseif (c3 <= 1) && (1< c2) 
            % p5InfiniteB
              probability =-(log(c + k) - log((k^2 + p)/(a + k)))/((a - b)*(c - d));
            
        elseif (c2 <= 1) && (1 < c4)
            % p4InfiniteB
              probability =-(log(c + k) - log(d + k) - log((k^2 + p)/(a + k)) + log((k^2 + p)/(b + k)))/((a - b)*(c - d));
            
        elseif (c4 <= 1) && (1 <= c1)
            % p2InfiniteA
               probability =(log(d + k) - log((k^2 + p)/(b + k)))/((a - b)*(c - d));
             
        elseif (c1 < 1)
            % p1Infinite
               probability =-(log(c + k) - log(d + k))/((a - b)*(c - d));
             
        end        
    end   
end