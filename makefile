encrypt-files:
	echo ${VAULT_PASS} >> vault_pass 
	ansible-vault encrypt --vault-password-file vault_pass files/ssh/id_rsa ;\
	ansible-vault encrypt --vault-password-file vault_pass files/ssh/id_ed25519 ;\
	rm vault_pass

ansible-pull:
	echo ${VAULT_PASS} >> vault_pass ;\
	echo ${BECOME_PASS} >> become_pass ;\
	ansible-pull --vault-password-file vault_pass  --become-password-file become_pass -U https://github.com/ErikBPF/ansible.git ;\
	rm vault_pass ;\
	rm become_pass