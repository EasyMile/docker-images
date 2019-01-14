# tensorflow

Builds Tensorflow 1.12 with Cuda 10.0, CuDNN 7.4.1.5. and TensorRT 5.0.2.6. Generates the python .whl filae and the C API library (libtensorflow.so)

Here's how to build an image:

```docker build -t tensorflowem --build-arg CHECKOUT_TF_SRC=1 --build-arg USE_PYTHON_3_NOT_2=1 .```
