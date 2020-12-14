Documentation
=============
**General Description:**

This project is a model for ice melting process solved by numerical calculation programmed with MATLAB

Dependencies
-------------
**Language:**  MATLAB

Project Architecture
-------------
```buildoutcfg
    Bisect.m        // bisection
    cal.m           // derivative calculation function
    cf.m            // schematic sub-function of the curve interpolation fitting result
    difference.m    // difference quotient operator
    Document.pdf    // technical documentation of this project
    equa1.m         // subfunction 1 to be evaluated
    equa2.m         // subfunction 2 to be evaluated
    equa3.m         // subfunction 3 to be evaluated
    FP_iteration.m  // fixed point iteration
    F_position.m    // improved trial-position 
    ls1.m           // fitting sub-function of least square method 1/(ax+b)
    ls2.m           // fitting sub-function of least square method 1/(ax^2+b)
    ls3.m           // fitting sub-function of least square method ab^(-ex)
    main.m          // main function
    Newton.m        // Newton interpolation method
    NR.m            // Newton-Rapson iterative method 
    ODE1.m          // euler method
    ODE2.m          // huhne's method
    ODE3.m          // runge-kutta method
    ODE4.m          // improved runge-kutta method
    README.md       // help
    Secant.m        // Secant method
    spline3.m       // cubic spline interpolation
```

Usage
-------------
Run main.m directly  
The program may take several seconds to run, which outputs several text messages and images