clear; clc

data = xlsread('datafile.xlsx');


X = data(:,1:8);

ydata = xlsread('output.xlsx');
Y = ydata;

%for i=1:size(Y)
%	if Y(i)=='PD'
%		Y(i)=1;
%	elseif Y(i)=='D1'
%		Y(i)=2;
%	elseif Y(i)=='D2'
%		Y(i)=3;
%	elseif Y(i)=='T1'
%		Y(i)=4;
%	elseif Y(i)=='T2'
%		Y(i)=5;
%	elseif Y(i)=='T3'
%		Y(i)=6;
%	elseif Y(i)=='NF'
%		Y(i)=7;
%	end
%end

input_layers = 8;
output_layers = 8;
hidden_layer_size = 9;

Theta1 = initialize(input_layers,hidden_layer_size);
Theta2 = initialize(hidden_layer_size,output_layers);



initial_param = [Theta1(:);Theta2(:)];


options = optimset('MaxIter', 1000);

lambda = 10;

%costFunction = @(p) nnCost(p,...
%							input_layers,...
%							hidden_layer_size,...
%							output_layers, X, Y, lambda);

[nn_params, cost] = fmincg( @(p) (nnCost(p,...
							input_layers,...
							hidden_layer_size,...
							output_layers, X, Y, lambda)),initial_param, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layers + 1)), ...
                 hidden_layer_size, (input_layers + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layers + 1))):end),...
                 output_layers, (hidden_layer_size + 1));


pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == Y)) * 100);

%test = csvread('test2.csv',0,0);
%X_test = test(:,2:end);
%Y_test=test(:,1);

%for i=1:size(Y_test)
%	if Y_test(i)==0
%		Y_test(i)=10;
%	end
%end

%pred = predict(Theta1,Theta2,X_test);
%sum(pred==Y_test)
%fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == Y_test)) * 100);

