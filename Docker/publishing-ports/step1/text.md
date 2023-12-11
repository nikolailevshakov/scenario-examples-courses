
Initiate a container named `sample-app`:
* utilize the `nginx:alpine` image
* ensure port `80` on the host is mapped to port `80` within the container

Make a request to `localhost:80`.


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
Documentation - https://docs.docker.com/network/#published-ports.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Initiate `sample-app` container:

<br>

```plain
docker run -d -p 80:80 --name sample-app nginx:alpine
```

<br>

Make a request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}

</details>