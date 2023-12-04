
Build docker image app/v1 from Dockerfile, run the container, check logs of the container.


<br>
<details><summary>Info</summary>
<br>

```plain
Dockerfile: List of commands from which an Image can be build

Image: Binary file which includes all data/requirements to be run as a Container

Container: Running instance of an Image
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker build, docker run and docker logs commands. User -h flag to see the help.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Add next line to the `/root/Dockerfile`:

<br>

```plain
docker build -t app/v1 .
```

<br>

Build the image:

<br>

```plain
docker run -d —name app app/v1 
```{{exec}}

<br>

Run the image:

<br>

```plain
docker logs app
```{{exec}}
