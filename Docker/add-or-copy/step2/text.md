
Modify Docker file:
- by coping file.txt
- downloading file https://filesamples.com/samples/code/go/sample2.go

Build image, run the container.


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/develop/develop-images/instructions/#add-or-copy
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
COPY is used to copy files and directories.
ADD is used to fetch files, it's recommended to use ADD instead of RUN wget, for instance, because it ensures a more precise build cache.
ADD also has built-in support for checksum validation of the remote resources, and a protocol for parsing branches, tags, and subdirectories from Git URLs.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Modify `/root/Dockerfile`:

<br>

```plain
COPY file.txt .
ADD https://filesamples.com/samples/code/go/sample2.go
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


</details>