
Initiate a container named `sample-app`:
* utilize the `nginx:alpine` image
* attach it to the `/root/app-data` directory on the host
* mount this bind to the `/usr/share/nginx/html` directory within the container
* ensure port `80` on the host is mapped to port `80` within the container

Make a request to `localhost:80`.

List files in the `/usr/share/nginx/html `directory in the container.

<br>
<details><summary>Info</summary>
<br>

```plain
If the bind mount is empty, it won't be populated by the data from the container (compare it to the volumes).
And it will clear the directory inside the container.

Documentation - https://docs.docker.com/storage/bind-mounts/#start-a-container-with-a-bind-mount.
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
Use --mount or -v flag to mount volume.

Use -d flag to run container in the detached mode.

Use the command 'curl' for making a request to localhost.

```
</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
You will got 403 error on the request to localhost:80.

There won't be any files in the /usr/share/nginx/html directory.
```
</details>


<br>
<details><summary>Solution</summary>
<br>


<br>

Run the container with the mounted directory:

<br>

```plain
docker run -d -p 80:80 --mount type=bind,src=/root/app-data,target=/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}
OR
```plain
docker run -d -p 80:80 -v /root/app-data:/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}

<br>

Make a request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}

<br>

List files in the container's directory:

<br>

```plain
docker exec sample-app sh -c "ls /usr/share/nginx/html"
```{{exec}}
