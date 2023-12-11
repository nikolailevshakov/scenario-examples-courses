
Create network `sample-network`.

Initiate a container named `sample-app-2`:
* utilize the `nginx:alpine` image
* map `localhost:81` on the host with port `80` within the container

Make a request to `localhost:81`.


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
Documentation - https://docs.docker.com/network/drivers/bridge/#differences-between-user-defined-bridges-and-the-default-bridge.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Initiate `sample-app-2` container:

<br>

```plain
docker run -d -p localhost:81:80 --name sample-app-2 nginx:alpine
```

<br>

Make a request to `localhost:81`:

<br>

```plain
curl localhost:80
```{{exec}}

</details>