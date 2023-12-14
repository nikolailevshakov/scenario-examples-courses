
Create bridge network `bridge-network`.

Detach `app-1` and `app-2` containers from default bridge network 
and attach to the newly created `bridge-network`.

Make a request to `app-1` from `app-2`:
* by using `app-1` hostname
* by using `app-1` ip address


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/network/network-tutorial-standalone/#use-user-defined-bridge-networks.
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
Use curl -sS command to make a request.
```

</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
Ip address of pods in the network can be found by running 
"docker network inspect bridge | jq .[0].Containers".
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
docker network create --driver bridge bridge-network
```{{exec}}

<br>

Disconnect `app-1` and `app-2` from the default `bridge` network:

<br>

```plain
docker network disconnect bridge app-1 \
&& \
docker network disconnect bridge app-2
```{{exec}}

<br>

Connect `app-1` and `app-2` containers to the `bridge-network` network:

<br>

```plain
docker network connect bridge-network app-1 \
&& \
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
docker exec app-2 sh -c 'curl -sS app-1'
```{{exec}}

<br>

Make a request to app-1 by ip address from app-2:

<br>

```plain
docker exec app-2 sh -c 'curl -sS 172.18.0.2'
```{{exec}}

</details>