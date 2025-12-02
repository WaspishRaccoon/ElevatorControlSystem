function test_settling_time()
% TEST 1: Settling time

    fprintf('\nTEST 1: SETTLING TIME\n');
    
    REQUIRED_SETTLING_TIME = 0.05;
    SETTLING_TIME_TOLERANCE = 0.001;
    SPEED_TOLERANCE = 0.01;
    SIMULATION_TIME = 0.1;

    if ~evalin('base', 'exist(''cradle'', ''var'')')
        load_constants();
    end
    
    target_velocity = evalin('base', 'cradle.target_velocity');

    fprintf('\nLaunch TEST 1...\n');
    simOut = sim('ControlSystem', 'StopTime', num2str(SIMULATION_TIME));
    
    % Извлечение данных
    t = simOut.tout;
    speed = simOut.logsout.getElement('speed').Values.Data;
    
    % Расчет времени стабилизации (после перерегулирования)
    speed_upper_limit = target_velocity * (1 + SPEED_TOLERANCE);
    speed_lower_limit = target_velocity * (1 - SPEED_TOLERANCE);
    
    % Находим момент, когда система ВХОДИТ в допуск и НЕ ВЫХОДИТ из него
    in_tolerance = (speed >= speed_lower_limit) & (speed <= speed_upper_limit);
    
    % Ищем первый момент, после которого система постоянно в допуске
    settling_index = [];
    for i = 1:length(in_tolerance)
        if all(in_tolerance(i:end))
            settling_index = i;
            break;
        end
    end
    
    if isempty(settling_index)
        settling_time = NaN;
    else
        settling_time = t(settling_index);
    end
    
    max_settling_time = REQUIRED_SETTLING_TIME + SETTLING_TIME_TOLERANCE;
    
    if ~isnan(settling_time) && settling_time <= max_settling_time
        
        fprintf('Settling time %.2f с ≤ %.1f с\n', settling_time, max_settling_time);
        test_passed = true;
    else
        if isnan(settling_time)
            fprintf('Settling time has not been reached\n');
        else
            fprintf('Settling time %.2f с > %.1f с\n', settling_time, max_settling_time);
        end
        test_passed = false;
    end
    
    if test_passed
        fprintf('TEST 1: 100%% passed!\n\n');
    else
        fprintf('TEST 1: FATAL\n\n');
    end
end