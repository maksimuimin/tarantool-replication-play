require('strict').on()

local args = {...}
local init = (args[1] == 'init')

local cfg  = {
	instance_uuid   = 'c3eb89b9-6610-4759-85a7-20761ef1d156',
	replicaset_uuid = '069c421d-5776-449a-bb4d-f102f307c8c7',
	work_dir        = '/tarantool',
	listen          = 3302,
	replication     = {'replicator:password@localhost:3301',
					   'replicator:password@localhost:3302'},
	read_only       = true,
}

if init then
	cfg['replication']= nil
	cfg['read_only'] = false
end

box.cfg(cfg)

if init  then
	box.schema.user.create('replicator', { if_not_exists = true })
	box.schema.user.passwd('replicator', 'password')
	box.schema.user.grant('replicator', 'replication', nil, nil, {if_not_exists = true})

	os.exit(0)
end

print('Hello world from replica')
