
Create Dockerfile with `alpine` image and environment variable `key1=value1``.

Build the image and tag it as `sample-image`.

Create a container named `sample-app`.

Check if environment variable `key1=value1` exists inside the container.


<br>
<details><summary>Info</summary>
<br>

```plain
Dockerfile: List of commands from which an Image can be build

Image: Binary file which includes all data/requirements to be run as a Container

Container: Running instance of an Image

Use docker --help to see the list of commands.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use ENV key word.
Use -d (detached) flag when running the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create `/root/Dockerfile`:

<br>

```plain
FROM alpine
ENV key1=value1
```

<br>

Build the image:

<br>

```plain
docker build -t sample-image .
```{{exec}}

<br>

Run the image:

<br>

```plain
docker run -d --name sample-app sample-image
```{{exec}}

<br>

List environment variables inside the container:

<br>

```plain
docker exec sample-app env
```{{exec}}

</details>