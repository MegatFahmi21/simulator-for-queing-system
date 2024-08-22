function output = find_service_time(rn, cdf, no_of_patients)

    if (rn > 0 && rn <= cdf(1)*100)
        service_times = 1;
    else
        for (i = 2:8)
            if (rn > cdf(i-1)*100 && rn <= cdf(i)*100)
                service_times = i;
            end
        end
    end

    output = service_times*10/2;
