
Use CMD and ENTRYPOINT to run the same `echo "hi, from container!"` command.
Build image from /root/Dockerfile and name it `image-echo`.
Check what is cmd and entrypoint of the newly created `image-echo` image.

Run the container from the `image-echo`:
- with default cmd and entrypoint values
- with another message `hi, from the updated image`
- with entrypoint `date`


<br>
<details><summary>Info</summary>
<br>

```plain
Docs:
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
Use docker run -h
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Modify `/root/Dockerfile`:

<br>

```plain
cat > /root/Dockerfile <<EOF
FROM alpine
ENTRYPOINT ["echo"]
CMD ["hi, from container!"]
EOF
```{{exec}}

<br>

Build docker image `/root/Dockerfile`:

<br>

```plain
docker build -t image-echo /root/
```{{exec}}

<br>

Explore cmd and entrypoint of `image-echo`:

<br>

```plain
docker inspect image-echo | grep cmd, entrypoint
```{{exec}}

<br>

Run the container with default values:

<br>

```plain
docker run --rm image-echo
```{{exec}}

<br>

Run the container with updated message:

<br>

```plain
docker run --rm image-echo -- echo "hi, from the updated image"
or
docker run --rm --cmd "echo hi, from the updated image" image-echo
```{{copy}}

<br>

Run the container with entrypoint `date`:

<br>

```plain
docker run --rm --entrypoint date image-echo
```{{exec}}


</details>