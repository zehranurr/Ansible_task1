# Inventory.ini detail 
[ubuntu_containers]
Ansible’ın bu sunucuları tanıyacağı bir grup adı tanımlar. Bu gruptaki sunuculara, playbook dosyasında hosts: ubuntu_containers yazarak ulaşabilirsiniz. Buradaki grup adı, playbook’ların hangi sunuculara uygulanacağını belirlemek için kullanılır.


Her satır, ubuntu1, ubuntu2 ve ubuntu3 adlı üç farklı sunucuyu (veya konteyneri) tanımlar. Her sunucu için şu parametreler verilmiştir:

ansible_host=localhost: Ansible, bu sunucuların her birine localhost üzerinden bağlanacak. Bu genellikle konteynerlerin veya sanal makinaların aynı ana makine üzerinde çalıştığını gösterir.

ansible_port: Ansible, belirtilen porta göre her sunucuya bağlanacak. ubuntu1 için 2222, ubuntu2 için 2223, ubuntu3 için 2224 portları kullanılmıştır. Bu, her konteynerin farklı SSH portları üzerinden erişildiğini gösterir.

ansible_user=root: Ansible, her sunucuya bağlanırken root kullanıcısını kullanacak. Bu kullanıcı, görevleri çalıştırırken gerekli izinlere sahip olacaktır.

ansible_ssh_pass=password: Ansible, SSH bağlantısını gerçekleştirmek için password ifadesiyle belirtilen parolayı kullanacak.

ansible_ssh_common_args='-o StrictHostKeyChecking=no': SSH bağlantılarında, anahtar doğrulama kontrolünü devre dışı bırakmak için bu parametre eklenmiştir. StrictHostKeyChecking=no, Ansible’ın her bağlantı sırasında güvenlik anahtarını otomatik olarak kabul etmesini sağlar, bu da test ortamlarında ve ilk bağlantılarda bağlantıyı kolaylaştırır.





Başlatmak için  ansible-playbook -i inventory.ini setup.yml


It should look like :

PLAY [ubuntu_containers] *******************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
ok: [ubuntu2]
ok: [ubuntu3]
ok: [ubuntu1]

TASK [Update apt packages] *****************************************************************************************************************************
ok: [ubuntu1]
ok: [ubuntu3]
ok: [ubuntu2]

TASK [Install dependencies] ****************************************************************************************************************************
ok: [ubuntu1]
ok: [ubuntu2]
ok: [ubuntu3]

TASK [Install Kafka] ***********************************************************************************************************************************
changed: [ubuntu3]
changed: [ubuntu2]
changed: [ubuntu1]

TASK [Install python3-venv package] ********************************************************************************************************************
ok: [ubuntu3]
ok: [ubuntu2]
ok: [ubuntu1]

TASK [Create a virtual environment] ********************************************************************************************************************
changed: [ubuntu1]
changed: [ubuntu2]
changed: [ubuntu3]

TASK [Install Ray in virtual environment] **************************************************************************************************************
changed: [ubuntu3]
changed: [ubuntu2]
changed: [ubuntu1]

TASK [Verify Ray installation] *************************************************************************************************************************
changed: [ubuntu1]
changed: [ubuntu2]
changed: [ubuntu3]

TASK [Print Ray version] *******************************************************************************************************************************
ok: [ubuntu1] => {
    "msg": "Ray version installed: ray, version 2.38.0"
}
ok: [ubuntu2] => {
    "msg": "Ray version installed: ray, version 2.38.0"
}
ok: [ubuntu3] => {
    "msg": "Ray version installed: ray, version 2.38.0"
}

PLAY RECAP *********************************************************************************************************************************************ubuntu1                    : ok=9    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu2                    : ok=9    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu3                    : ok=9    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0