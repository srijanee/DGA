function [J grad] = nnCost(nn_params,input_layer,hidden_layer,output_layer,X,Y,lambda)

Theta1 = reshape(nn_params(1:hidden_layer*(input_layer+1)),hidden_layer,(input_layer+1));
Theta2 = reshape(nn_params(((hidden_layer*(input_layer+1))+1):end),output_layer,hidden_layer+1);

m = size(X,1);

J=0;
Theta1grad = zeros(size(Theta1));
Theta2grad = zeros(size(Theta2));



yk = zeros(size(Y),output_layer);

for i = 1:m
	yk(i,Y(i)) = 1;             
end


A1 = [ones(m,1) X];                          
A2 = [ones(m,1) sig(A1*Theta1')];        
A3 = (sig(A2*Theta2')); 


T1 = Theta1.^2;
T2 = Theta2.^2;
T1 = T1(:,2:end);           %Dropping the weight for the bias units 
T2 = T2(:,2:end);
	
J = -(yk.*log(A3) + (1-yk).*log(1-A3));
J = sum(J(:))/m + lambda*(sum(T1(:))+sum(T2(:)))/(2*m);
	
delta3 = A3 - yk;
%size(A1*Theta1')
delta2 = (delta3*Theta2).* [ones(m,1) sigmoidGradient(A1*Theta1')];
%size(delta2)
delta2 = delta2(:,2:end);
	
Theta1grad = delta2'*A1;
Theta2grad = delta3'*A2;


T1Reg = [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
T2Reg = [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];

Theta1grad = (1/m) * Theta1grad + (lambda/m) * T1Reg;
Theta2grad = (1/m) * Theta2grad + (lambda/m) * T2Reg;
% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1grad(:) ; Theta2grad(:)];


end
	
	
	
	


