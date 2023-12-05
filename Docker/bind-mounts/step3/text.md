
Append `Container's runtime data` line to the file inside the `sample-app-2` container `/home/files/file1.txt`

Check the data inside file1.txt on the host.

Append `Host's new data` line to the file on the host `/root/files/file1.txt`

Check the data inside file1.txt in the container.

Remove `sample-app-2` container.

Check the data inside `file1.txt` on the host.

<br>
<details><summary>Info</summary>
<br>

```plain
Docs https://docs.docker.com/storage/volumes/

Volume - allow to persist container's data.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -f flag to force deletion of the running container.

Use `>>` to append line to the file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Append the line  `Container's runtime data` to the file1 inside the container:

<br>

```plain
docker exec sample-app echo "Container's runtime data" >> /home/files/file1.txt
```

<br>

Cat `file1.txt` on the host:

<br>

```plain
cat /root/files/file1.txt
```{{exec}}

<br>

Append the line  `Host's new data` to the file1 on the host:

<br>

```plain
echo "Host's new data" >> /root/files/file1.txt
```{{exec}}

<br>

Cat `file1.txt` in the container:

<br>

```plain
docker exec sample-app cat /home/files/file1.txt
```{{exec}}

<br>

Remove `sample-app-2`container:

<br>

```plain
docker rm -f sample-app-2

Or

docker stop sample-app-2 && docker rm sample-app-2
```{{exec}}

<br>

Cat `file1.txt` on the host:

<br>

```plain
cat /root/files/file1.txt
```{{exec}}


</details>