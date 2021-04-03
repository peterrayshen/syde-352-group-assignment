%% plant model parameters
function data = loadData_V2()

% Chassis params
    % Vehicle Body
    data.chassis.m = 3;              % Vehicle mass, [kg]
    data.chassis.NumWhl = 2;         % Number of wheels on per axle
    data.chassis.a = 0.1755;         % Longitudinal dist from CoM to front axle, [m]
    data.chassis.b = 0.1845;         % Longitudinal dist from CoM to rear axle, [m]
    data.chassis.h = 0.0098;         % Vertical dist from CoM to axle plane, [m]
    data.chassis.g = 9.81;           % Gravitational acceleration, [m/s^2]

    % Aerodynamic
    data.chassis.Af = 0.0046;            % Longitudinal drag area, [m^2]
    data.chassis.Cd = 0.003;             % Longitudinal drag coefficient
    data.chassis.AirDensity = 1.18;      %Air density [kg/m^3]
    
% Saturation Limites params
    data.powertrain.UpperTorqueLim = 0.9730;   %[Nm] provides a max speed of 15 m/s
    data.powertrain.LowerTorqueLim = -0.9730;  %[Nm] provides a max speed of - 15 m/s 
    %Note: 0.3249 Nm provides a max  speed of 5 m/s 

% Drivetrain params
    % Belt Drive 
    data.drivetrain.RadiusA = 0.01605;   % Pulley A radius [m]
    data.drivetrain.bvfCoeffA = 0;      % Pulley A Bearing viscous friction coefficient [Nm/(rad/s)]
    data.drivetrain.RadiusB = 0.0413;    % Pulley B radius [m]
    data.drivetrain.bvfCoeffB = 0.001;  % Pulley B Bearing viscous friction coefficient [Nm/(rad/s)]
    
    % Tire
    data.drivetrain.RolRadius = 0.06;    % Rolling radius [m]
    data.drivetrain.IyyWhl = 0.0008;     % Wheel inertia, [kg*m^2]
    data.drivetrain.InitVelo = 0;        % initial Velocity [rad/s]
 
    % Road-Tire Interaction
    data.drivetrain.VertLoad = 7.308;   % Rated vertical load [N]
    data.drivetrain.PeakLongF = 7.495;  % Peak longitudinal force [N]
    data.drivetrain.Slip = 80;       % Slip at peak force at rated load [percent]
    data.drivetrain.VeloTrhd = 0.1;  % Velocity treshold [m/s]

% FTP Data
    data.FTP = load ('sch_profile_UDDS_Flat_NoWind.mat');
    data.FTP.ScaledSpd = 0.2655; % Scales down the speed trace to a max of 15 m/s


if nargout == 0
    s = fieldnames(data);
    for i = 1 : length(s)
        assignin('base', s{i}, data.(s{i}));
    end
end
end
