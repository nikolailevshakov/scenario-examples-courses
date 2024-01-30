
1. Create docker image `sleep-image` with entrypoint sleep and cmd 1.
2. Run the container.
3. Run the conainer from the same image, but change cmd from 1 to 5.
4. Run the continer from the same image, but change entrypoint to echo.


<br>
<details><summary>Info</summary>
<br>

```plain
Docs:
- https://docs.docker.com/engine/reference/builder/#cmd
- https://docs.docker.com/engine/reference/builder/#entrypoint
- https://docs.docker.com/develop/develop-images/instructions/#cmd
- https://docs.docker.com/develop/develop-images/instructions/#entrypoint

In a nutshell, entrypoint is a binary and cmd contains parameters. You can override both parameters when you run the container.
In a majority of images entrypoint is 'sh' '-c', therefore you can just define CMD.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker build -h
Use docker run -h
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create `/root/Dockerfile`:

<br>

```plain
cat >> /root/Dockerfile <<EOF
FROM alpine
ENTRYPOINT ["sleep"]
CMD ["1"]
EOF
```{{copy}}

<br>

Build the image:

<br>

```plain
docker build -t sleep-image .

docker image ls
```{{exec}}

<br>

Run the container:

<br>

```plain
docker run --rm --name sleep-container sleep-image
```{{exec}}

<br>

Run the container with updated command:

<br>

```plain
docker run --rm --name sleep-container sleep-image 5
```{{exec}}

<br>

Run the container with updated entrypoint:

<br>

```plain
docker run --rm --entrypoint echo --name sleep-container sleep-image
```{{exec}}

</details>