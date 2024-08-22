% kiosk 1
kiosk1_prob = rand(1,8) + 10;
kiosk1_prob = kiosk1_prob / sum(kiosk1_prob);

kiosk1_cdf(1) = kiosk1_prob(1);
for (i = 2:8)
    kiosk1_cdf(i) = kiosk1_cdf(i-1) + kiosk1_prob(i);
end

printf('\n  KIOSK 1:\n');
printf('+---------------+-------+-------+-------+-------+-------+-------+-------+-------+\n');
printf('| service times |   5   |  10   |  15   |  20   |  25   |  30   |  35   |  40   |\n');
printf('| (mins)        |       |       |       |       |       |       |       |       |\n');
printf('|---------------|-------|-------|-------|-------|-------|-------|-------|-------|\n');
printf('| probability   | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f |\n', kiosk1_prob(1),kiosk1_prob(2),kiosk1_prob(3),kiosk1_prob(4),kiosk1_prob(5),kiosk1_prob(6),kiosk1_prob(7),kiosk1_prob(8));
printf('|---------------|-------|-------|-------|-------|-------|-------|-------|-------|\n');
printf('| cdf           | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f |\n', kiosk1_cdf(1),kiosk1_cdf(2),kiosk1_cdf(3),kiosk1_cdf(4),kiosk1_cdf(5),kiosk1_cdf(6),kiosk1_cdf(7),kiosk1_cdf(8));
printf('|---------------|-------|-------|-------|-------|-------|-------|-------|-------|\n');
printf('| rn range      |  %.1f |  %.1f |  %.1f |  %.1f |  %.1f |  %.1f |  %.1f | %0.1f |\n', kiosk1_cdf(1)*100,kiosk1_cdf(2)*100,kiosk1_cdf(3)*100,kiosk1_cdf(4)*100,kiosk1_cdf(5)*100,kiosk1_cdf(6)*100,kiosk1_cdf(7)*100,kiosk1_cdf(8)*100);
printf('|---------------|-------|-------|-------|-------|-------|-------|-------|-------|\n');

% kiosk 2
kiosk2_prob = rand(1,8) + 10;
kiosk2_prob = kiosk2_prob / sum(kiosk2_prob);

kiosk2_cdf(1) = kiosk2_prob(1);
for (i = 2:8)
    kiosk2_cdf(i) = kiosk2_cdf(i-1) + kiosk2_prob(i);
end

printf('\n  KIOSK 2:\n');
printf('+---------------+-------+-------+-------+-------+-------+-------+-------+-------+\n');
printf('| service times |   5   |  10   |  15   |  20   |  25   |  30   |  35   |  40   |\n');
printf('| (mins)        |       |       |       |       |       |       |       |       |\n');
printf('|---------------|-------|-------|-------|-------|-------|-------|-------|-------|\n');
printf('| probability   | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f |\n', kiosk2_prob(1),kiosk2_prob(2),kiosk2_prob(3),kiosk2_prob(4),kiosk2_prob(5),kiosk2_prob(6),kiosk2_prob(7),kiosk2_prob(8));
printf('|---------------|-------|-------|-------|-------|-------|-------|-------|-------|\n');
printf('| cdf           | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f | %0.3f |\n', kiosk2_cdf(1),kiosk2_cdf(2),kiosk2_cdf(3),kiosk2_cdf(4),kiosk2_cdf(5),kiosk2_cdf(6),kiosk2_cdf(7),kiosk2_cdf(8));
printf('|---------------|-------|-------|-------|-------|-------|-------|-------|-------|\n');
printf('| rn range      |  %.1f |  %.1f |  %.1f |  %.1f |  %.1f |  %.1f |  %.1f | %0.1f |\n', kiosk2_cdf(1)*100,kiosk2_cdf(2)*100,kiosk2_cdf(3)*100,kiosk2_cdf(4)*100,kiosk2_cdf(5)*100,kiosk2_cdf(6)*100,kiosk2_cdf(7)*100,kiosk2_cdf(8)*100);
printf('|---------------|-------|-------|-------|-------|-------|-------|-------|-------|\n');

% interarrival times
interarrival_t_prob = zeros(1,4);
interarrival_t_cdf  = zeros(1,4);

for (i = 1:4)
    interarrival_t_prob(i) = 0.25;
    interarrival_t_cdf(i) = sum(interarrival_t_prob);
end

printf('\n  INTERARRIVAL TIMES:\n');
printf('+---------------+-------+-------+-------+-------+\n');
printf('| interarrival  |   2   |   4   |   6   |   8   |\n');
printf('| times (mins)  |       |       |       |       |\n');
printf('|---------------|-------|-------|-------|-------|\n');
printf('| probability   | %0.3f | %0.3f | %0.3f | %0.3f |\n', interarrival_t_prob(1),interarrival_t_prob(1),interarrival_t_prob(1),interarrival_t_prob(1));
printf('|---------------|-------|-------|-------|-------|\n');
printf('| cdf           | %0.3f | %0.3f | %0.3f | %0.3f |\n', interarrival_t_cdf(1),interarrival_t_cdf(2),interarrival_t_cdf(3),interarrival_t_cdf(4));
printf('|---------------|-------|-------|-------|-------|\n');
printf('| rn range      |  %.1f |  %.1f |  %.1f | %0.1f |\n', interarrival_t_cdf(1)*100,interarrival_t_cdf(2)*100,interarrival_t_cdf(3)*100,interarrival_t_cdf(4)*100);
printf('|---------------|-------|-------|-------|-------|\n\n');
