
Run the docker container named `sample-app` from the same image `nginx:alpine` 
mounted on `sample-volume` on the host and on `/usr/share/nginx/html` directory in the container.
Expose port 80.

Request localhost:80.


<br>
<details><summary>Info</summary>
<br>

```plain
Docs https://docs.docker.com/storage/volumes/

Volume - allow to persist container's data.
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

<br>

Request localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}
