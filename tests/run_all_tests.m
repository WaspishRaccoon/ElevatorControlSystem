function run_all_tests()
% Запуск всех тестов

    set_param('ControlSystem', 'AlgebraicLoopMsg', 'none');
    fprintf('\nLaunch testing...\n\n');
    
    test_settling_time();
    test_overshoot();
end