function [F, tape] = BAD_mul(c, x, tape, k, outref)
% BAD_add.m
%
%     Author: Fabian Meyer
% Created on: 12 Dec 2017
%
% c: 1x1, constant factor for each term
% x: 2x1, point of jacobian approx
% tape: array of structs, tape for recording backwards AD
% k: 1x1, index where this function resides in tape
% outref: 2x1, references where outputs of this function should be written

% evaluate function value
F = c * x(1) * x(2);

tape(k).tag = @(jin) c * [x(2); x(1)] * jin; % adjoint jacobian
tape(k).x = x;                               % input to function
tape(k).jin = 0;                             % input of adjoint jacobian
tape(k).outref = outref;                     % output reference of adjoint jacobian

end

