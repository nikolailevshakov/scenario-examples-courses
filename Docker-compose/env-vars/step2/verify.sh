#!/bin/bash

# for Validator to verify as success, the script needs to exit with code 0 (no error)
# and HAS to ONLY output "done". Every other text output will be taken as error.

# NOTE: there seems to be a limit after which the Validator verify command is not valid, even
# though exit code 0 and "done" is returned. This could be after X amount of commands, or too
# long execution time, not sure why. Hence this file should be as short as possible.

LOGFILE=/ks/step1-verify.log
set -e # exit once any command fails

{
    date

    docker compose exec web 'echo $FILE_VAR' | grep "hello from the .env file"
    docker compose exec web 'echo $FILE_VAR2' | grep "hello from the env_file.env"
    docker compose exec web 'echo $FILE_VAR3' | grep "hello from the env_file2.env"

} >> ${LOGFILE} 2>&1

echo "done" # let Validator know success