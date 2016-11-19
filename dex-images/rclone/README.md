# rclone for dex

## usage

```sh
$ dex run rclone config
# ^^^ answer prompts, subsequent commands to rclone will use saved configuration
#     in our example we creats a remote named "remote"

$ dex run rclone listremotes
remote:

$ cd $(mktemp -d)
$ for i in {1..7}; do touch $i; done
$ dex run rclone sync . remote:bucket/subfolder
$ dex run rclone sync . remote:bucket/subfolder
$ dex run rclone ls remote:bucket/subfolder
0 1
0 4
0 2
0 3
0 7
0 5
0 6
```

> `dex install rclone` will allow you to execute `rclone <cmd>` instead of `dex run rclone <cmd>`
