#!/bin/bash

cd "$(dirname "$0")"
cd ..

workspace_dir=$PWD

if [ "$(docker ps -aq -f status=exited -f name=votr)" ]; then
    docker rm votr;
fi

docker run -it -d --rm \
    --gpus '"device=0"' \
    --net host \
    -e "NVIDIA_DRIVER_CAPABILITIES=all" \
    -e "DISPLAY" \
    -e "QT_X11_NO_MITSHM=1" \
    --shm-size="45g" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name votr \
    -v $workspace_dir/:/home/trainer/votr:rw \
    -v /datasets/waymo_perception/tfrecord_training/:/home/trainer/votr/VOTR/data/waymo/raw_data:rw \
    -v /datasets/waymo_perception/:/home/trainer/votr/VOTR/data/waymo:rw \
    x64/fmf:latest

docker exec -it votr \
    /bin/bash -c "export PYTHONPATH=\"${PYTHONPATH}:/home/trainer/votr/VOTR\";
    cd /home/trainer/votr/VOTR;
    python3 setup.py develop;"



# gsutil -m cp -r \
#   "gs://waymo_open_dataset_v_1_2_0_individual_files/training/" \
#   .
