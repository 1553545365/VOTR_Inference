#!/bin/bash
docker exec -it votr \
    /bin/bash -c "export PYTHONPATH=\"${PYTHONPATH}:/home/trainer/votr/VOTR\";
    cd /home/trainer/votr/VOTR;
    /bin/bash"

