
Run a container `sample-app-2` with mounted volume (using -v), with image `nginx:alpine`.
Host's directory - `/root/files`, container's directory - `/home/files`.

List files inside the container in the mounted directory.

Inspect created volume.


<br>
<details><summary>Info</summary>
<br>

```plain
Docs https://docs.docker.com/storage/volumes/

Volume - allow to persist container's data.

In this task we basically doing the same that we did on the previous step.
But as we don't create volume implicitly, we provide the path for the host's mounted point.
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
docker run -d --name sample-app-2 -v /root/files:/home/files nginx:alpine
```

<br>

List files inside the mounted directory in the container:

<br>

```plain
docker exec sample-app-2 ls /home/files
```{{exec}}

<br>

Inspect created volume:

<br>

```plain
docker volume inspect 
```{{exec}}
