wirvonhier:
	echo	server	client	proxy	mongo	|	xargs	-n1	|	xargs	-I{}	git	clone	https://github.com/wirvonhier/{} {}\
	&&	make	setup	\
	&&	make	install
setup:
	docker	volume	create	client_nodemodules	&&	docker	volume	create	server_nodemodules
install:
	make client-install && make server-install
client-install:
	docker-compose	-f	docker-compose.builder.yml	run	--rm	client-install
client-install-fix:
	docker-compose	-f	docker-compose.builder.yml	run	--rm	client-install-fix
server-install:
	docker-compose	-f	docker-compose.builder.yml	run	--rm	server-install
server-install-fix:
	docker-compose	-f	docker-compose.builder.yml	run	--rm	server-install-fix
dev:
	docker-compose	up
