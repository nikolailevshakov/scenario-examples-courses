Initiate a container named `sample-app`:
* utilize the `nginx:alpine` image
* attach it to the `sample-volume`
* mount this volume to the `/usr/share/nginx/html` directory within the container
* ensure port `80` on the host is mapped to port `80` within the container

Make a request to localhost:80.


<br>
<details><summary>Info</summary>
<br>

```plain
Volume is populated by data from container, if the volume is empty - https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container.
Otherwise, the data in the container is going to be replaced by volume's data.

Use docker volume --help - to see how to work with volumes.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use flag -v or --mount when running the container - https://docs.docker.com/storage/volumes/#choose-the--v-or---mount-flag.

Be carefull where on the container you mount the volume.
As all of the data will be replaced by the data from the volume, if the volume is not empty.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container with mounted volume:
(type=volume is not necessary, as it as a default behavior)

<br>

```plain
docker run -d -p 80:80 --mount type=volume,src=sample-volume,target=/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}
OR
```plain
docker run -d -p 80:80 --mount -v sample-volume:/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}

<br>

Make a request to localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}
