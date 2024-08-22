function output = find_interarrival_time(rn, cdf, no_of_patients)

    if (rn > 0 && rn <= cdf(1)*100)
        interarrival_times = 1;
    else
        for (i = 2:4)
            if (rn > cdf(i-1)*100 && rn <= cdf(i)*100)
                interarrival_times = i;
            end
        end
    end

    output = interarrival_times;
