 


function [T1,XT1,YT1,IT1] = test_run(input_l1,input_u1,upper_limit, lower_limit,threshold,file_name)
%upper_limit, lower_limit, threshold)
input_range = [input_l1 input_u1];
cd('..') 
cd('SystemModelsAndData')


%load states_cp;
load_mat ('states_cp_1.mat');
load_mat ('agent_trained_not_22.mat');

model = file_name;
init_cond = [];


disp('')
% prompt = "Number of times the false-data to be injected: ";
cp_array = 10;

disp(' ')
disp('The specification:')
%prompt = "Property to be checked: ";
%phi = input(prompt);
phi = '([]r3 /\[]r1/\[]r2)';


%Ax <= b

% Define the predicates
%upperbound
% x2 <= 60+delta
% which is represented as (-1)x1 + 0 x2 <= (60+delta)
% or [-1 0] [x1; x2] <= -(60-delta)

ii = 1;
preds(ii).str='r1';
preds(ii).A = [1 0];
%prompt = "Upper-Limit: ";
%preds(ii).b = input(prompt);
preds(ii).b = upper_limit;
%preds(ii).b = 60.3;

%lowerbound
% x1 >= 60-delta 
% which is represented as (1) x1 + 0 x2 <= -(60-delta)
% or [1 0] [x1; x2] <= (60+delta)
ii = ii+1;
preds(ii).str='r2';
preds(ii).A = [-1 0];
%prompt = "Lower-Limit as negative number: ";
%preds(ii).b = input(prompt);
preds(ii).b = -1 *(lower_limit)
%preds(ii).b = -59.7;

% which is represented as 0 x1 + (1) x2 <= (60+delta)
% or [0 1] [x1; x2] <= (residue)
ii = ii+1;
preds(ii).str='r3';
preds(ii).A = [0 1];
%prompt = "Threshold ";
%preds(ii).b = input(prompt);
preds(ii).b = threshold;
%preds(ii).b = 50;
disp(' ')
%prompt = 'Total Simulation time: ';
time = 2;

disp(' ')
disp(' S-Taliro options: ')

% Create an staliro_options object with the default options:
opt = staliro_options();
% Execute only one run (experiment)
%prompt = 'Number of experiments: ';
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
runtime=toc;

runtime;

disp('Displaying the results of the falsification process ...')
results.run(results.optRobIndex).bestRob;

[T1,XT1,YT1,IT1] = SimSimulinkMdl(model,init_cond,input_range,cp_array,results.run(1).bestSample,time,opt);


cd('..')
cd('Falsification demos')
end

