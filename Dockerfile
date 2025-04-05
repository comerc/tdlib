FROM ubuntu:noble
# 24.04 LTS

RUN apt-get update && \
    apt-get install -y make git zlib1g-dev libssl-dev gperf php-cli cmake clang-18 libc++-18-dev libc++abi-18-dev

RUN git clone https://github.com/tdlib/td.git && \
    cd td && \
    rm -rf build && \
    mkdir build && \
    cd build && \
    CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-18 CXX=/usr/bin/clang++-18 cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX:PATH=../tdlib .. && \
    cmake --build . --target install
