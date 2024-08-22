% instantiate kiosk 1, kiosk 2, and interarrival times
instantiate_kiosk1_kiosk2_interarrival_times;   % call instantiate_kiosk1_kiosk2_interarrival_times.m

% user input for type of rn generator, and number of patients
disp                  ('choose the type of rn generator: ');
disp                  ('[1] lcg');
disp                  ('[2] rvg uniform');
rn_type        = input('==> ');
disp                  ('enter no. of patients: ');
no_of_patients = input('==> ');

if (rn_type == 2)
    printf('\ngenerating rn using rvg uniform..');
else
    printf('\ngenerating rn using lcg..');
end    
printf('\n');

start_simulation;   % call start_simulation.m
