#!/bin/bash

# cd to working directory
cd ${duplicacy_working_directory}

# env
%{ for key, value in duplicacy_env }
export ${key}="${value}"
%{ endfor }

# env prune
%{ for key, value in duplicacy_env_prune }
export ${key}="${value}"
%{ endfor }

# env special
%{ for key, value in duplicacy_env_special }
export ${key}="${value}"
%{ endfor }

# initialize prune.log
echo >prune.log

# pre prune
status=0
if [ -f ${duplicacy_script_file_path}/${duplicacy_pre_prune_script_file_name} ]; then
    echo $(date "+%Y-%m-%d %H:%M:%S.%3N") INFO SCRIPT_RUN Running script ${duplicacy_script_file_path}/${duplicacy_pre_prune_script_file_name} |\
        tee --append prune.log
    bash ${duplicacy_script_file_path}/${duplicacy_pre_prune_script_file_name}
    status=$?
fi

if [ $status != 0 ]; then
    echo $(date "+%Y-%m-%d %H:%M:%S.%3N") ERROR SCRIPT_RUN Status code "'"$status"'" from script ${duplicacy_script_file_path}/${duplicacy_pre_prune_script_file_name} |\
        tee --append prune.log
else
# prune
    ${duplicacy_path}/bin/duplicacy -log prune ${duplicacy_prune_options} |\
        tee --append prune.log
fi

# post prune
if [ -f ${duplicacy_script_file_path}/${duplicacy_post_prune_script_file_name} ]; then
    bash ${duplicacy_script_file_path}/${duplicacy_post_prune_script_file_name}
    status=$?
    exit $status
fi
