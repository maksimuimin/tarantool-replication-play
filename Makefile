build:
	docker build --tag tarantool-replication-play .

init:
	docker run -d --rm -v "./.tarantool_instance1:/tarantool" -p 3301:3301 --name tarantool_instance1  --entrypoint "/usr/local/bin/tarantool" tarantool-replication-play /tarantool_instance1.lua init
	docker run -d --rm -v "./.tarantool_instance2:/tarantool" -p 3302:3302 --name tarantool_instance2  --entrypoint "/usr/local/bin/tarantool" tarantool-replication-play /tarantool_instance2.lua init

up:
	docker run -d --rm -v "./.tarantool_instance1:/tarantool" -p 3301:3301 --name tarantool_instance1  --entrypoint "/usr/local/bin/tarantool" tarantool-replication-play /tarantool_instance1.lua
	docker run -d --rm -v "./.tarantool_instance2:/tarantool" -p 3302:3302 --name tarantool_instance2  --entrypoint "/usr/local/bin/tarantool" tarantool-replication-play /tarantool_instance2.lua

