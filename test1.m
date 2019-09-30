
clear all;
close all;
clc;

data= xlsread('TEST1.xls');
species =xlsread('TEST2.xls');

inds= randperm(size(data,1));
training = data(inds(1:2500),:);
train_classes = species(inds(1:2500),1);
testing = data(inds(2501:end),:);
test_classes = species(inds(2501:end),1);


LB = [1 1 1 1 1];
UB = [18 18 18 18 18];
NumOfVars= 5; 
options   = gaoptimset('PopulationSize',40,'EliteCount',5,'CrossoverFraction',0.8,'Generations',40,'PlotFcns',{@gaplotbestf});

FitnessFcn  = @(x)test2(x,training,train_classes,testing,test_classes);

[x, fval, exitflag, output] = ga(FitnessFcn,NumOfVars,[],[],[],[],LB,UB,[],options);


