
Export binary to the `/root/app/bin` as `server` using Dockerfile.

<br>
<details><summary>Info</summary>
<br>

```plain
Docs: https://docs.docker.com/build/guide/export/#export-binaries

The default format of output for build command is docker image.
But, it can be changed to binary by using `local` exporter (use `--output` flag).

```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker build -h
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Add next line to the `/root/app/Dockerfile`:

<br>

```plain
FROM scratch AS binary
COPY --from=server /bin/server /
```

<br>

Export binary:

<br>

```plain
docker build --output=/root/app/bin --target=binary /root/app/
```{{exec}}

<br>

Run the binary:

<br>

```plain
/root/app/bin/server
```{{exec}}

</details>