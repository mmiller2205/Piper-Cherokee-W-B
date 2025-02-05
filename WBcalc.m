clear,clc
%{
Max Miller Aero 161 Project Problem 1
Purpose: Main script to perform a weight and balance 
on a 1965 Piper Cherokee PA-28-180.
%}
%All the inputs for the weight as well as other calculations for fuel
%weight and total weight
n=1;
while n==1
[fuel,pilotw,copilotw,passenger1,passenger2] = Piper_Cherokee_input; %function inputted
fuel_weight=fuel*6; %weight of the fuel
fprintf('Total fuel weight is %.f lbs \n',fuel_weight)
empty_weight=1471; %planes weight itself
ramp_weight=fuel_weight+pilotw+copilotw+passenger1+passenger2+empty_weight; %ramp_weight which is all the weights added
fprintf('The total weight is %.2f lbs \n',ramp_weight) 

if ramp_weight<=2400 %if statement where if its greater than 2400 lbs, then it will stop the code 

else
    disp('The weight is too big for the plane')
    return
end

%Moments for every part of the Aircraft
frontseat_moment=(pilotw+copilotw)*85.5; %front seat moment
fprintf('The front seat moment is %.2f lbs-in \n',frontseat_moment)
rearseat_moment=(passenger1+passenger2)*118.1; %rear seat moment
fprintf('The rear seat moment is %.2f lbs-in \n',rearseat_moment)
fuel_moment=fuel_weight*95; %fuel moment
fprintf('The fuel moment is %.2f lbs-in \n',fuel_moment)
empty_moment=empty_weight*85.9; %empty moment
fprintf('The empty moment is %.2f lbs-in \n',empty_moment)

%Total moment and weight which will be plugged into our equation of total
%moment over weight to get center of gravity
moment_tot=frontseat_moment+rearseat_moment+fuel_moment+empty_moment; %total moment
fprintf('The total moment is %.2f lbs-in \n',moment_tot)
CG=moment_tot/ramp_weight; %equation to get center of gravity

fprintf('The moment arm is %.2f in \n',CG)

if CG>86.8&&CG<95.8 %if statement for the range allowed for the aircraft if it should fly or not
    disp('The aircraft is within the correct weight and balance and can be flown!')
else
    disp('The aircraft is not within the correct weight and balance and should not be flown.')
end

n=input('Would you like to do it again? If yes, type 1 and if no, type 0 \n')

end
