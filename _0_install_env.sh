#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ENV_DIR=$SCRIPT_DIR/.env/yolor


reset_dir()
{
    crt_dir=$1
    if [-d $crt_dir]; then
        rm -rf $crt_dir
    fi
    mkdir -p $crt_dir
}

activate_env()
{
    env_path=$1
    source ~/anaconda3/etc/profile.d/conda.sh
    conda init bash &> /dev/null
    conda activate $env_path
    conda env list | grep $env_path

    export LD_LIBRARTY_PATH=$LD_LIBRARTY_PATH:$env_path/lib
}

create_env()
{
    env_path=$1

    conda create --yes -p $env_path python=3.9
    activate_env $env_path


    pip install -r $SCRIPT_DIR/requirements.txt 
    #pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

}


create_env $ENV_DIR