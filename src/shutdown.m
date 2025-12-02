function shutdown()
    clc
    fprintf('Shutting down...\n');
    clear_trash;
    unload_workspace();
    remove_project_paths();
end

function unload_workspace()
    fprintf('Clear variables...\n');
    
    project_variables = {
        'motor', 'gear', 'cradle', 'pid', ...
        'simOut', 'yout', 'tout', ...
        'outcontrol_signal', 'outerror_signal', 'outspeed', ...
        'ControlSignal_Logger', 'Error_Logger', 'Speed_Logger'
    };
    
    for i = 1:length(project_variables)
        if evalin('base', sprintf('exist(''%s'', ''var'')', project_variables{i}))
            evalin('base', sprintf('clear %s', project_variables{i}));
            fprintf('Deleted: %s\n', project_variables{i});
        end
    end
    
    close_system([], 0);
end

function remove_project_paths()
    fprintf('Deleting paths of project...');
    project_folders = {
        'src',
        'models', 
        'tests',
        'docs'
    };
    
    for i = 1:length(project_folders)
        if exist(project_folders{i}, 'dir')
            rmpath(genpath(project_folders{i}));
        end
    end
end