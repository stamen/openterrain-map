# openterrain-map

A work-in-progress map using OpenTerrain data.

## Initialization

This uses [yas3fs](https://github.com/danilop/yas3fs), a FUSE interface to
Amazon S3. You'll need to install FUSE, [OSXFUSE](https://osxfuse.github.io/),
for example.

```bash
# for listing the contents of the bucket
export AWS_ACCESS_KEY_ID=<redacted>
export AWS_SECRET_ACCESS_KEY=<redacted>

# includes https://github.com/danilop/yas3fs/pull/79
sudo pip install https://github.com/danilop/yas3fs/archive/master.zip

# work-around for https://github.com/boto/boto/issues/2836
cat <<EOF >> ~/.boto
[s3]
calling_format = boto.s3.connection.OrdinaryCallingFormat
EOF

# "mount" the bucket
yas3fs --read-only --cache-path ~/.cache/yas3fs --no-metadata s3://data.stamen.com/srtm srtm/
```

## Working in TileMill

```bash
make link
make
```

...open in TileMill.

## Serving Up Tiles

```bash
npm install
npm start
```

...visit [http://localhost:8080/](http://localhost:8080/)
