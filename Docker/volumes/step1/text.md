
Create docker volume named `sample-volume`.

Run the docker container named `sample-app` from image `nginx:alpine` 
mounted on `sample-volume` on the host and on `/usr/share/nginx/html` directory in the container.
Expose port 80.

Request localhost:80.

<br>
<details><summary>Info</summary>
<br>

```plain
Volume is populated by data from container - https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container.

Use docker volume --help - to see how to work with volumes.
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

Create volume:

<br>

```plain
docker volume create sample-volume
```{{exec}}


<br>

Run the container with the mounted directory:

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