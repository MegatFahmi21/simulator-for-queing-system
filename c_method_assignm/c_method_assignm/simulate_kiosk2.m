% calculate how many patients to be sent to kiosk 2
kiosk2_no_of_patients = floor(no_of_patients/2); % will always be half of the total patients

% distribute patients into kiosk 2
kiosk2_arrival_t = zeros(1,kiosk2_no_of_patients);

for (i = 1:length(kiosk2_arrival_t))
    kiosk2_arrival_t(i) = arrival_t(i*2);
end

% get kiosk 2 interarrival times

kiosk2_interarrival_t = zeros(1,kiosk2_no_of_patients);

for (i = 1:length(kiosk2_interarrival_t))
    kiosk2_interarrival_t(i) = interarrival_t(i*2);
end

% get kiosk 2 service times

kiosk2_service_t = zeros(1,kiosk2_no_of_patients);

for (i = 1:length(kiosk2_service_t))
    kiosk2_service_t(i) = service_t(i*2);
end

% calculate service begin times
kiosk2_service_begin_t = zeros(1,kiosk2_no_of_patients);
kiosk2_service_begin_t(1) = kiosk2_arrival_t(1);

for (i = 2:kiosk2_no_of_patients)
    if (kiosk2_arrival_t(i) < (kiosk2_service_begin_t(i-1) + kiosk2_service_t(i-1)))
        kiosk2_service_begin_t(i) = kiosk2_service_begin_t(i-1) + kiosk2_service_t(i-1);
    else
        kiosk2_service_begin_t(i) = kiosk2_arrival_t(i);
    end
end

% calculate service end times
kiosk2_service_end_t = zeros(1,kiosk2_no_of_patients);

for (i = 1:kiosk2_no_of_patients)
    kiosk2_service_end_t(i) = kiosk2_service_begin_t(i) + kiosk2_service_t(i);
end

% calculate queue times
kiosk2_queue_t = zeros(1,kiosk2_no_of_patients);

for (i = 1:kiosk2_no_of_patients)
    if (kiosk2_service_begin_t(i) ~= kiosk2_arrival_t(i))
        kiosk2_queue_t(i) = kiosk2_service_begin_t(i) - kiosk2_arrival_t(i);
    end
end

% calculate time in system
kiosk2_time_in_sys = zeros(1,kiosk2_no_of_patients);

for (i = 1:kiosk2_no_of_patients)
    kiosk2_time_in_sys(i) = kiosk2_service_end_t(i) - kiosk2_arrival_t(i);
end
