# Control system of elevator

## Projecct description

The project of an automatic control system for lifting a cradle for moving bulk cargo. It was developed on the basis of laboratory work number 6 on the course "Theory of automatic control". The project includes Simulink models, testing system and automated scripts.

## Project structure

```
ElevatorControlSystem/
├── docs/                               # Документация
│   ├── Лабораторная_работа_№6_Елесин_П_В.pdf
├── models/                             # Модели Simulink
│   ├── ControlObject.slx               
│   └── ConstructionCradleControl.slx   
│   └── ControlObject.slx.r2022b
├── resources/                          # Ресурсы проекта
├── src/                                # Код MATLAB
│   ├── clear_trash.m
│   ├── load_constants.m
│   ├── shutdown.m
│   └── startup.m
├── tests/                              # Тесты
│   ├── run_all_tests.m
│   ├── test_overshoot.m
│   └── test_settling_time.m
├── ElevatorControlSystem.prj           # Файл проекта
└── README.md
```

## Installation and launch

- Open MATLAB
- Open the project file `ElevatorControlSystem.prj`
- The project will perform initialization automatically

## Testing

There are 2 tests implemented in the project:

1. **Stabilization time test** (`test_settling_time.m`), which verifies that the system reaches the target speed in a given time.
2. **Overshoot test** (`test_overshoot.m`), which verifies that overshoot does not exceed the allowed value.

The corresponding parameters can be configured in the tests themselves.

## Shortcuts

The following shortcuts are available in the Project Management group:
- **Start** — Initialize the project and load constants
- **Open Control System Model** — Open the system management model
- **Exit** — Exit the project
- **Clean** — Cleaning temporary files

## Launch Features

- Before the first launch, make sure that all project paths are added to the MATLAB path.
- For correct testing, it is necessary to configure signal logging in Simulink models - the speed signal must be named `speed`.
- If errors occur:
  - Run `clear_trash.m` to clear temporary files;
  - Restart the initialization of `startup()`.

## System requirements

- MATLAB R2023a or later
- Simulink
- Control System Toolbox