## Setup a python script that connects to remote servers over ssh and does the following:
- Accept commands to be executed on all the remote machines at once
- Wait for the execution to be completed on all the remote machines
- Accept next input only once the previous execution is completed on all the machines (failed/successful)

## Pre-requisite:
1. Update the IPs.txt with the remote machine ip addresses.
2. Place the remote machine PEM file in the same folder as script (assuming same pem file is used for all the machines)

The script uses Threadpool executor to run the command on the remote machines parallely thereby improving the efficiency.
Run the script as below
## Usage:
- python3 ssh.py 