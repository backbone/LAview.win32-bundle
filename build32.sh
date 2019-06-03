#!/bin/bash

for d in cairo-chart gobject-plugin latex-struct core data-example object-example stand_config control_point desktop table_meas; do cd $d && mkdir -p build-mingw32 && cd build-mingw32 && rm -rf * && cmake -G "MSYS Makefiles" .. -DCMAKE_BUILD_TYPE=Release && make && cpack && ./*.exe && cd ../.. || break; done
