# tensorflow

Builds Tensorflow 1.12 with Cuda 10.0, CuDNN 7.4.1.5. and TensorRT 5.0.2.6. Generates the python .whl filae and the C API library (libtensorflow.so)

Here's how to build an image:

```docker build -t tensorflowem --build-arg CHECKOUT_TF_SRC=1 --build-arg USE_PYTHON_3_NOT_2=1 .```

To retrieve Tensorflow libraries and/or .whl file, launch docker:

```docker run -ti -v <Use a folder to map>:<Use a folder to map to> tensorflowem bash```

WHL file will be located inside docker image at this location:

```/tmp/pip/tensorflow-<tf_version>-cp<python_version>-cp<python_version>m-linux_<linux_version>.whl```

The 2 Tensorflow libraries will be located inside docker image at this location:

```/tensorflow/bazel-out/k8-opt/bin/tensorflow/libtensorflow.so```

```/tensorflow/bazel-out/k8-opt/bin/tensorflow/libtensorflow_framework.so```
