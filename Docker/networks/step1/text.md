
Initiate container named `app-1`: 
* attach it to the `/root/app-1` directory on the host
* mount this bind to the `/usr/share/nginx/html` directory within the container
* utilize the `nginx:alpine` image

Initiate container named `app-2`: 
* attach it to the `/root/app-2` directory on the host
* mount this bind to the `/usr/share/nginx/html` directory within the container
* utilize the `nginx:alpine` image

Make sure that containers are attached to the default bridge network.

Make a request to app-1 and to app-2 ip address from app-2.

<br>
<details><summary>Info</summary>
<br>

```plain
Use `docker network ls` to list current networks.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -d (detached) flag when running the container.

If you do not specify any --network flags, the containers connect to the default bridge network.

Ip address of pods in the network can be found by running "docker network inspect" command.

Documentation - https://docs.docker.com/network/network-tutorial-standalone/#use-the-default-bridge-network.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Initiate `app-1` and `app-2` containers:

<br>

```plain
docker run -d -v /root/app-1:/usr/share/nginx/html --name app-1 nginx:alpine
docker run -d -v /root/app-2:/usr/share/nginx/html --name app-2 nginx:alpine
```

<br>

Run `docker network inspect bridge`:

<br>

```plain
docker network inspect bridge
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
docker exec app-1 sh -c 'curl 172.0.0.1'
```{{exec}}

</details>