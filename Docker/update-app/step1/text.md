
Build docker image `app/v1` from `/root/Dockerfile`.

Run the container named `app` from the created image. Expose port 3000.

Make a request to localhost:3000.


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
Use docker build and docker run commands. 

Use --help flag to see the help.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Build app/v1 image:

<br>

```plain
docker build -t app/v1 .
```{{exec}}

<br>

Launch the container while making port 3000 accessible::

<br>

```plain
docker run -d -p 3000:3000 --name app app/v1 
```{{exec}}

<br>

Make a request to localhost:3000:

<br>

```plain
curl localhost:3000
```{{exec}}

<br>
