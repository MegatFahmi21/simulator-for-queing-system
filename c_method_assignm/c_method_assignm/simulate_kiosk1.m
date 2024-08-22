% calculate how many patients to be sent to kiosk 1
if (mod(no_of_patients, 2) ~= 0)                         % if no_of_patients is odd, then kiosk 1 will have half of the total patients plus one,
    kiosk1_no_of_patients = floor(no_of_patients/2 + 1); % e.g. if no_of_patients = 15, then kiosk1_no_of_patients = 15/2 + 1 = 8
else
    kiosk1_no_of_patients = floor(no_of_patients/2);     % else, kiosk 1 will have half of the total patients
end

% get kiosk 1 interarrival times

kiosk1_interarrival_t = zeros(1,kiosk1_no_of_patients);

for (i = 1:length(kiosk1_interarrival_t))
    kiosk1_interarrival_t(i) = interarrival_t((i-1)*2+1);
end

% get kiosk 1 service times

kiosk1_service_t = zeros(1,kiosk1_no_of_patients);

for (i = 1:length(kiosk1_service_t))
    kiosk1_service_t(i) = service_t((i-1)*2+1);
end

% distribute patients into kiosk 1
kiosk1_arrival_t = zeros(1,kiosk1_no_of_patients);

for (i = 1:length(kiosk1_arrival_t))
    kiosk1_arrival_t(i) = arrival_t((i-1)*2+1);
end

% calculate service begin times
kiosk1_service_begin_t = zeros(1,kiosk1_no_of_patients);

for (i = 2:kiosk1_no_of_patients)
    if (kiosk1_arrival_t(i) < (kiosk1_service_begin_t(i-1) + kiosk1_service_t(i-1)))
        kiosk1_service_begin_t(i) = kiosk1_service_begin_t(i-1) + kiosk1_service_t(i-1);
    else
        kiosk1_service_begin_t(i) = kiosk1_arrival_t(i);
    end
end

% calculate service end times
kiosk1_service_end_t = zeros(1,kiosk1_no_of_patients);

for (i = 1:kiosk1_no_of_patients)
    kiosk1_service_end_t(i) = kiosk1_service_begin_t(i) + kiosk1_service_t(i);
end

% calculate queue times
kiosk1_queue_t = zeros(1,kiosk1_no_of_patients);

for (i = 1:kiosk1_no_of_patients)
    if (kiosk1_service_begin_t(i) ~= kiosk1_arrival_t(i))
        kiosk1_queue_t(i) = kiosk1_service_begin_t(i) - kiosk1_arrival_t(i);
    end
end

% calculate time in system
kiosk1_time_in_sys = zeros(1,kiosk1_no_of_patients);

for (i = 1:kiosk1_no_of_patients)
    kiosk1_time_in_sys(i) = kiosk1_service_end_t(i) - kiosk1_arrival_t(i);
end
