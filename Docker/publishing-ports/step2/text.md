
Firstly, initiate container named `app-2`: 
* mount `/root/app-2` directory on the host to the `/usr/share/nginx/html` directory within the container
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
Documentation - https://docs.docker.com/network/#published-ports.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Initiate `app-2` container:

<br>

```plain
docker run -d -p 127.0.0.1:81:80 --name app-2 nginx:alpine
```{{exec}}

<br>

Make a request to `localhost:81`:

<br>

```plain
curl localhost:80
```{{exec}}

</details>