
Create brdige network `bridge-network`.

Detach app-1 and app-2 containers from default bridge network to the newly created `bridge-network`.

Make a request to app-1 and to app-2 ip address from app-2.


<br>
<details><summary>Info</summary>
<br>

```plain
Use -p or --publish flag to map ports.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -d (detached) flag when running the container.

If you do not specify any --network flags, the containers connect to the default bridge network.

Ip address of pods in the network can be found by running "docker network inspect" command (json path .Containers[*].IPv4Address).

Documentation - https://docs.docker.com/network/network-tutorial-standalone/#use-the-default-bridge-network.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create network `bridge-network`:
(--driver bridge is not nessecary here, as it is a default behaviour)

<br>

```plain
docker network create --driver bridge `bridge-network`
```

<br>

Disconnect `app-1` and `app-2` from the default `bridge` network:

<br>

```plain
docker network disconnect bridge app-1
&&
docker network disconnect bridge app-2
```{{exec}}

<br>

Connect `app-1` and `app-2` containers to the `bridge-network` network:

<br>

```plain
docker network connect bridge-network app-1
&&
docker network connect bridge-network app-2
```{{exec}}

<br>

Run `docker network inspect bridge-network`:

<br>

```plain
docker network inspect bridge-network
```{{exec}}

<br>

Make a request to app-1 from app-2:

<br>

```plain
docker exec app-1 sh -c 'curl app-2'
```{{exec}}

<br>

Make a request to app-1 by ip address from app-2:

<br>

```plain
docker exec app-1 sh -c 'curl 172.17.0.3'
```{{exec}}

</details>