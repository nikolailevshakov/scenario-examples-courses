
Remove CMD command from Dockerfile and add ENTRYPOINT command that will run the same command.
Build image from /root/Dockerfile and name it `entrypoint-echo`.
Check what is cmd and entrypoint of the newly created `entrypoint-echo` image.

Run the container from the `entrypoint-echo`:
- with default cmd and entrypoint values
- with another message `hi, from the updated image`
- with entrypoint `date`


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/engine/reference/builder/#entrypoint

You can use the ENTRYPOINT to set fairly stable default commands 
and arguments and then use either form of CMD to set additional defaults that are more likely to be changed.

```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker run --rm cmd-image to remove container after it finished.
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
ENTRYPOINT ["echo", "hi, from container!"]
EOF
```{{exec}}

<br>

Build docker image `/root/Dockerfile`:

<br>

```plain
docker build -t entrypoint-echo /root/
```{{exec}}

<br>

Explore cmd and entrypoint of `alpine` and `entrypoint-echo`:

<br>

```plain
docker inspect alpine | grep cmd, entrypoint
docker inspect entrypoint-echo | grep cmd, entrypoint
```{{exec}}

<br>

Run the container with default values:

<br>

```plain
docker run --rm entrypoint-echo
```{{exec}}

<br>

Run the container with updated message:

<br>

```plain
docker run --rm entrypoint-echo -- echo "hi, from the updated image"
or
docker run --rm --cmd "echo hi, from the updated image" entrypoint-echo
```{{copy}}

<br>

Run the container with entrypoint `date`:

<br>

```plain
docker run --rm --entrypoint date entrypoint-echo
```{{exec}}


</details>