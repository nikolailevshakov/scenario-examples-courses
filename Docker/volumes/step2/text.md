
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
Use flag -v when running the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container with mounted volume:

<br>

```plain
docker run -d -p 80:80 --mount type=volume,src=sample-volume,target=/usr/share/nginx/html --name sample-app nginx:alpine
```

<br>

Request localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}
