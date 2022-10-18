 
clear
clf;
%addpath(genpath('/home/fmlab-sd/Documents/work/trunk'));
cd('..') 
cd('SystemModelsAndData')

load states_cp_1.mat;
load residue3.mat;
load residue2.mat;
load residue1.mat;
load only_rl_train.mat;
load noisestaliro.mat;
load noisedata_staliro_1sec.mat;
load newnoise_staliro.mat;
load agent_trained_not_22.mat;

model = 'rl_top';
filename = 'bus_14_take_1';
init_cond = [];

prompt = "False Data injection input range in the form of row matrix: ";
input_range = input(prompt);
%input_range = [0 4];
disp(' ')
prompt = "Number of times the false-data to be injected: ";
cp_array = input(prompt);

disp(' ')
disp('The specification:')
%prompt = "Property to be checked: ";
%phi = input(prompt);
phi = '!([]r3 /\[]r1/\[]r2)';


%Ax <= b

% Define the predicates
%upperbound
% x2 <= 60+delta
% which is represented as (-1)x1 + 0 x2 <= (60+delta)
% or [-1 0] [x1; x2] <= -(60-delta)

ii = 1;
preds(ii).str='r1';
preds(ii).A = [1 0];
prompt = "Upper-Limit of output frequency: ";
preds(ii).b = input(prompt);
upper_limit = preds(ii).b;
%preds(ii).b = 60.3;

%lowerbound
% x1 >= 60-delta 
% which is represented as (1) x1 + 0 x2 <= -(60-delta)
% or [1 0] [x1; x2] <= (60+delta)
ii = ii+1;
preds(ii).str='r2';
preds(ii).A = [-1 0];
prompt = "Lower-Limit of output frequency ";
preds(ii).b = input(prompt);
lower_limit = -1 * preds(ii).b;
%preds(ii).b = -59.7;

% which is represented as 0 x1 + (1) x2 <= (60+delta)
% or [0 1] [x1; x2] <= (residue)
ii = ii+1;
preds(ii).str='r3';
preds(ii).A = [0 1];
prompt = "Threshold ";
preds(ii).b = input(prompt);
residue = preds(ii).b;
%preds(ii).b = 60.3;
disp(' ')
prompt = 'Total Simulation time: ';
time = input(prompt);

disp(' ')
disp(' S-Taliro options: ')

% Create an staliro_options object with the default options:
opt = staliro_options();
% Execute only one run (experiment)
prompt = 'Number of experiments: ';
preds(ii).b = input(prompt);
opt.runs = 1;                                                                                                                                                                                                                                                ; 
% The number of tests (simulations) for the experiment
n_tests = 1;
opt.falsification = 0;
% Piecewise constant inputs
opt.interpolationtype = {'pconst'};
opt.optimization_solver = 'SA_Taliro';
opt.optim_params.n_tests = n_tests;

disp(' ')
disp('Running S-TaLiRo with chosen solver ...')
tic

results = staliro(model,init_cond,input_range,cp_array,phi,preds,time,opt);
set_param('rl_top/Model','ModelName',filename)
runtime=toc;

runtime

disp('Displaying the results of the falsification process ...')
results.run(results.optRobIndex).bestRob

[T1,XT1,YT1,IT1] = SimSimulinkMdl(model,init_cond,input_range,cp_array,results.run(1).bestSample,time,opt);

subplot(3,1,1);
plot(IT1(:,1),IT1(:,2))
title('False-data');
xlabel('Time');
ylabel('false-data');

subplot(3,1,2);

plot([0 time],[upper_limit upper_limit],'r')
hold on
plot([0 time],[lower_limit lower_limit],'r')

xt = [10 20];
yt = [60 75];
str = {'safe region','unsafe region'};
text(xt,yt,str)
hold on
plot(T1,YT1(:,1),'g')
title('Falsification')
xlabel('Time');
ylabel('Frequency');
legend('upper limit','lower limit','output frequency')

subplot(3,1,3);

plot([0 time],[residue residue],'r')

hold on
plot(T1,YT1(:,2),'g')
title('Falsification')
xlabel('Time');
ylabel('Residue');
%legend('6000','residue')
cd('..')
cd('Falsification demos')


