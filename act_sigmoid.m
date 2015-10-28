function [act_out] = act_sigmoid(val, derivative)   %gives the derivative when derivative=1, else the direct sigmoid function
	if derivative == 1
		act_out = val.*(1-val);
	else
		act_out = 1./(1+exp(-val));
	end
end