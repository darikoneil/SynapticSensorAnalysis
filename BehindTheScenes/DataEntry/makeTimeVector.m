function [ExperimentalStack] = makeTimeVector(ExperimentalStack)
%Darik O'Neil MBL Neuro 2021 Team Hoppa
%Makes EXPOSURE Time Vectors for Single Trial, Condition, and Global Plotting

%% IMPORT
framerate = ExperimentalStack.framerate; %import framerate
numFrames = ExperimentalStack.lenTrials; %import frames/Trial
numConditions = ExperimentalStack.numConditions; %import number of conditions
numTrials = ExperimentalStack.numTrials; %import number of trials per conditions

%% CALCULATE CONSTANTS
timeInterval = 1/framerate;

%% CALCULATE SINGLE TRIAL
EndTime = numFrames*timeInterval; %End time
TimeVector = 0:timeInterval:EndTime; %Make Vector of Times by Interval
TimeVector=TimeVector(1:(end-1)); %prune off final number
ExperimentalStack.SingleTimeVector_s = TimeVector; %seconds unit
ExperimentalStack.SingleTimeVector_ms = TimeVector.*1000; %milliseconds unit

%% CALCULATE CONDITION
EndTime = numFrames*timeInterval*numTrials; %End time
TimeVector = 0:timeInterval:EndTime; %Make Vector of Times by Interval
TimeVector=TimeVector(1:(end-1)); %prune off final number
ExperimentalStack.ConditionTimeVector_s = TimeVector; %seconds unit
ExperimentalStack.ConditionTimeVector_ms = TimeVector.*1000; %milliseconds unit

%% CALCULATE GLOBAL
EndTime = numFrames*timeInterval*numTrials*numConditions; %End time
TimeVector = 0:timeInterval:EndTime; %Make Vector of Times by Interval
TimeVector=TimeVector(1:(end-1)); %prune off final number
ExperimentalStack.GlobalTimeVector_s = TimeVector; %seconds unit
ExperimentalStack.GlobalTimeVector_ms = TimeVector.*1000; %milliseconds unit

end


