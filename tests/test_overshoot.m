function test_overshoot()
% TEST 2: Overshoot

    fprintf('\nTEST 2: Overshoot\n');
    
    MAX_ALLOWED_OVERSHOOT = 0.11;
    SIMULATION_TIME = 0.1;

    if ~evalin('base', 'exist(''cradle'', ''var'')')
        load_constants();
    end
    
    target_velocity = evalin('base', 'cradle.target_velocity');
    
    fprintf('\nLaunch TEST 2...\n');
    simOut = sim('ControlSystem', 'StopTime', num2str(SIMULATION_TIME));
    
    t = simOut.tout;
    speed = simOut.logsout.getElement('speed').Values.Data;
    
    % Находим максимальную скорость (перерегулирование)
    max_speed = max(speed);
    overshoot = (max_speed - target_velocity) / target_velocity;
    
    % Находим время достижения максимума
    [~, max_index] = max(speed);
    max_time = t(max_index);
    
    fprintf('Max speed: %.3f м/с (time: %.2f с)\n', max_speed, max_time);
    
    test_passed = overshoot <= MAX_ALLOWED_OVERSHOOT;
    
    if test_passed
        fprintf('Overshoot %.2f%% ≤ %.1f%%\n', overshoot * 100, MAX_ALLOWED_OVERSHOOT * 100);
    else
        fprintf('Overshoot %.2f%% > %.1f%%\n', overshoot * 100, MAX_ALLOWED_OVERSHOOT * 100);
    end

    if test_passed
        fprintf('TEST 2: 100%% passed!\n\n');
    else
        fprintf('TEST 2: FATAL\n\n');
    end
end