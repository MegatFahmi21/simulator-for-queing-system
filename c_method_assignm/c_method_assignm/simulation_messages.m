patients_left               = no_of_patients;
current_t                   = 0;
kiosk1_already_left_index   = 0;
kiosk1_already_served_index = 0;
kiosk2_already_left_index   = 0;
kiosk2_already_served_index = 0;

if (kiosk1_service_end_t(kiosk1_no_of_patients) >= kiosk2_service_end_t(kiosk2_no_of_patients))
    last_t = kiosk1_service_end_t(kiosk1_no_of_patients);
else
    last_t = kiosk2_service_end_t(kiosk2_no_of_patients);
end

for (i = 1:last_t+1)
    current_t = i-1;
    %%printf('%3d\n', current_t);
    
    for (j = 1:kiosk1_no_of_patients)
        if (kiosk1_arrival_t(j) == current_t)
            printf('patient %2d arrives at minute %3d and goes to kiosk #1.. \n', (j-1)*2+1, kiosk1_arrival_t(j));
        end
    end

    for (j = 1:kiosk1_no_of_patients)
        if (kiosk1_service_end_t(j) == current_t)
            printf('patient %2d leaves  at minute %3d..\n', (j-1)*2+1, kiosk1_service_end_t(j));
        end
    end

    for (j = 1:kiosk1_no_of_patients)
        if (kiosk1_service_begin_t(j) == current_t)
            printf('patient %2d served  at minute %3d..\n', (j-1)*2+1, kiosk1_service_begin_t(j));
        end
    end

    for (j = 1:kiosk2_no_of_patients)
        if (kiosk2_arrival_t(j) == current_t)
            printf('patient %2d arrives at minute %3d and goes to kiosk #2.. \n', j*2, kiosk2_arrival_t(j));
        end
    end

    for (j = 1:kiosk2_no_of_patients)
        if (kiosk2_service_end_t(j) == current_t)
            printf('patient %2d leaves  at minute %3d..\n', j*2, kiosk2_service_end_t(j));
        end
    end

    for (j = 1:kiosk2_no_of_patients)
        if (kiosk2_service_begin_t(j) == current_t)
            printf('patient %2d served  at minute %3d..\n', j*2, kiosk2_service_begin_t(j));
        end
    end

end
