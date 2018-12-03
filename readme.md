# mongodb replicaset with docker compose

* 3 nodes
* IP is fixed
* network is created externally

## How to use

```
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
