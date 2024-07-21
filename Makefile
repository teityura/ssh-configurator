default: deploy

deploy:
	ansible-playbook setup_ssh.yml
	ansible-playbook setup_users.yml

ssh:
	ansible-playbook setup_ssh.yml

user:
	ansible-playbook setup_users.yml

clean:
	@echo "Are you sure you want to delete everything? [yes/no]" && read ans; \
	if [ "$$ans" = "yes" ]; then \
		ansible-playbook clean.yml; \
	else \
		echo "Deletion canceled."; \
	fi
