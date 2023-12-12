
Create host network `host-network`.

Detach app-1 container from `bridge-network` network to the newly created `host-network`.

Make a request to localhost:80.


<br>
<details><summary>Info</summary>
<br>

```plain
If you use the host network mode for a container, that container's network stack isn't isolated from the Docker host (the container shares the host's networking namespace), and the container doesn't get its own IP-address allocated.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -d (detached) flag when running the container.

Use --network flag to create host network.

Ip address of pods in the network can be found by running "docker network inspect".
Make a note that app-1 container doesn't have an ip address.

Documentation - https://docs.docker.com/network/drivers/host/.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create network `host-network`:

<br>

```plain
docker network create --driver host host-network
```{{exec}}

<br>

Disconnect `app-1` from the `bridge-network` network:

<br>

```plain
docker network disconnect bridge-network app-1
```{{exec}}

<br>

Connect `app-1` container to the `host-network` network:

<br>

```plain
docker network connect host-network app-1
```{{exec}}

<br>

Make a request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}


</details>