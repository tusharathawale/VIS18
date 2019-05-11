% k = isovalue, X~[a,b], Y~[c,d], p = kx+ky+xy for some X=x and Y=y, domainContinuous:(whether domain of R is continuous or not)
% order:(standard/flipped), critical: corner positions of the joint density of Y and R (Fig. 6), R~[start,finish]
% range of random variable Y is strictly positive

function probability = getYstrictlyPositiveDistribution(k, a, b, c, d, p, domainContinuous, order, critical, start, finish)

% Initialize probability
probability = 0;


% Non-breaking R domain cases (Fig. 5a)
if (domainContinuous == 1)

    if (strcmp(order,'standard'))
        probability = yPositiveRFiniteStandard(k, a, b, c, d, p, critical, start, finish);
    elseif (strcmp(order,'flipped'))
        probability = yPositiveRFiniteFlipped(k, a, b, c, d, p, critical, start, finish);
    end    
% Breaking R domain cases (Fig. 5b)
% In case of breaking domain space between start and finish is empty
elseif (~domainContinuous)
    
    if (strcmp(order,'standard'))
        probability = yPositiveRInfiniteStandard(k, a, b, c, d, p, critical, start, finish);
    elseif (strcmp(order,'flipped'))
        probability = yPositiveRInfiniteFlipped(k, a, b, c, d, p, critical, start, finish);
    end
    
end



