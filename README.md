# Ice-Melting-Process-Modeling
Modeling for ice melting process, with numerical solutions and experiment validations  
Code description document:  
main function, run directly  
(the program may take several seconds to run, which outputs text messages and six images)  

Subfunctions:  
Bisect.m: a binary function  
F_position.m: an improved trial-position function  
FP_iteration. M: a fixed point iteration subfunction  
NR.m: the Newton-Rapson iterative subfunction  
Secant.m: a Secant method function  
equa1.m: the evaluated subfunction 1  
equa2.m: the evaluated subfunction 2  
equa3.m: the evaluated subfunction 3  
ODE1.m: the subfunction of euler method  
ODE2.m: the subfunction of huhne's method  
ODE3.m: the subfunction of runge kutta method  
ODE4.m: an improved runge kutta method to solve subfunctions  
cal.m: the value of the derivative to calculate the subfunction  
Newton.m: the interpolation sub-function of Newton method  
spline3.m: a cubic spline interpolation subfunction  
ls1.m: the fitting sub-function of least square method 1/(ax+b)  
ls2.m: the fitting sub-function of least square method 1/(ax^2+b)  
ls3.m: the fitting sub-function of least square method ab^(-ex)  
difference.m: the difference quotient operator function  
cf.m: the schematic sub-function of the curve interpolation fitting result  
