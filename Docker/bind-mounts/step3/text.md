
Run the docker container named `sample-app` from the same image `nginx:alpine` 
mounted on /root/app-data on the host and on `/usr/share/nginx/html` directory in the container.
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

```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container with mounted volume:

<br>

```plain
docker run -d -p 80:80 --mount type=bind,src=/root/app-data,target=/usr/share/nginx/html --name sample-app nginx:alpine
or
docker run -d -p 80:80 -v /root/app-data:/usr/share/nginx/html --name sample-app nginx:alpine

```{{copy}}

<br>

Request localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}
