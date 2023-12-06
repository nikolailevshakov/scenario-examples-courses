
Run the container `sample-app-2` from the same image `sample-image` with env variable `key2=value2` and `key1=new-value1`.
Doesn't change the Dockerfile.

Check env variables inside the newly created container.


<br>
<details><summary>Info</summary>
<br>

```plain
Environment variables in Docker:
https://docs.docker.com/develop/develop-images/instructions/#env.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -e flag when running the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the image with new environment variables:

<br>

```plain
docker run -d —name sample-app-2 -e key2=value2 -e key1=new-value1 sample-image
```{{exec}}

<br>

List environment variables inside the container:

<br>

```plain
docker exec sample-app-2 env
```{{exec}}
