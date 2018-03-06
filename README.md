# svm-toy
In this repo, a simple SVM hyperplane visualization toy is provided, which helps us to understand the work mechanism of the support vectors (SVs), coefficients, kernel functions, etc. The [libsvm](https://www.csie.ntu.edu.tw/~cjlin/libsvm/) package, which defines a data structure to save the trained `SVM model`
, is applied. I will also introduce the tips to applying it.

## Requirements
To use my code, the [libsvm](https://www.csie.ntu.edu.tw/~cjlin/libsvm/) toolbox is required. Note that, to config this package, either the `VC++` for windows or the `g++` for linux should be installed.

Here is a brief configuration guide,
1. Move the libsvm folder to your $MATLAB_PATH/toolbox/
2. Launch matlab desktop
3. cd $MATLAB_PATH/toolbox/libsvm3.xx/matlab
4. mex -setup % Check and select configurator
5. make % configure 

If it generates `svmtrain.mexa64` and `svmpredict.mexa64` or `svmtrain.mexw64` and `svmpredict.mexw64`, then the configuration is successful. Note, you need to add libsvm to your MATLAB path so as avoding the builtin `svmtrain` and `svmpredict` functions.

## Demos
Below are two demos for hyperplane visualization of [two-type]() and [three-type](https://github.com/myinxd/svm-toy/blob/master/demos/DrawSepLine3C.m) classfications.

- Three-class case
![3C](https://github.com/myinxd/svm-toy/blob/master/images/fig_3c.png?raw=true)

## License
Unless otherwise declared:

- Codes developed are distributed under the [MIT license](https://opensource.org/licenses/mit-license.php);
- Documentations and products generated are distributed under the [Creative Commons Attribution 3.0 license](https://creativecommons.org/licenses/by/3.0/us/deed.en_US);
- Third-party codes and products used are distributed under their own licenses.
