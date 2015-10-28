load cancer_dataset;
inputs = cancerInputs';
outputs = cancerTargets';       %to load the inbuilt dataset from matlab

indices=randperm(length(inputs),100);
indices=indices';
inputtest=zeros(0,1);
outputtest=zeros(0,1);
input_V=zeros(0,1);
output_V=zeros(0,1);

for i=1:(length(inputs))
    if(sum(indices==i)>0)
        inputtest=[inputtest; inputs(i,:)];
        outputtest=[outputtest; outputs(i,:)];
    else
        input_V=[input_V; inputs(i,:)];
        output_V=[output_V; outputs(i,:)];
    end
end

%save traindata.mat
%save testdata.mat