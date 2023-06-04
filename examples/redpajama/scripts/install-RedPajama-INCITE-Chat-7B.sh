#!/bin/bash

# cd to scripts dir
cd `dirname $0`

# download model to models dir
echo "Downloading model"
python ./convert_gptneox_to_ggml.py togethercomputer/RedPajama-INCITE-7B-Chat ../models/pythia

# remove temp cache dir
echo "Removing temp cache dir"
rm -r ../models/pythia-cache

# quantize model
echo "Quantizing model (q4_0)"
cd ../../..
python ./examples/redpajama/scripts/quantize-gptneox.py ./examples/redpajama/models/pythia/ggml-RedPajama-INCITE-7B-Chat-f16.bin


# done!
echo "Done."
