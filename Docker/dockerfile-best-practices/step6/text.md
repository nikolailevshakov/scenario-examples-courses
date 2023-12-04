
Run the container from the same image with env variable key2=value2 and key1=new-value1.

Check env variables inside the newly created container.


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
use flag -e when running the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the image with new environment variables:

<br>

```plain
docker run -d —name sample-container2 -e key2=value2 -e key1=new-value1 sample-image
```

<br>

List environment variables inside the container:

<br>

```plain
docker exec sample-container2 env
```{{exec}}
