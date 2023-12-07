
Run the docker container named `sample-app` from image `nginx:alpine` 
mounted on `/home/app-data` on the host and on `/usr/share/nginx/html` directory in the container.
Expose port 80.

Request localhost:80.

List files in the /usr/share/nginx/html directory in the container.

<br>
<details><summary>Info</summary>
<br>

```plain
Volume is populated by data from container - https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container.

Use `docker volume --help` - to see how to work with volumes.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use --mount flag when running the container to be more explicit (it's a recommended way according to the documentation).

Or use -v flag for a more concise command.
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
```{{copy}}
Or
```plain
docker run -d -p 80:80 -v /root/app-data:/usr/share/nginx/html --name sample-app nginx:alpine
```{{copy}}

<br>

Request localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}

<br>

List files in the directory:

<br>

```plain
docker exec sample-app sh -c "ls /usr/share/nginx/html"
```{{exec}}
