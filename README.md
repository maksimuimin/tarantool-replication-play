# Tarantool replication play

Setting up tarantool with replication from scratch is usually a pain.
Each tarantool instance HAS TO be initialized (internal spaces creation)
before connecting to replicas. This requires rw mode and no replication config.

I had split up the startup into init phase and run phase. Try it yourself:
```bash
# Build docker image
make

# Init tarantool (all content is stored in empty directories using volumes)
make init

# Run tarantool
make up
```
