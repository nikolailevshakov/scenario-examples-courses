
Run the docker container named `sample-app` from image `nginx:alpine` 
mounted on `/home/app-data` on the host and on `/usr/share/nginx/html` directory in the container.
Expose port 80.

Request localhost:80.

Rewrite /usr/share/nginx/html/index.html file with `<h1>Hello from the updated App</h1>`

Request localhost:80.

Remove sample-app container.

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
docker run -d -p 80:80 --mount type=bind,src=/home/app-data,target=/usr/share/nginx/html --name sample-app nginx:alpine
or
docker run -d -p 80:80 -v /home/app-data:/usr/share/nginx/html --name sample-app nginx:alpine

```{{copy}}

<br>

Request localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}

<br>

Rewrite index.html file:

<br>

```plain
docker exec sample-app sh -c "echo '<h1>Hello from the updated App</h1>' > /usr/share/nginx/html/index.html"
```{{exec}}

<br>

Request localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}

<br>

Remove the `sample-app` container:

<br>

```plain
docker rm -f sample-app
Or
docker stop sample app && docker rm sample-app
```{{copy}}