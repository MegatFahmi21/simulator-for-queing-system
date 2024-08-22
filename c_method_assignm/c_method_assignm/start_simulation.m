% generate interarrival times using rn
interarrival_t = zeros(1,no_of_patients);

if (rn_type == 2)
    interarrival_rn = rvg_uniform(no_of_patients); % rvg_uniform(n)
else
    interarrival_rn = lcg(11,rand(4,99),7,100,no_of_patients); % lcg(a,rn,c,m,n)
end
interarrival_t(1) = 0;

for (i = 2:no_of_patients)
    interarrival_t(i) = find_interarrival_time(interarrival_rn(i), interarrival_t_cdf, no_of_patients)*2;
end

% calculate arrival times
arrival_t = zeros(1,no_of_patients);

for (i = 2:no_of_patients)
    arrival_t(i) = arrival_t(i-1) + interarrival_t(i);
end

% generate service times using rn
service_t = zeros(1,no_of_patients);

if (rn_type == 2)
    rn = rvg_uniform(no_of_patients); % rvg_uniform(n)
else
    rn = lcg(11, rand(4, 99), 7, 100, no_of_patients); % lcg(a,rn,c,m,n)
end    

service_t_cdf = kiosk1_cdf; % fix this later! service time tied to kiosk 1

for (i = 1:no_of_patients)
    service_t(i) = find_service_time(rn(i), service_t_cdf, no_of_patients);
end

% simulate for kiosk 1
simulate_kiosk1;    % call simulate_kiosk1.m

% simulate for kiosk 2
simulate_kiosk2;    % call simulate_kiosk2.m

% display simulation messages
printf('\n');
simulation_messages;    % call simulation_messages.m

% final output table for kiosk 1
printf    ('\n  KIOSK 1:\n');
printf    ('+-------------+-----------------+-----------------+------------+------------+------------+------------------+----------------+----------+--------------+\n');
printf    ('| patient no. | rn interarrival | interarrival t. | arrival t. | rn service | service t. | service begin t. | service end t. | queue t. | time in sys. |\n');
printf    ('|-------------|-----------------|-----------------|------------|------------|------------|------------------|----------------|----------|--------------|\n');
printf    ('|         %3d |               - |             %3d |        %3d |        %3d |        %3d |              %3d |            %3d |      %3d |          %3d |\n', 1, interarrival_t(1), arrival_t(1), rn(1), service_t(1), 0, kiosk1_service_end_t(1), kiosk1_queue_t(1), kiosk1_time_in_sys(1));
printf    ('|-------------|-----------------|-----------------|------------|------------|------------|------------------|----------------|----------|--------------|\n');
for (i = 2:kiosk1_no_of_patients)
    printf('|         %3d |             %3d |             %3d |        %3d |        %3d |        %3d |              %3d |            %3d |      %3d |          %3d |\n', (i-1)*2+1, interarrival_rn((i-1)*2+1), interarrival_t((i-1)*2+1), kiosk1_arrival_t(i), rn(i), kiosk1_service_t(i), kiosk1_service_begin_t(i), kiosk1_service_end_t(i), kiosk1_queue_t(i), kiosk1_time_in_sys(i));
    printf('|-------------|-----------------|-----------------|------------|------------|------------|------------------|----------------|----------|--------------|\n');
end

stats(1, kiosk1_no_of_patients, kiosk1_queue_t, kiosk1_service_t, kiosk1_interarrival_t, kiosk1_time_in_sys);

% final output table for kiosk 2
printf    ('\n  KIOSK 2:\n');
printf    ('+-------------+-----------------+-----------------+------------+------------+------------+------------------+----------------+----------+--------------+\n');
printf    ('| patient no. | rn interarrival | interarrival t. | arrival t. | rn service | service t. | service begin t. | service end t. | queue t. | time in sys. |\n');
printf    ('|-------------|-----------------|-----------------|------------|------------|------------|------------------|----------------|----------|--------------|\n');
for (i = 1:kiosk2_no_of_patients)
    printf('|         %3d |             %3d |             %3d |        %3d |        %3d |        %3d |              %3d |            %3d |      %3d |          %3d |\n', i*2, interarrival_rn(i*2), interarrival_t(i*2), kiosk2_arrival_t(i), rn(i), kiosk2_service_t(i), kiosk2_service_begin_t(i), kiosk2_service_end_t(i), kiosk2_queue_t(i), kiosk2_time_in_sys(i));
    printf('|-------------|-----------------|-----------------|------------|------------|------------|------------------|----------------|----------|--------------|\n');
end

stats(2, kiosk2_no_of_patients, kiosk2_queue_t, kiosk2_service_t, kiosk2_interarrival_t, kiosk2_time_in_sys);
