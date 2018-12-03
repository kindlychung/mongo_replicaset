# mongodb replicaset with docker compose

This recipe provides a 3-node replicaset.

On the fix-ip branch:

* IP is fixed
* network is created externally

On the floating-ip branch:

* IP is automatically set by docker
* Network is automatically created by docker

## How to use

### When you are on the fixed-ip branch

```bash
create_network.sh 
docker-compose up
docker exec -it localmongo1 mongo # start a mongo shell in the first node
# in the mongoshell
rs.initiate({_id: "rs0", members: [
    {_id: 0, host: "localmongo1:27017", priority: 1.0},
    {_id: 1, host: "localmongo2:27017", priority: 0.5},
    {_id: 2, host: "localmongo3:27017", priority: 0.5}
]})	
```

### When you are on the floating-ip branch

```bash
docker-compose up
docker exec -it localmongo1 mongo # start a mongo shell in the first node
# in the mongoshell
rs.initiate({_id: "rs0", members: [
    {_id: 0, host: "localmongo1:27017", priority: 1.0},
    {_id: 1, host: "localmongo2:27017", priority: 0.5},
    {_id: 2, host: "localmongo3:27017", priority: 0.5}
]})	
```
