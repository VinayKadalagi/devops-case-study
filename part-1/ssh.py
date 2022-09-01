from multiprocessing.pool import ThreadPool
import paramiko
ip_add = []

def ssh_to_host(host):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, username='ubuntu', key_filename='newacc-server.pem')
    print('Connected to ' + host + ', Executing '+ cmd)
    stdin, stdout, stderr = ssh.exec_command(cmd)
    while not stdout.channel.exit_status_ready():
        if stdout.channel.recv_stderr_ready:
            for error in stderr.readlines():
                print (error)
        if stdout.channel.recv_ready():
            for output in stdout.readlines():
                print (output)
    stdin.close()
    ssh.close()

def main():
    global cmd
    cmd = input ("Enter the command to be executed on the servers in IPs.txt: -->  ")
    ips = open('IPs.txt')    
    for ip in ips:
        ip_add.append(ip.strip())
    executor = ThreadPool(10)
    executor.map(ssh_to_host, ip_add)
    executor.close()
    executor.join()

main()