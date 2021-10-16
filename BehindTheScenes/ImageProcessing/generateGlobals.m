function [ExperimentalStack] = generateGlobals(ExperimentalStack)

%Darik O'Neil MBL Neuro 2021 Team Hoppa

ExperimentalStack.Global_Syn_F_Fo = [];
ExperimentalStack.Global_Syn_dFdTFo = [];
ExperimentalStack.Global_SynAPL = [];
ExperimentalStack.Global_SynAPP = [];
ExperimentalStack.Global_SynFWHM = [];
ExperimentalStack.Global_SynMini = [];


preL = numel(ExperimentalStack.pre);
drug1L = numel(ExperimentalStack.drug1);
postL = numel(ExperimentalStack.post);
drug2L = numel(ExperimentalStack.drug2);

%% for each condition

% F-Fo/Fo & d(F-Fo/Fo)/dT
for a = 1:preL
    ExperimentalStack.Global_Syn_F_Fo = [ExperimentalStack.Global_Syn_F_Fo; ExperimentalStack.pre{a}.meanSyn_F_Fo];
    ExperimentalStack.Global_Syn_dFdTFo = [ExperimentalStack.Global_Syn_dFdTFo; ExperimentalStack.pre{a}.meanSyn_dFdTFo];
    ExperimentalStack.Global_SynAPL = [ExperimentalStack.Global_SynAPL; ExperimentalStack.pre{a}.meanSynAPL];
    ExperimentalStack.Global_SynAPP = [ExperimentalStack.Global_SynAPP; ExperimentalStack.pre{a}.meanSynAPP];
    ExperimentalStack.Global_SynFWHM = [ExperimentalStack.Global_SynFWHM; ExperimentalStack.pre{a}.meanSynFWHM];
    ExperimentalStack.Global_SynMini = [ExperimentalStack.Global_SynMini; ExperimentalStack.pre{a}.meanSynMini];
end

for a = 1:drug1L
    ExperimentalStack.Global_Syn_F_Fo = [ExperimentalStack.Global_Syn_F_Fo; ExperimentalStack.drug1{a}.meanSyn_F_Fo];
    ExperimentalStack.Global_Syn_dFdTFo = [ExperimentalStack.Global_Syn_dFdTFo; ExperimentalStack.drug1{a}.meanSyn_dFdTFo];
    ExperimentalStack.Global_SynAPL = [ExperimentalStack.Global_SynAPL; ExperimentalStack.drug1{a}.meanSynAPL];
    ExperimentalStack.Global_SynAPP = [ExperimentalStack.Global_SynAPP; ExperimentalStack.drug1{a}.meanSynAPP];
    ExperimentalStack.Global_SynFWHM = [ExperimentalStack.Global_SynFWHM; ExperimentalStack.drug1{a}.meanSynFWHM];
    ExperimentalStack.Global_SynMini = [ExperimentalStack.Global_SynMini; ExperimentalStack.drug1{a}.meanSynMini];
end

for a = 1:postL
    ExperimentalStack.Global_Syn_F_Fo = [ExperimentalStack.Global_Syn_F_Fo; ExperimentalStack.post{a}.meanSyn_F_Fo];
    ExperimentalStack.Global_Syn_dFdTFo = [ExperimentalStack.Global_Syn_dFdTFo; ExperimentalStack.post{a}.meanSyn_dFdTFo];
    ExperimentalStack.Global_SynAPL = [ExperimentalStack.Global_SynAPL; ExperimentalStack.post{a}.meanSynAPL];
    ExperimentalStack.Global_SynAPP = [ExperimentalStack.Global_SynAPP; ExperimentalStack.post{a}.meanSynAPP];
    ExperimentalStack.Global_SynFWHM = [ExperimentalStack.Global_SynFWHM; ExperimentalStack.post{a}.meanSynFWHM];
    ExperimentalStack.Global_SynMini = [ExperimentalStack.Global_SynMini; ExperimentalStack.post{a}.meanSynMini];
end

for a = 1:drug2L
    ExperimentalStack.Global_Syn_F_Fo = [ExperimentalStack.Global_Syn_F_Fo; ExperimentalStack.drug2{a}.meanSyn_F_Fo];
    ExperimentalStack.Global_Syn_dFdTFo = [ExperimentalStack.Global_Syn_dFdTFo; ExperimentalStack.drug2{a}.meanSyn_dFdTFo];
    ExperimentalStack.Global_SynAPL = [ExperimentalStack.Global_SynAPL; ExperimentalStack.drug2{a}.meanSynAPL];
    ExperimentalStack.Global_SynAPP = [ExperimentalStack.Global_SynAPP; ExperimentalStack.drug2{a}.meanSynAPP];
    ExperimentalStack.Global_SynFWHM = [ExperimentalStack.Global_SynFWHM; ExperimentalStack.drug2{a}.meanSynFWHM];
    ExperimentalStack.Global_SynMini = [ExperimentalStack.Global_SynMini; ExperimentalStack.drug2{a}.meanSynMini];
end

end




