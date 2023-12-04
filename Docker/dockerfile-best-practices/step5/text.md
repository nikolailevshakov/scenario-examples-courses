
Add environment variable key1=value1 to the existed Dockerfile:

Build the image and tag it as `sample-image`.

Run the image (create a container) named `sample-container`.

Check if environment variable key1=value1 is existed inside the container.


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
Use ENV key word.
Use -d (detached) flag when running the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Add next line to the `/root/Dockerfile`:

<br>

```plain
ENV key1=value1
```

<br>

Build the image:

<br>

```plain
docker build -t sample-image .

docker image ls
```{{exec}}

<br>

Run the image:

<br>

```plain
docker run -d --name sample-container sample-image
```{{exec}}

<br>

List environment variables inside the container:

<br>

```plain
docker exec sample-container env
```{{exec}}

</details>