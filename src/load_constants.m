function load_constants()
    motor.R = 0.13;      % Сопротивление, Ом
    motor.L = 0.000344;  % Индуктивность, Гн
    motor.Kt = 114;      % Коэффициент момента
    motor.Ke = 83.9;     % Коэффициент скорости
    motor.J = 0.0000568; % Момент инерции, кг*м²
    
    gear.ratio = 90.4;   % Передаточное отношение
    gear.J = 0.001;      % Момент инерции редуктора
    
    cradle.mass = 30;             % Масса, кг
    cradle.wheel_radius = 0.1;    % Радиус шкива, м
    cradle.target_velocity = 1;   % Целевая скорость, м/с
    
    pid.Kp = 0.02;
    pid.Ki = 16.6;
    pid.Kd = 0;
    pid.N = 0;
    
    assignin('base', 'motor', motor);
    assignin('base', 'gear', gear);
    assignin('base', 'cradle', cradle);
    assignin('base', 'pid', pid);
    
end