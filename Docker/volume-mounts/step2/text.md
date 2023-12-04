
Run a container with mounted volume, with image sample-image.

Check the files in the mounted directory.


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
use -v flag
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run container with mounted volume:

<br>

```plain
docker run -d —name app -v sample-image
```

<br>

Check if you can access the file inside the container:

<br>

```plain
docker exec nginx-container ls /root/v
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