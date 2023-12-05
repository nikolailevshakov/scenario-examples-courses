
Build docker image `app/v1` from `/root/Dockerfile`.

Run the container `app` from the created image. Expose port 5000.

Curl localhost:5000.


<br>
<details><summary>Info</summary>
<br>

```plain

To run container with exposed port use -p flag.

```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use `docker build` and `docker run` commands. 
Use --help flag to see the help.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Build app/v1 image

<br>

```plain
docker build -t app/v1 .
```

<br>

Run the container with exposed port 5000.

<br>

```plain
docker run -d -p 5000:5000 —name app app/v1 
```{{exec}}

<br>

Curl localhost:5000:

<br>

```plain
curl localhost:5000
```{{exec}}

<br>
