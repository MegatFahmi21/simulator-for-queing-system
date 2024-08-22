function output = stats (kiosk_num, no_of_patients, queue_t, service_t, interarrival_t, time_in_sys)

    printf('\n');
    printf('  STATISTICS [KIOSK %1d]: \n', kiosk_num);

    avg_queue_t = sum(queue_t) / no_of_patients;
    printf('    average queue time ................ %0.2f minutes\n', avg_queue_t);

    total_patients_with_nonzero_queue_t = 0;
    for (i = 1:no_of_patients)
        if (queue_t(i) ~= 0)
            total_patients_with_nonzero_queue_t = total_patients_with_nonzero_queue_t + 1;
        end
    end
    prob_wait_in_queue = total_patients_with_nonzero_queue_t / no_of_patients;
    printf('    probablity of waiting in queue .... %0.3f\n', prob_wait_in_queue);

    avg_service_t = sum(service_t) / no_of_patients;
    printf('    average service time .............. %0.2f minutes\n', avg_service_t);

    avg_interarrival_t = sum(interarrival_t) / no_of_patients;
    printf('    average interarrival time ......... %0.3f minutes\n', avg_interarrival_t);

    avg_time_in_sys = sum(time_in_sys) / no_of_patients;
    printf('    average time in system ............ %0.2f minutes\n', avg_time_in_sys);

    printf('\n');
