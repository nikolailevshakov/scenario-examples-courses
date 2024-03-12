
Run services in the `/root/compose.yml` file.
Curl `web-1` service from `web-2` by the name of the service.
Curl `web-1` from the host.

<br>
<details><summary>Info</summary>
<br>

```plain
Used ports can be founded in the compose.yml file.
Documentation - https://docs.docker.com/compose/networking/.
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
When you don't provide a network for the containers the default one named root_default in this case (root is the parent directory to the compose.yml file) is being created.
Also, services inside the network can be referenced by the name of the service.
```

<br>
<details><summary>Tip 2</summary>
<br>

```plain
Make sure that you are not confused with host and container ports.
Host port is first, container port is second.
In our case web-1 service uses: 8001 port as a host port that is open from the host and 8002 port that is open inside the network.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the services:

<br>

```plain
docker compose up -d
```{{exec}}


<br>

Sh to the web-2 service:

<br>

```plain
docker exec -it web-2 sh
```{{exec}}

<br>

Curl web-1 service:

<br>

```plain
curl web-1:8002
```{{exec}}

<br>

Exit web-2 service

<br>

```plain
exit
```{{exec}}

<br>

Curl web-1 service:

<br>

```plain
curl localhost:8001
```{{exec}}