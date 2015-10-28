clear;clc;

%% train
eeta = 0.01;                    %learning rate
input_layer_neurons = 9;        %input neurons - should match with the input dimension 
hidden_layer_neurons = 20;      %hidden layer
output_layer_neurons = 2;       %output layer

load traindata.mat;             %loading the training dataset

W0 = 2*rand(input_layer_neurons,hidden_layer_neurons)-1;    %initialising random weights
W1 = 2*rand(hidden_layer_neurons,output_layer_neurons)-1;   %initalising ranom weights

epochs = 10000;                 %no of iterations for backpropagation

for j = 1:epochs                %backpropagation algorithm to modify the weights
	if mod(j,epochs/10) == 0, disp(j); end
	l1 = act_sigmoid(matrixmultserial(input_V,W0),0);
	l2 = act_sigmoid(matrixmultserial(l1,W1),0);
	l2_delta = (output_V - l2) .* act_sigmoid(l2,1);
	l1_delta = (matrixmultserial(l2_delta,W1')) .* act_sigmoid(l1,1);
	W1 = W1 + (matrixmultserial(l1',l2_delta)*eeta);
	W0 = W0 + (matrixmultserial(input_V',l1_delta)*eeta);
end

%% test

load testdata.mat;                  %loading test dataset

l1_test = act_sigmoid(matrixmultserial(inputtest,W0),0);    %calculating the outputs for the test dataset
l2_test = act_sigmoid(matrixmultserial(l1_test,W1),0);

output=zeros(length(l2_test),1);
for i=1:length(l2_test)
    if (l2_test(i,1) > l2_test(i,2))
        output(i,1)=1;
    else
        output(i,1)=2;
    end    
end

output2=zeros(length(outputtest),1);
for i=1:size(outputtest,1)
    if(outputtest(i,1)==1)
        output2(i)=1;
    else 
        output2(i)=2;
    end
end

accuracy=sum(output==output2)/length(output)*100;       %calculating accuracy
disp(accuracy);

tp=0; tn=0; fp=0; fn=0;

for i=1:length(output)                          %calculating specificity and sensitivity
    if(output(i)==1 && output2(i)==1)
        tp=tp+1;
    elseif(output(i)==1 && output2(i)==2)
        fp=fp+1;
    elseif(output(i)==2 && output2(i)==1)
        fn=fn+1;
    else
        tn=tn+1;
    end
end

sensitivity = tp/(tp+fn);
specificity = tn/(tn+fp);

disp('specificity = '); disp(specificity);
disp('sensitivity = '); disp(sensitivity);


