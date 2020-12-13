function [ent] = ent(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ent = -sum(x.*log2(x));
end

