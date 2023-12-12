
Firstly, initiate container named `app-1`: 
* mount `/root/app-1` directory on the host to the `/usr/share/nginx/html` directory within the container
* utilize the `nginx:alpine` image

Secondly, initiate container named `app-2`: 
* mount `/root/app-2` directory on the host to the `/usr/share/nginx/html` directory within the container
* utilize the `nginx:alpine` image

Make sure that containers are attached to the default bridge network.

Make a request to `app-1` from `app-2`:
* by using app-1 hostname
* by using app-2 ip address

<br>
<details><summary>Info</summary>
<br>

```plain
Use "docker network ls" to list current networks.

If you do not specify any --network flags, the containers connect to the default bridge network.

Documentation - https://docs.docker.com/network/network-tutorial-standalone/#use-the-default-bridge-network.
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

Initiate `app-1` and `app-2` containers:

<br>

```plain
docker run -d -v /root/app-1:/usr/share/nginx/html --name app-1 nginx:alpine
&&
docker run -d -v /root/app-2:/usr/share/nginx/html --name app-2 nginx:alpine
```{{exec}}

<br>

List information about the network:

<br>

```plain
docker network inspect bridge
```{{exec}}

<br>

Make a request to app-1 from app-2:

<br>

```plain
docker exec app-1 sh -c 'curl -sS app-2'
```{{exec}}

<br>

Make a request to app-1 by ip address from app-2:

<br>

```plain
docker exec app-1 sh -c 'curl -sS 172.17.0.3'
```{{exec}}

</details>